{
  programs.git = {
    enable = true;
    userEmail = "dennys.huber@proton.me";
    userName = "Dennys Huber";
    delta.enable = true;
    extraConfig = {
      core = { editor = "nvim"; };
      color = { ui = true; };
      init = { defaultBranch = "main"; };
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
}
