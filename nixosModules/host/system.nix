# system.nix

{ config, pkgs, ... }:

{
   # NH environment.sessionVariables
   programs.nh = {
   enable = true;
   clean.enable = true;
   clean.extraArgs = "--keep-since 7d --keep 5";
   flake = "/etc/nixos/";
   };

   # nix grub generations
   system.autoUpgrade = {
   enable = true;
   flake = "/etc/nixos/";
   flags = [
   # "nix-update"
    "nixpkgs"
    "-L" # print build logs
   ];
   operation = "boot";
   randomizedDelaySec = "30min";
   dates = "24:00";
      };
   
   #nix.settings.auto-optimise-store = true;
   #nix.gc = {
   #automatic = true;
   #dates = "Sun 24:00";
   #options = "--delete-older-than 7d";
   #  };

   services.power-profiles-daemon.enable = true;
   nix.settings.use-xdg-base-directories = true;
   # use-xdg-base-directories = true;

}
 
