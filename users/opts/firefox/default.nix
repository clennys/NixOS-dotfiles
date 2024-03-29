{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox.override {
      nativeMessagingHosts = [ pkgs.tridactyl-native];
    };
    profiles.default = {
      settings = {
        "browser.compactmode.show" = true;
        "services.sync.prefs.sync.browser.uiCustomization.state" = true;
        "signon.rememberSignons" = false;
        "browser.startup.homepage" = "about:blank";
        "browser.toolbars.bookmarks.visibility" = "never";
        "extensions.pocket.enabled" = false;
        "extensions.pocket.showHome" = false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" =
          false;
      };
      containers = {
        "Personal" = {
          color = "purple";
          icon = "circle";
          id = 1;
        };
        "Tracking-Zone" = {
          color = "red";
          icon = "circle";
          id = 2;
        };
        "Uni" = {
          color = "blue";
          icon = "circle";
          id = 3;
        };
        "Work" = {
          color = "orange";
          icon = "circle";
          id = 4;
        };
        "Shopping" = {
          color = "pink";
          icon = "circle";
          id = 5;
        };
      };
      # TODO: Use https://github.com/nix-community/NUR ?
      # extensions = {};
      search = {
        default = "Google";
        force = true;
        engines = {
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                {
                  name = "type";
                  value = "packages";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }];

            icon =
              "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@n" ];
          };

          "YouTube" = {
            urls = [{
              template =
                "https://www.youtube.com/results?search_query={searchTerms}";
            }];
            definedAliases = [ "@y" ];
          };
          "Phind" = {
            urls =
              [{ template = "https://www.phind.com/search?q={searchTerms}"; }];
            definedAliases = [ "@p" ];
          };

          "Google".metaData.alias =
            "@g"; # builtin engines only support specifying one additional alias
        };
      };
    };
  };
}
