# dms.nix (dankshell)

{ config, pkgs, ... }:

{
 
# Dankshell
    programs.dux-shell.enable = true;

    #Dankshell greeter
    programs.dux-shell.systemd.enable = true;
    
    services.displayManager.dux-greeter = {
       enable = true;
       compositor = {
       name = "sway";
       customConfig = '' 
      # Optional custom compositor configuration
          '';
      # package = inputs.dux-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;
          };

       # Sync your user's DankMaterialShell theme with the greeter. You'll probably want this
       configHome = "/home/densetsu";

      # Custom config files for non-standard config locations
       configFiles = [
        "/home/densetsu/.config/DankMaterialShell/settings.json"
         ];

      # Save the logs to a file
       logs = {
       save = true; 
       path = "/tmp/dms-greeter.log";
        };

       # Custom Quickshell Package    
       quickshell.package = pkgs.quickshell;
        };
       
    # programs.dms-shell.enableDynamicTheming = true;
    programs.dux-shell.systemd.target = "graphical-session.target";
    services.upower.enable = true; 
    services.greetd.enable = true;

       security.pam.services.greetd = {
      fprintAuth = true;  # Fingerprint via pam_fprintd
      u2fAuth = true;     # Security key via pam_u2f (configure security.pam.u2f options)
       };

     security.pam.services."dankshell-u2f".text = ''
     auth     required ${pkgs.pam_u2f}/lib/security/pam_u2f.so cue
     account  required pam_permit.so
        '';

}

