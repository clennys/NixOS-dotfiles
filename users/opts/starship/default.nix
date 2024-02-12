{
  lib,
  ...
}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = lib.concatStrings [
        "$username"
        "$hostname"
        "$localip"
        "$shlvl"
        "$singularity"
        "$kubernetes"
        "$directory"
        "$vcsh"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_metrics"
        "$git_status"
        "$hg_branch"
        "$docker_context"
        "$package"
        "$c"
        "$cmake"
        "$cobol"
        "$daml"
        "$dart"
        "$deno"
        "$dotnet"
        "$elixir"
        "$elm"
        "$erlang"
        "$golang"
        "$haskell"
        "$helm"
        "$java"
        "$julia"
        "$kotlin"
        "$lua"
        "$nim"
        "$nodejs"
        "$ocaml"
        "$perl"
        "$php"
        "$pulumi"
        "$purescript"
        "$python"
        "$raku"
        "$rlang"
        "$red"
        "$ruby"
        "$rust"
        "$scala"
        "$swift"
        "$terraform"
        "$vlang"
        "$vagrant"
        "$zig"
        "$buf"
        "$nix_shell"
        "$conda"
        "$meson"
        "$spack"
        "$memory_usage"
        "$aws"
        "$gcloud"
        "$openstack"
        "$azure"
        "$env_var"
        "$crystal"
        "$custom"
        "$cmd_duration"
        "$line_break"
        "$shell"
        "$character"
      ];

      right_format = lib.concatStrings [
        "$status"
        "$container"
        "$sudo"
        "$jobs"
        "$battery"
      ];
      add_newline = false;
      continuation_prompt = "▶▶";

      character = {
        success_symbol = "[󰥭](bold green)";
        error_symbol = "[󰥭](bold red)";
        vicmd_symbol = "[󰥼](bold blue)";
      };

      directory = {
        truncation_length = 0;
      };

      hostname = {
        ssh_only = false;
        format = "::[$hostname]($style) in ";
        style = "bold green";
      };

      username = {
        show_always = true;
        format = "[$user]($style)";
        style_user = "bold blue";
      };

      status = {
        disabled = false;
        symbol = " ";
      };

      jobs = {
        symbol = " ";
        style = "bold red";
      };

      time = {
        disabled = false;
        format = "[$time]($style)";
      };

      cmd_duration = {
        show_notifications = true;
      };

      python = {
        symbol = " ";
      };

      c = {
        symbol = " ";
      };

      conda = {
        format = "[$symbol $environment](dimmed yellow) ";
      };

      sudo = {
        style = "bold green";
        format = "[$symbol]($style)";
        symbol = "  ";
        disabled = false;
      };
    };
  };
}
