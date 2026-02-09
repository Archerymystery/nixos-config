{ pkgs, ... }:
{
  users.users.archer = {
    isNormalUser = true;
    description = "archer";
    extraGroups = [ "networkmanager" "wheel" "kvm" "adbusers" "disk" "virtualbox" ];
    shell = pkgs.fish;

  };

}
