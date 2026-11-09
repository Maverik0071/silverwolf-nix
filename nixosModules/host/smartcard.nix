# smartcard.nix

{ config, pkgs, lib, inputs, modulesPath, ... }:

{
 environment.systemPackages = with pkgs; [
 # smartcard applications
    pam_p11
    #pam_usb
    nss
    nss_latest
    pkgs.pcscliteWithPolkit
    pkgs.pcsc-tools
    pkgs.scmccid
    pkgs.ccid
    pkgs.pcsclite
    pkgs.opensc
  ];

# services
 services.pcscd.enable = true;
 security.pam.p11.enable = true;
 services.smartd.enable =  true;
 services.nscd.enableNsncd = true;

    security.polkit.extraConfig = ''
      polkit.addRule(function(action, subject) {
        if (action.id == "org.debian.pcsc-lite.access_pcsc" &&
          subject.isInGroup("wheel")) {
          return polkit.Result.YES;
        }
      });
  '';  
        

}


