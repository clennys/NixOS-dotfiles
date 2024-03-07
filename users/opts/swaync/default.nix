{
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
    @define-color cc-bg rgba(28,32,35,0.85);
    @define-color noti-border-color rgba(0, 85, 119, 0.85);
    @define-color noti-bg rgba(28,32,35,0.85);
    @define-color noti-bg-opaque rgb(48, 48, 48);
    @define-color noti-bg-darker rgb(38, 38, 38);
    @define-color noti-bg-hover rgb(56, 56, 56);
    @define-color noti-bg-hover-opaque rgb(56, 56, 56);
    @define-color noti-bg-focus rgba(68, 68, 68, 0.6);
    @define-color noti-close-bg rgba(255, 255, 255, 0.1);
    @define-color noti-close-bg-hover rgba(255, 255, 255, 0.15);
    @define-color text-color rgb(255, 255, 255);
    @define-color text-color-disabled rgb(150, 150, 150);
    @define-color bg-selected rgb(0, 128, 255);

    .notification-row {
      outline: none;
      margin-top: 0;
      padding: 0 0;
    }

    .notification-row:focus, .notification-row:hover {
    }

    .notification-row .notification-background {
      padding: 0px 8px;
      padding-bottom: 6px;
    }

    .notification-row .notification-background .close-button {
      /* The notification Close Button */
      background: @noti-close-bg;
      color: @text-color;
      text-shadow: none;
      padding: 0;
      border-radius: 100%;
      margin-top: 10px;
      margin-right: 4px;
      box-shadow: none;
      border: none;
      min-width: 24px;
      min-height: 24px;
    }

    .notification-row .notification-background .close-button:hover {
      box-shadow: none;
      background: @noti-close-bg-hover;
      transition: background 0.15s ease-in-out;
      border: none;
    }

    .notification-row .notification-background .notification {
      /* The actual notification */
      border-radius: 12px;
      margin: 4px 0;
      margin-bottom: 0;
      border: 1px solid @noti-border-color;
      padding: 0;
      transition: background 0.15s ease-in-out;
      background: @noti-bg;
    }

    .notification-row .notification-background .notification.low {
      /* Low Priority Notification */
    }

    .notification-row .notification-background .notification.normal {
      /* Normal Priority Notification */
    }

    .notification-row .notification-background .notification.critical {
      /* Critical Priority Notification */
    }

    .notification-row .notification-background .notification .notification-action, .notification-row .notification-background .notification .notification-default-action {
      padding: 4px;
      margin: 0;
      box-shadow: none;
      background: transparent;
      border: none;
      color: @text-color;
      transition: background 0.15s ease-in-out;
    }

    .notification-row .notification-background .notification .notification-action:hover, .notification-row .notification-background .notification .notification-default-action:hover {
      -gtk-icon-effect: none;
      background: @noti-bg-hover;
    }

    .notification-row .notification-background .notification .notification-default-action {
      /* The large action that also displays the notification summary and body */
      border-radius: 12px;
    }

    .notification-row .notification-background .notification .notification-default-action:not(:only-child) {
      /* When alternative actions are visible */
      border-bottom-left-radius: 0px;
      border-bottom-right-radius: 0px;
    }

    .notification-row .notification-background .notification .notification-default-action .notification-content {
      background: transparent;
      border-radius: 12px;
      padding: 4px;
    }

    .notification-row .notification-background .notification .notification-default-action .notification-content .image {
      /* Notification Primary Image */
      -gtk-icon-effect: none;
      border-radius: 6px;
      /* Size in px */
      margin: 4px;
    }

    .notification-row .notification-background .notification .notification-default-action .notification-content .app-icon {
      /* Notification app icon (only visible when the primary image is set) */
      -gtk-icon-effect: none;
      -gtk-icon-shadow: 0 1px 4px black;
      margin: 4px;
    }

    .notification-row .notification-background .notification .notification-default-action .notification-content .text-box .summary {
      /* Notification summary/title */
      font-size: 16px;
      font-weight: bold;
      background: transparent;
      color: @text-color;
      text-shadow: none;
      margin-right: 8px;
      margin-top: 4px;
      margin-bottom: 3px;
      margin-left: 8px;
    }

    .notification-row .notification-background .notification .notification-default-action .notification-content .text-box .time {
      /* Notification time-ago */
      font-size: 16px;
      font-weight: bold;
      background: transparent;
      color: @text-color;
      text-shadow: none;
      margin-right: 34px;
      margin-top: 4px;
    }

    .notification-row .notification-background .notification .notification-default-action .notification-content .text-box .body {
      /* Notification body */
      font-size: 15px;
      font-weight: normal;
      background: transparent;
      color: @text-color;
      text-shadow: none ;
      margin-right: 4px;
      margin-bottom: 5px;
      margin-left: 8px;
    }

    .notification-row .notification-background .notification .notification-default-action .notification-content progressbar {
      /* The optional notification progress bar */
      margin-top: 4px;
    }

    .notification-row .notification-background .notification .notification-default-action .notification-content .body-image {
      /* The "extra" optional bottom notification image */
      margin-top: 4px;
      background-color: white;
      border-radius: 12px;
      -gtk-icon-effect: none;
    }

    .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply {
      /* The inline reply section */
      margin-top: 4px;
    }

    .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply .inline-reply-entry {
      background: @noti-bg-darker;
      color: @text-color;
      caret-color: @text-color;
      border: 1px solid @noti-border-color;
      border-radius: 12px;
    }

    .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply .inline-reply-button {
      margin-left: 4px;
      background: @noti-bg;
      border: 1px solid @noti-border-color;
      border-radius: 12px;
      color: @text-color;
    }

    .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply .inline-reply-button:disabled {
      background: initial;
      color: @text-color-disabled;
      border: 1px solid @noti-border-color;
      border-color: transparent;
    }

    .notification-row .notification-background .notification .notification-default-action .notification-content .inline-reply .inline-reply-button:hover {
      background: @noti-bg-hover;
    }

    .notification-row .notification-background .notification .notification-action {
      /* The alternative actions below the default action */
      border-top: 1px solid @noti-border-color;
      border-radius: 0px;
      border-right: 1px solid @noti-border-color;
    }

    .notification-row .notification-background .notification .notification-action:first-child {
      /* add bottom border radius to eliminate clipping */
      border-bottom-left-radius: 12px;
    }

    .notification-row .notification-background .notification .notification-action:last-child {
      border-bottom-right-radius: 12px;
      border-right: none;
    }

    .notification-group {
      /* Styling only for Grouped Notifications */
    }

    .notification-group.low {
      /* Low Priority Group */
    }

    .notification-group.normal {
      /* Low Priority Group */
    }

    .notification-group.critical {
      /* Low Priority Group */
    }

    .notification-group .notification-group-buttons, .notification-group .notification-group-headers {
      margin: 0 8px;
      color: @text-color;
    }

    .notification-group .notification-group-headers {
      /* Notification Group Headers */
    }

    .notification-group .notification-group-headers .notification-group-icon {
      color: @text-color;
      margin-left: 10px;
      margin-right: 6px;
    }

    .notification-group .notification-group-headers .notification-group-header {
      font-size: 1.2em;
      color: @text-color;
      font-weight: 500;
    }

    .notification-group .notification-group-buttons > * {
      /* Notification Group Buttons */
      background-color: rgba(0,0,0,0.0);
    }

    .notification-group.collapsed .notification-row .notification {
      background-color: @noti-bg;
    }

    .notification-group.collapsed .notification-row:not(:last-child) .notification {
      /* Top notification in stack */
      /* Set lower stacked notifications opacity to 0 */
      background-color: @noti-bg;
    }

    .notification-group.collapsed .notification-row:not(:last-child) .notification-action,
    .notification-group.collapsed .notification-row:not(:last-child) .notification-default-action {
      opacity: 0;
    }

    .notification-group.collapsed:hover .notification-row:not(:only-child) .notification {
      background-color: @noti-bg-hover-opaque;
    }

    .control-center {
      /* The Control Center which contains the old notifications + widgets */
      background: @cc-bg;
      color: @text-color;
      border-radius: 22px;
      border: 1px solid @noti-border-color;
    }

    .control-center .control-center-list-placeholder {
      /* The placeholder when there are no notifications */
      opacity: 0.5;
      margin-top: -40px;
    }

    .control-center .control-center-list {
      /* List of notifications */
      background: transparent;
    }

    .control-center .control-center-list .notification {
      /*box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 3px 1px rgba(0, 0, 0, 0.7), 0 2px 6px 2px rgba(0, 0, 0, 0.3);*/
        box-shadow: none;
    }

    .control-center .control-center-list .notification .notification-default-action,
    .control-center .control-center-list .notification .notification-action {
      transition: opacity 400ms ease-in-out, background 0.15s ease-in-out;
    }

    .control-center .control-center-list .notification .notification-default-action:hover,
    .control-center .control-center-list .notification .notification-action:hover {
      background-color: @noti-bg-hover;
    }

    .blank-window {
      /* Window behind control center and on all other monitors */
      background: transparent;
    }

    .floating-notifications {
      background: transparent;
    }

    .floating-notifications .notification {
      box-shadow: none;
    }

    .floating-notifications:first-child {
      margin-top: 16px;
    }

    /*** Widgets ***/
    /* Title widget */
    .widget-title {
      color: @text-color;
      margin: 20px 20px;
      margin-left: 24px;
      font-size: 1.8rem;
      margin-bottom: 2px;
      font-weight: bold;
    }

    .widget-title > button {
      font-size: initial;
      color: @text-color;
      text-shadow: none;
      background: rgba(255,255,255, 0.15);
      border: 1px solid rgba(255,255,255,0.1);
      box-shadow: none;
      border-radius: 6px;
      padding: 2px 10px;
    }

    .widget-title > button:hover {
      background: rgba(255,255,255,0.2);
    }

    /* DND widget */
    .widget-dnd {
      color: @text-color;
      margin: 12px;
      margin-bottom: 20px;
      margin-left: 24px;
      margin-right: 20px;
      margin-top: 6px;
      font-size: 1.1rem;
    }

    .widget-dnd > switch {
      font-size: initial;
      border-radius: 20px;
      background: rgba(255,255,255,0.15);
      border: 1px solid rgba(255,255,255,0.1);
      box-shadow: none;
    }

    .widget-dnd > switch:checked {
      background: @bg-selected;
    }

    .widget-dnd > switch slider {
      background: white;
      border-radius: 12px;
    }

    /* Label widget */
    .widget-label {
      margin: 8px;
    }

    .widget-label > label {
      font-size: 1.1rem;
    }

    /* Mpris widget */
    @define-color mpris-album-art-overlay rgba(0, 0, 0, 0.55);
    @define-color mpris-button-hover rgba(0, 0, 0, 0.50);
    .widget-mpris {
      /* The parent to all players */
        margin-bottom: 0;
        margin-top: 0;
    }

    .widget-mpris .widget-mpris-player {
      padding: 8px;
      margin: 16px 20px;
      background-color: rgba(0,0,0,0.8);
      border-radius: 12px;
      border: 1px solid rgba(255,255,255,0.15);
    /*  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.75);*/
      box-shadow: none;
    }

    .widget-mpris .widget-mpris-player button:hover {
      /* The media player buttons (play, pause, next, etc...) */
      background: @noti-bg-hover;
    }

    .widget-mpris .widget-mpris-player .widget-mpris-album-art {
      border-radius: 5px;
    /*  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.75);*/
    }

    .widget-mpris .widget-mpris-player .widget-mpris-title {
      font-weight: bold;
      font-size: 1.25rem;
    }

    .widget-mpris .widget-mpris-player .widget-mpris-subtitle {
      font-size: 1.1rem;
    }

    .widget-mpris-title, .widget-mpris-subtitle {
        margin-left: 2px;
    }

    .widget-mpris .widget-mpris-player > box > button {
      /* Change player control buttons */
    }

    .widget-mpris .widget-mpris-player > box > button:hover {
      background-color: @mpris-button-hover;
    }

    .widget-mpris > box > button {
      /* Change player side buttons */
    }

    .widget-mpris > box > button:disabled {
      /* Change player side buttons insensitive */
    }

    .widget-mpris>.horizontal>.flat.image-button {
      margin: 0 -34px;
      opacity: 0.0;
    }

    /* Buttons widget */
    .widget-buttons-grid {
      padding: 0;
      margin: 16px;
      border-radius: 12px;
      background-color: transparent;
    }

    .widget-buttons-grid > flowbox > flowboxchild > button {
      background: @noti-bg;
      border-radius: 8px;
    }

    .widget-buttons-grid > flowbox > flowboxchild > button.toggle:checked {
      /* style given to the active toggle button */
      color: white;
      background: @bg-selected;
    }

    /* Menubar widget */
    .widget-menubar > box > .menu-button-bar > button {
      border: none;
      background: transparent;
    }

    /* .AnyName { Name defined in config after #
      background-color: @noti-bg;
      padding: 8px;
      margin: 8px;
      border-radius: 12px;
    }

    .AnyName>button {
      background: transparent;
      border: none;
    }

    .AnyName>button:hover {
      background-color: @noti-bg-hover;
    } */
    .topbar-buttons > button {
      /* Name defined in config after # */
      border: none;
      background: transparent;
    }

    /* Volume widget */
    .widget-volume {
      background-color: @noti-bg;
      padding: 8px;
      margin: 8px;
      border-radius: 12px;
    }

    .widget-volume > box > button {
      background: transparent;
      border: none;
    }

    .per-app-volume {
      background-color: @noti-bg-alt;
      padding: 4px 8px 8px 8px;
      margin: 0px 8px 8px 8px;
      border-radius: 12px;
    }

    /* Backlight widget */
    .widget-backlight {
      background-color: @noti-bg;
      padding: 8px;
      margin: 8px;
      border-radius: 12px;
    }

    /* Inhibitors widget */
    .widget-inhibitors {
      margin: 8px;
      font-size: 1.5rem;
    }

    .widget-inhibitors > button {
      font-size: initial;
      color: @text-color;
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
