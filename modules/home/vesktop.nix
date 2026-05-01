{ self, inputs, ... }:
{
  flake.homeModules.vesktop =
    { pkgs, config, ... }:
    {
      imports = [ inputs.nixcord.homeModules.nixcord ];

      programs.nixcord = {
        enable = true;
        discord.vencord.enable = true;

        
        userPlugins = {
          MessageColors = "github:henmalib/vc-messageColors/144482e0b889b333db6857d2ab6efc6a0d7d2313";
        };
        extraConfig.plugins = {
          MessageColors = {
            enabled = true;
            renderType = 0;
            blockView = 1;
            enableShortHexCodes = true;
          };
        };
        config = {
          
          plugins = {

            anonymiseFileNames.enable = true;
            betterFolders = {
              enable = true;
              sidebar = true;
              showFolderIcon = 1;
              sidebarAnim = true;
            };
            betterGifPicker.enable = true;
            betterRoleContext.enable = true;
            betterSettings = {
              enable = true;
              disableFade = true;
              eagerLoad = true;
            };
            ClearURLs.enable = true;
            CopyUserURLs.enable = true;
            crashHandler.enable = true;

            fakeNitro = {
              enable = true;
              enableEmojiBypass = true;
              enableStickerBypass = true;
              enableStreamQualityBypass = true;
              transformEmojis = true;
              transformStickers = true;
            };
            gameActivityToggle.enable = true;
            messageLogger = {
              enable = true;
              logEdits = true;
              logDeletes = true;
            };
            petpet.enable = true;
            pictureInPicture.enable = true;
            showHiddenChannels = {
              enable = true;
              showMode = 0;
            };
            showHiddenThings.enable = true;

          };
        };
 
        extraConfig = {
          arRPC = true;
          appBadge = false;
          checkUpdates = false;
          hardwareAcceleration = true;
          discordBranch = "stable";
        };
      };
    };
}
