{ pkgs, ... }:
{
  users.users.archer = {
    isNormalUser = true;
    description = "archer";
    extraGroups = [ "networkmanager" "wheel" "kvm" "adbusers" "disk" ];
    shell = pkgs.fish;

  };

}
