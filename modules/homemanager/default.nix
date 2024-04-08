{lib, ...}: {
  imports = [
    ./programs
    ./system
    ./terminal
  ];
  system-bundle.enable = lib.mkDefault true;
  programs-bundle.enable = lib.mkDefault true;
  terminal-bundle.enable = lib.mkDefault true;
}
