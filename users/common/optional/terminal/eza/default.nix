{
  lib,
  config,
  ...
}: {
  options = {eza.enable = lib.mkEnableOption "enables eza";};

  config = lib.mkIf config.eza.enable {
    programs.eza = {
      enable = true;
      # 'ls': Basic file listing
      # 'll': Detailed file listing
      # 'la': List all files, including hidden
      # 'lt': Display directory tree
      # 'lla': Detailed list, all files
      enableAliases = true;
      # enableZshIntegration = true; # NOTE: Will replace enableAliases in next homemanager version
      git = true;

      extraOptions = ["--group-directories-first" "--header"];
    };
  };
}
