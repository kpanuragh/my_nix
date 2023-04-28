 { config, pkgs, ... }:
 {
 users.users.anuragh = {
    isNormalUser = true;
    description = "Anuragh";
    extraGroups = [ "networkmanager" "wheel" "docker" "plugdev" "dialout" ];
    shell = pkgs.fish ;
    packages = with pkgs; [];
  };
}
