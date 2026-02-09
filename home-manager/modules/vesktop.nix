{ config, lib, pkgs, ... }:
{
  programs.vesktop = {
    enable = true;
    settings = {
      # We leave autoUpdate out or set to false to avoid the EROFS error
      discordBranch = "stable";
    };

    vencord = {
      settings = {
        autoUpdate = true;
        autoUpdateNotification = true;
        notifyAboutUpdates = true;

        plugins = {
          ClearURLs.enabled = true;
          FixYoutubeEmbeds.enabled = true;
        };
      };
    };
  };
  # programs.vesktop = {
  #   enable = true;
  #
  #   vencord.settings = {
  #     appBadge = false;
  #     arRPC = true;
  #     checkUpdates = false;
  #     customTitleBar = false;
  #     disableMinSize = true;
  #     minimizeToTray = false;
  #     tray = false;
  #     splashBackground = "#000000";
  #     splashColor = "#ffffff";
  #     splashTheming = true;
  #     staticTitle = true;
  #     hardwareAcceleration = true;
  #     discordBranch = "stable";
  #     #     ChatInputButtonAPI.enabled = true;
  #     CommandsAPI.enabled = true;
  #     MemberListDecoratorsAPI.enabled = false;
  #     MessageAccessoriesAPI.enabled = true;
  #     MessageDecorationsAPI.enabled = false;
  #     MessageEventsAPI.enabled = true;
  #     MessagePopoverAPI.enabled = false;
  #     MessageUpdaterAPI.enabled = true;
  #     ServerListAPI.enabled = false;
  #     UserSettingsAPI.enabled = true;
  #
  #     AnonymiseFileNames.enabled = true;
  #
  #     BetterFolders = {
  #       enabled = true;
  #       sidebar = true;
  #       showFolderIcon = 1;
  #       keepIcons = false;
  #       closeAllHomeButton = false;
  #       closeAllFolders = false;
  #       forceOpen = false;
  #       sidebarAnim = true;
  #     };
  #
  #     BetterGifPicker.enabled = true;
  #     BetterRoleContext.enabled = true;
  #
  #     BetterSettings = {
  #       enabled = true;
  #       disableFade = true;
  #       eagerLoad = true;
  #     };
  #
  #     ClearURLs.enabled = true;
  #     CopyUserURLs.enabled = true;
  #     CrashHandler.enabled = true;
  #
  #     CtrlEnterSend = {
  #       enabled = true;
  #       submitRule = "ctrl+enter";
  #       sendMessageInTheMiddleOfACodeBlock = true;
  #     };
  #
  #     FakeNitro = {
  #       enabled = true;
  #       enableEmojiBypass = true;
  #       enableStickerBypass = true;
  #       enableStreamQualityBypass = true;
  #       transformEmojis = true;
  #       transformStickers = true;
  #       transformCompoundSentence = false;
  #     };
  #
  #     GameActivityToggle = {
  #       enabled = true;
  #       oldIcon = false;
  #     };
  #
  #     MessageLogger = {
  #       enabled = true;
  #       collapseDeleted = false;
  #       deleteStyle = "text";
  #       ignoreBots = false;
  #       ignoreSelf = false;
  #       logEdits = true;
  #       logDeletes = true;
  #     };
  #
  #     NSFWGateBypass.enabled = true;
  #     petpet.enabled = true;
  #     PictureInPicture.enabled = true;
  #     PreMiD.enabled = true;
  #
  #     ShowHiddenChannels = {
  #       enabled = true;
  #       showMode = 0;
  #       hideUnreads = true;
  #       defaultAllowedUsersAndRolesDropdownState = true;
  #     };
  #
  #     ShowHiddenThings = {
  #       enabled = true;
  #       showTimeouts = true;
  #       showInvitesPaused = true;
  #       showModView = true;
  #       disableDiscoveryFilters = true;
  #       disableDisallowedDiscoveryFilters = true;
  #     };
  #
  #     NoTrack = {
  #       enabled = true;
  #       disableAnalytics = true;
  #     };
  #
  #     Settings = {
  #       enabled = true;
  #       settingsLocation = "aboveNitro";
  #     };
  #
  #     SupportHelper.enabled = true;
  #
  #     MessageColors = {
  #       enabled = true;
  #       renderType = 0;
  #       blockView = 0;
  #       enableShortHexCodes = true;
  #     };
  #   };
  #
  # };
}
