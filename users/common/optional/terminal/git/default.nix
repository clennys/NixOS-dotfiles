{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {git.enable = lib.mkEnableOption "enables git";};

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      package = pkgs.gitFull;
      userEmail = "dennys.huber@proton.me";
      userName = "Dennys Huber";
      delta.enable = true;
      extraConfig = {
        core = {editor = "nvim";};
        color = {ui = true;};
        init = {defaultBranch = "main";};
        credential.helper = "libsecret";
      };
      ignores = [
        "*~"
        ".envrc"
        ".direnv"
        "log/"
        "*.log"
        "*.7z"
        "*.dmg"
        "*.gz"
        "*.iso"
        "*.jar"
        "*.rar"
        "*.tar"
        "*.zip"
        "*.msi"
        ".vscode"
        ".idea"
        ".iml"
        "*.sublime-workspace"
        "*.com"
        "*.class"
        "*.dll"
        "*.exe"
        "*.o"
        "*.so"
        "*.pyc"
        "*.pyo"
        "*.bak"
        "*.swp"
        "*.swo"
        "*~"
        "*#"
      ];
    };
  };
}
