# boot.nix 

{ config, pkgs, ... }: {

# xdg portals
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [  
  pkgs.xdg-desktop-portal-hyprland
  # pkgs.xdg-desktop-portal-wlr
  ];
  xdg.portal.config.common.default = " ";


# XWayland
  programs.xwayland = {
  enable = true;
  };

# Bootloader
  #boot.loader.grub.enable = true;
  #boot.loader.grub.device = "nodev";
  #boot.loader.grub.fontSize = "20";
  #boot.loader.grub.configurationLimit = 7;
  #boot.loader.grub.useOSProber = false;
 
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 7;
  boot.modprobeConfig.enable = true;
  # services.hddfancontrol.enable = true;
  
  # boot options based on cpu parameters
  boot.initrd.kernelModules = ["amd"];
  #boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

  # boot kernel modules
  #boot.extraModulePackages = with config.boot.kernelPackages; 
  #   [ pkgs.linuxKernel.packages.linux_xanmod_latest.tp_smapi ];
  
  # boot kernel extra modified configurations
  #boot.extraModprobeConfig =''
  #options thinkpad_acpi=fancontrol=1 
  #options usbcore
  #'';
    
  #boot kernel parameters
  boot.kernelParams = [
   "quiet"
   "splash"
   "amd_pstate=guided"
   "uinput"
    ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  # system packages
  hardware.uinput.enable = true;

}

