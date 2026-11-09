# bash.nix

{ config, pkgs, ... }:

{
  # bash and zsh
  #environment.systemPackages = with pkgs; [
  #
  #    
  # ];
  

#  services.fprintd.package = if config.services.fprintd.tod.enable then pkgs.fprintd-tod else pkgs.fprintd;


   # zsh terminal
   programs.zsh.enable = true;
   users.defaultUserShell = pkgs.zsh;
   
   # Set default editor to vim
   environment.variables.EDITOR = "nvim";
   services.nscd.enableNsncd = true;

      # NH environment.sessionVariables
   programs.nh = {
   enable = true;
   clean.enable = true;
   clean.extraArgs = "--keep-since 7d --keep 5";
   flake = "/etc/nixos/";
   };
 
   services.fprintd.enable = true;
   #services.fprintd.tod.enable = true;
   services.fprintd.package = if config.services.fprintd.tod.enable then pkgs.fprintd-tod else pkgs.fprintd;

    programs.zsh.enableLsColors = true;
    programs.zsh.enableCompletion = true;
    programs.zsh.enableBashCompletion = true;
    programs.zsh.autosuggestions.strategy = [
     "history"
      ];
    programs.thunar.enable = true;
    programs.zsh.autosuggestions.async = true;
    virtualisation.kvmgt.enable = true;
    #programs.file-roller.enable = true;
     programs.coolercontrol = {
     enable = true;
    # nvidiaSupport = false;
       };

    #  services.teamviewer.enable = true;
    services.postgresql.enable = true;
    services.tailscale.enable = true;
    services.gvfs.enable = true;
    services.picom = {
       enable = true;
       backend = "glx";
       fade = true;
       activeOpacity = 1.0;
       inactiveOpacity = 0.9;
       shadowOpacity = 0.9;
       menuOpacity = 0.9;
    };

 }

