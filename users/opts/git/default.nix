{
  programs.git = {
    enable = true;
    userEmail = "dennys.huber@proton.me";
    userName = "Dennys Huber";
	delta.enable = true;
    extraConfig = {
      core = {
        editor = "nvim";
      };
      color = {
        ui = true;
      };
      init = {
        defaultBranch = "main";
      };
    };
  };

}
