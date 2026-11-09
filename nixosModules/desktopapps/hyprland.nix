# hyprland.nix

{ config, pkgs, ... }:

{
  # Add packages to the system
  environment.systemPackages = with pkgs; [
  
  
   # hyprland 
    # waypaper  #hyprland
    hyprpaper  #hyprland
    dmenu
    rofi
    lxappearance
    dunst
    mako
    pavucontrol
    jgmenu
    picom
    networkmanager_dmenu
    clipmenu
    brightnessctl
    nwg-look   #hyprland
    feh
    wl-clipboard  #hyprland
    wl-clipboard-x11   #hyprland
    wlogout
    ranger
    rofi-power-menu
    # hyprland-protocols
    libdrm
    wayland-protocols    #hyprland
    wofi
    kitty   #hyprland
    kitty-themes    #hyprland
    swaybg  #hyprland
    gnumake
    gnumake42
    upower #[UPower battery module]
    upower-notify
    hyprpolkitagent  
  ];
      
   # Hyprland window manager
   # programs.hyprland.enable = true;
   #  security.pam.services.hyprlock = {};
 
   
 }

