{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];
  boot.loader.grub.extraEntries = ''
    menuentry "Bazzite Linux" { 
      search --set=root --fs-uuid 2c628e7d-a3c8-4918-a236-91db2e57db86 
      # Це типовий шлях для Fedora/Bazzite EFI файлу. Може знадобитися коригування.
      chainloader /EFI/fedora/grubx64.efi
    }
  '';
}
