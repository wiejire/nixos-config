{ inputs, pkgs, pkgs-unstable, config, ... }:

{
  imports = [ inputs.home-manager.nixosModule ];
  
  users.users.jneeman = {
    isNormalUser = true;
    description = "Joe Neeman";
    shell = pkgs.fish;
    extraGroups = [ "docker" "networkmanager" "wheel" "video" "scanner" "lp" "libvirtd" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFISxQwDN1H8cA9DDRUTQb9YgsY2AuyvjkXDDOoJLeU3 jneeman@mercury"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGpAveBRfqrg7a41+qdOxw5WT3CbEi7dwlgKObSM85YP jneeman@zeus"
    ];
  };

  home-manager.users.jneeman = import ./home.nix { inherit config inputs pkgs pkgs-unstable; };
  home-manager.useGlobalPkgs = true;
}
