# apps.nix (applications)

{ config, pkgs, ... }:

{
  # Add packages to the system
  environment.systemPackages = with pkgs; [
  #### applications ###
    virt-manager
    gnome-boxes
    alacritty
    alacritty-graphics
    kdePackages.okular
    libreoffice-still
    brave
    vscodium
    eww
    pam
    zed-editor
    mousepad
    gedit
    lact
 

  # Claude Code
    claude-code
    claude-agent-acp
    # claude-mergetool
    # claude-code-router
    # claude-usage-tracker
  
   ];

 }

