{ pkgs, ... }: {
  home.file.".config/swaync/config.json".text = ''
    {
      "$schema": "/etc/xdg/swaync/configSchema.json",

      "positionX": "center",
      "positionY": "top",
      "control-center-positionX": "center",
      "control-center-positionY": "top",
      "control-center-margin-top": 8,
      "control-center-margin-bottom": 8,
      "control-center-margin-right": 8,
      "control-center-margin-left": 8,
      "control-center-width": 500,
      "control-center-height": 600,
      "fit-to-screen": false,

      "layer": "overlay",
      "control-center-layer": "overlay",
      "cssPriority": "user",
      "notification-icon-size": 128,
      "notification-body-image-height": 300,
      "notification-body-image-width": 500,
      "notification-inline-replies": true,
      "timeout": 10,
      "timeout-low": 5,
      "timeout-critical": 0,
      "notification-window-width": 400,
      "keyboard-shortcuts": true,
      "image-visibility": "when-available",
      "transition-time": 200,
      "hide-on-clear": true,
      "hide-on-action": true,
      "script-fail-notify": true,

      "widgets": [
        "inhibitors",
        "title",
        "dnd",
        "mpris",
        "notifications"
      ],
      "widget-config": {
        "inhibitors": {
          "text": "Inhibitors",
          "button-text": "Clear All",
          "clear-all-button": true
        },
        "title": {
          "text": "Notifications",
          "clear-all-button": true,
          "button-text": "Clear All"
        },
        "dnd": {
          "text": "Do Not Disturb"
        },
        "mpris": {
          "image-size": 96,
          "image-radius": 12
        }
      }
    }
  '';

  home.file.".config/swaync/style.css".text = ''
    @define-color cc-bg rgba(28, 32, 35, 1.);

    @define-color noti-border-color rgba(0, 85, 119, 0.95);
    @define-color noti-bg rgba(28, 32, 35, 0.95);
    @define-color noti-bg-hover rgba(28, 32, 35, 0.95);
    @define-color noti-bg-focus rgba(65, 65, 65, 0.95);
    @define-color noti-close-bg rgba(255, 255, 255, 0.1);
    @define-color noti-close-bg-hover rgba(255, 255, 255, 0.15);

    @define-color mpris-album-art-overlay rgba(0, 0, 0, 0.55);
    @define-color mpris-button-hover rgba(0, 0, 0, 0.1);

    @define-color bg-selected  rgba(0, 85, 119, 0.95);

    @define-color urgent-red rgba(191, 97, 106, 1.);
    @define-color low-green rgba(163, 190, 140, 1.);
    @define-color text-color rgba(234, 235, 237, 1.);

    .testing {
      background-color: @urgent-red;
    }

    .notification-row {
      transition: all 200ms ease;
      outline: none;
      margin-bottom: 4px;
      border-radius: 4px;
    }
    .notification-row:hover {
     /* background: transparent; */
    }

    .control-center .notification-row:focus,
    .control-center .notification-row:hover {
      opacity: 1;
      /* background: transparent; */
    }

    .notification-row:focus .notification,
    .notification-row:hover .notification {
      /* box-shadow: 0 1px 3px 1px rgba(0, 0, 0, 0.5); */
      /* box-shadow: 0px 0px 0px 3px @bg-selected; */
      box-shadow: none;
    }

    .control-center .notification {
      box-shadow: none;
    }

    .control-center .notification-row {
      opacity: 0.5;
    }

    .notification {
      transition: all 200ms ease;
      border-radius: 10px;
      margin: 6px 6px;
      /* box-shadow: 0 1px 3px 1px rgba(0, 0, 0, 0.5); */
      box-shadow: none;
      padding: 0;
    }

    /* Uncomment to enable specific urgency colors */
    .low {
      background: @noti-bg;
      padding: 1px;
      border-radius: 10px;
      border: 1.5px solid @low-green;
    }

    .normal {
      background: @noti-bg;
      padding: 1px;
      border-radius: 10px;
      border: 1.5px solid @noti-border-color;
    }

    .critical {
      background: @urgent-red;
      padding: 6px;
      border-radius: 10px;
    }

    .notification-content {
      /* background: transparent; */
      padding: 6px;
      border-radius: 10px;
    }

    .close-button {
      background: @noti-close-bg;
      color: white;
      text-shadow: none;
      padding: 0;
      border-radius: 100%;
      margin-top: 10px;
      margin-right: 10px;
      box-shadow: none;
      border: none;
      min-width: 24px;
      min-height: 24px;
    }

    .close-button:hover {
      box-shadow: none;
      background: @noti-close-bg-hover;
      transition: all 0.15s ease-in-out;
      border: none;
    }

    .notification-default-action,
    .notification-action {
      padding: 4px;
      margin: 0;
      box-shadow: none;
      background: @noti-bg;
      border: 1px solid @noti-border-color;
      color: white;
      transition: all 200ms ease;
    }

    .notification-default-action:hover,
    .notification-action:hover {
      -gtk-icon-effect: none;
      background: @noti-bg-hover;
    }

    .notification-default-action {
      border-radius: 12px;
    }

    /* When alternative actions are visible */
    .notification-default-action:not(:only-child) {
      border-bottom-left-radius: 0px;
      border-bottom-right-radius: 0px;
    }

    .notification-action {
      border-radius: 0px;
      border-top: none;
      border-right: none;
    }

    /* add bottom border radius to eliminate clipping */
    .notification-action:first-child {
      border-bottom-left-radius: 12px;
    }

    .notification-action:last-child {
      border-bottom-right-radius: 12px;
      border-right: 1px solid @noti-border-color;
    }

    .image {
    }

    .body-image {
      margin-top: 6px;
      background-color: white;
      border-radius: 12px;
    }

    .summary {
      font-size: 16px;
      font-weight: bold;
      background: transparent;
      color: white;
      text-shadow: none;
    }

    .time {
      font-size: 16px;
      font-weight: bold;
      background: transparent;
      color: white;
      text-shadow: none;
      margin-right: 18px;
    }

    .body {
      font-size: 15px;
      font-weight: normal;
      background: transparent;
      color: white;
      text-shadow: none;
    }

    .control-center {
      background: @cc-bg;
      border-radius: 12px;
      background-clip: border-box;
      padding: 4px;
      /* box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 3px 1px rgba(0, 0, 0, 0.7), 0 2px 6px 2px rgba(0, 0, 0, 0.3); */
      box-shadow: none;
    }

    .control-center-list {
      background: transparent;
    }

    .control-center-list-placeholder {
      opacity: 0.5;
    }

    .floating-notifications {
      background: transparent;
    }

    /* Window behind control center and on all other monitors */
    .blank-window {
      background: transparent;
    }

    /*** Widgets ***/

    /* Title widget */
    .widget-title {
      margin: 8px;
      color: white;
      font-size: 1.5rem;
    }
    .widget-title > button {
      font-size: initial;
      color: white;
      text-shadow: none;
      background: @noti-bg;
      border: 1px solid @noti-border-color;
      box-shadow: none;
      border-radius: 12px;
    }
    .widget-title > button:hover {
      background: @noti-bg-hover;
    }

    /* DND widget */
    .widget-dnd {
      margin: 8px;
      color: white;
      font-size: 1.1rem;
    }
    .widget-dnd > switch {
      font-size: initial;
      border-radius: 12px;
      background: @bg-selected;
      border: 1px solid @noti-border-color;
      box-shadow: none;
    }
    .widget-dnd > switch:checked {
      background: @urgent-red;
    }
    .widget-dnd > switch slider {
      background: @noti-bg;
      border-radius: 12px;
    }

    /* Label widget */
    .widget-label {
      color: white;
      margin: 8px;
    }
    .widget-label > label {
      font-size: 1.1rem;
    }

    /* Mpris widget */
    .widget-mpris {
      /* The parent to all players */
    }
    .widget-mpris-player {
      padding: 16px;
      margin: 16px;
      background-color: @bg-selected;
      color: white;
      border-radius: 12px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
    }
    .widget-mpris-album-art {
      border-radius: 12px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.75);
    }
    .widget-mpris-player button:hover {
      /* The media player buttons (play, pause, next, etc...) */
      background: @noti-bg-hover;
      color: white;
    }
    .widget-mpris > box > button {
      /* Change player side buttions */
      color: white;
    }
    .widget-mpris > box > button:disabled {
      /* Change player side buttions insensitive */
      color: white;
    }
    .widget-mpris-title {
      font-weight: bold;
      font-size: 1.25rem;
    }
    .widget-mpris-subtitle {
      font-size: 1.1rem;
    }

    /* Buttons widget */
    .widget-buttons-grid {
      padding: 8px;
      margin: 8px;
      border-radius: 12px;
      background-color: @noti-bg;
    }

    .widget-buttons-grid>flowbox>flowboxchild>button{
      background: @noti-bg;
      border-radius: 12px;
    }

    .widget-buttons-grid>flowbox>flowboxchild>button:hover {
      background: @noti-bg-hover;
    }

    /* Menubar widget */
    .widget-menubar>box>.menu-button-bar>button {
      border: none;
      background: transparent;
      background: @urgent-red;
    }

    /* .AnyName { Name defined in config after #
     *   background-color: @noti-bg;
     *   padding: 8px;
     *   margin: 8px;
     *   border-radius: 12px;
     * }
     *
     * .AnyName>button {
     *   background: transparent;
     *   border: none;
     * }
     *
     * .AnyName>button:hover {
     *   background-color: @noti-bg-hover;
     * }
     */

    .topbar-buttons>button { /* Name defined in config after # */
      border: none;
      background: transparent;
      background: blue;
    }

    /* Volume widget */

    .widget-volume {
      background-color: @noti-bg;
      padding: 8px;
      margin: 8px;
      border-radius: 12px;
    }

    /* Backlight widget */
    .widget-backlight {
      background-color: @noti-bg;
      padding: 8px;
      margin: 8px;
      border-radius: 12px;
    }

    /* Title widget */
    .widget-inhibitors {
      margin: 8px;
      font-size: 1.5rem;
    }
    .widget-inhibitors > button {
      font-size: initial;
      color: white;
      text-shadow: none;
      background: @noti-bg;
      border: 1px solid @noti-border-color;
      box-shadow: none;
      border-radius: 12px;
    }
    .widget-inhibitors > button:hover {
      background: @noti-bg-hover;
    }
  '';
}
