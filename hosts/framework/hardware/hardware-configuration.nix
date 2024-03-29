# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "thunderbolt" "nvme" "usb_storage" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.kernelParams = ["module_blacklist=hid_sensor_hub" "mem_sleep_default=deep"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/5008cdba-144f-4e54-83a6-2870028682e7";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-070628f6-7a63-4e86-91d5-d947efc5aae2".device = "/dev/disk/by-uuid/070628f6-7a63-4e86-91d5-d947efc5aae2";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/AC1F-24AD";
    fsType = "vfat";
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/02ec2708-da1a-43a1-aaef-52de01362acc";}
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp4s0u2u1u2.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp166s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
