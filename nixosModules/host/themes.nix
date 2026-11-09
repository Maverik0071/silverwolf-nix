# themes.nix

{ config, pkgs, ... }:

{
  # Add packages to the system
  environment.systemPackages = with pkgs; [
  # folders and themes
    nixos-icons
    material-icons
    material-design-icons
    sweet-folders
    papirus-nord
    papirus-folders
    catppuccin
    fcitx5-nord
    beauty-line-icon-theme
    nordzy-icon-theme
    nordic
    papirus-nord
    powertop
    fprintd
  ];

  # fonts, folders, themes, icons
  
    fonts.packages = with pkgs; [
      noto-fonts
      font-awesome
      font-awesome_5
      font-awesome_4
      source-han-sans
      open-sans
      openmoji-color
      hermit
      source-code-pro
      nerd-fonts.noto
      nerd-fonts.hack
      nerd-fonts.ubuntu
      terminus_font
      jetbrains-mono
      powerline-fonts
      corefonts
      google-fonts
      jetbrains-mono
      udev-gothic
      hack-font
   
     ];     

 }

