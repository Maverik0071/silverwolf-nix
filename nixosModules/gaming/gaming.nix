# gaming.nix

{ config, pkgs, ... }:

{
  # Add packages to the system
  environment.systemPackages = with pkgs; [
    steam-run
    sc-controller
    gamescope
    protonup-qt
    lutris
  # steam-run 
    SDL2
    ];
  
  # services
   services.asusd.enable = true;
   services.cardwired.enable = true;
   
  # programs
  programs.steam.enable = true; 
  programs.steam.extest.enable = true;
  programs.gamescope.enable = true;
  
  programs.coolercontrol = {
  enable = true;
    };
  
  services.lact.enable = true;

  } 

