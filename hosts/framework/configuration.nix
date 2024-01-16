# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware/hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable swap on luks
  boot.initrd.luks.devices."luks-c3e3bc23-3e5e-4e19-8042-5b4750ee20ab".device = "/dev/disk/by-uuid/c3e3bc23-3e5e-4e19-8042-5b4750ee20ab";
  boot.initrd.luks.devices."luks-c3e3bc23-3e5e-4e19-8042-5b4750ee20ab".keyFile = "/crypto_keyfile.bin";

  networking.hostName = "framework"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Zurich";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver = {
	enable = true;
	layout = "us";    
	xkbVariant = "dvorak-alt-intl";

	displayManager = {
		sddm = {
			enable = true;
			wayland.enable = true;
			theme = "${import ../../pkgs/sddm-theme {inherit pkgs; }}";
		};
	};
  };

  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;

  programs.hyprland.enable = true;

  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs; [
    intel-media-driver
  ];

   services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=hibernate
	HandlePowerKeyLongPress=reboot
  '';

  programs.dconf.enable = true;
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  nix.settings = {
    keep-outputs = true;
    keep-derivations = true;
  };

  environment.pathsToLink = [
    "/share/nix-direnv"
  ];

  environment.localBinInPath = true;

  services.gnome.gnome-keyring.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.fwupd.enable = true;

  security.pam.services = {
	swaylock = {
		text = ''
		  auth include login
		'';
	};
  };


  # Configure console keymap
  console.keyMap = "dvorak";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  # sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  programs.zsh.enable = true;
  programs.direnv.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dhuber = {
    isNormalUser = true;
    description = "Dennys Huber";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      firefox
      alacritty
	  kitty
      pcmanfm
      nextcloud-client
      zotero
      okular
      starship
      # neovim
      gnome.networkmanager-vpnc
	  networkmanager-openvpn
	  celluloid
      networkmanagerapplet
      signal-desktop
      spotify
      wofi
      brave
      hyprpaper
      hyprpicker
      dunst
      xdg-desktop-portal-hyprland
	  nixfmt
      hyprland-protocols
      gnome.gnome-keyring
      polkit_gnome
      pavucontrol
      playerctl
      brightnessctl
      wdisplays
      sway-contrib.grimshot
      swaylock
	  swayidle
      mpv
      vscode.fhs
      deluge-gtk
      vimiv-qt
	  nix-prefetch-git
	  pnmixer
	  volumeicon
	  usbutils
	  beeper
	  nixd
	  swaynotificationcenter
	  waybar
	  foliate
	  btop
    ];
  };



  fonts.packages = with pkgs; [
    noto-fonts
	terminus_font
    terminus-nerdfont
    cantarell-fonts
    font-awesome
	intel-one-mono
	(import ../../pkgs/intel-one-mono-nerd-font {inherit lib stdenvNoCC fetchurl unzip;})
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # xdg.portal.configPackages = [pkgs.xdg-desktop-portal-hyprland];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim 
    gitFull
    fprintd
    eza
    fzf
    neofetch
    pulseaudio
    htop
    gnumake
    wget
    rsync
    nix-direnv 
    unzip
	ripgrep
	qt6.qtwayland
	libsForQt5.qt5.qtwayland
	tmux
	fd
	zip
	libsForQt5.qt5.qtquickcontrols2
	libsForQt5.qt5.qtgraphicaleffects
	libsForQt5.qt5.qtsvg
	wl-clipboard
	swappy
	imagemagick
	bc
	nurl
  ];

  services.fprintd = {
    enable = true;
  };

  services.tlp.enable = true;
  powerManagement =
    {
      enable = true;
    };

 programs.tmux = {
    enable = true;
    shortcut = "a";
    baseIndex = 1;
    newSession = true;
	clock24 = true;
	keyMode = "vi";

    # Stop tmux+escape craziness.
    escapeTime = 0;

	plugins = with pkgs; [
		tmuxPlugins.resurrect
    ];

    extraConfig = ''
		set -g history-limit 20000

		bind s split-window -v
		bind v split-window -h
		bind t new-window -c '#{pane_current_path}'
		bind r command-prompt -I '#S' 'rename-session "%%"'

		# Enable mouse control (clickable windows, panes, resizable panes)
		set -g mouse on

		set-option -g status-style "bg=default, fg=blue"

		setw -g window-status-format ' #I:#W '
		setw -g window-status-current-format ' #I:[#W] '
		set-option -g status-left "[#S]"
		set -g status-right "%Y-%m-%d %H:%M #H"
    '';
  };

security.pam.services.login.fprintAuth = false;
# similarly to how other distributions handle the fingerprinting login
security.pam.services.gdm-fingerprint = pkgs.lib.mkIf (config.services.fprintd.enable) {
      text = ''
        auth       required                    pam_shells.so
        auth       requisite                   pam_nologin.so
        auth       requisite                   pam_faillock.so      preauth
        auth       required                    ${pkgs.fprintd}/lib/security/pam_fprintd.so
        auth       optional                    pam_permit.so
        auth       required                    pam_env.so
        auth       [success=ok default=1]      ${pkgs.gnome.gdm}/lib/security/pam_gdm.so
        auth       optional                    ${pkgs.gnome.gnome-keyring}/lib/security/pam_gnome_keyring.so

        account    include                     login

        password   required                    pam_deny.so

        session    include                     login
        session    optional                    ${pkgs.gnome.gnome-keyring}/lib/security/pam_gnome_keyring.so auto_start
      '';
    };



services.gvfs.enable = true; # Mount mtp devices (Phones) for pcmanfm

xdg.portal.config.common.default = "*";

nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "--delete-older-than 14d";
};

documentation.man = {
    enable = true;
    generateCaches = true;
  };

nix.settings.auto-optimise-store = true;

      # Some programs need SUID wrappers, can be configured further or are
      # started in user sessions.
      # programs.mtr.enable = true;
      # programs.gnupg.agent = {
      #   enable = true;
      #   enableSSHSupport = true;
      # };

      # List services that you want to enable:

      # Enable the OpenSSH daemon.
      # services.openssh.enable = true;

      # Open ports in the firewall.
      # networking.firewall.allowedTCPPorts = [ ... ];
      # networking.firewallallowedUDPPorts = [ ... ];
      # Or disable the firewall altogether.
      # networking.firewall.enable = false;

      # This value determines the NixOS release from which the default
      # settings for stateful data, like file locations and database versions
      # on your system were taken. It‘s perfectly fine and recommended to leave
      # this value at the release version of the first install of this system.
      # Before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      system.stateVersion = "23.11"; # Did you read the comment?

}
