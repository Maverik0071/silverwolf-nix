# sway.nix

{ config, pkgs, ... }:

{
  # Add packages to the system
  environment.systemPackages = with pkgs; [
  #  hyprland 
  #  waypaper  #hyprland
  #  hyprpaper  #hyprland
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
    #wayland-protocols    #hyprland
    wofi
    kitty   #hyprland
    kitty-themes    #hyprland
    swaybg  #hyprland
    gnumake
    gnumake42
    upower # [UPower battery module]
    upower-notify
    # hyprpolkitagent
    
   ];

  programs.sway.enable = true;
  # programs.sway.extraSessionCommands = ""
  #	''
  # SDL:
  #export SDL_VIDEODRIVER=wayland
  # QT (needs qt5.qtwayland in systemPackages):
  #export QT_QPA_PLATFORM=wayland-egl
  #export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
  # Fix for some Java AWT applications (e.g. Android Studio),
  # use this if they aren't displayed properly:
  #export _JAVA_AWT_WM_NONREPARENTING=1
  #     '' 
  #	""

}

