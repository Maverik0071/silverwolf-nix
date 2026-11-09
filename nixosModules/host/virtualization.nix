# virtualization.nix

{ config, pkgs, ... }:  {
  
  #direnv
  programs.direnv.enable = true;
  programs.direnv.loadInNixShell = true;
  programs.direnv.nix-direnv.enable = true;
  programs.direnv.silent = true;

  # for virtualization like gnome-boces or virt-manager
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # podman
  virtualisation.podman.enable = true;
  # virtualisation.podman.networkSocket.enable = true;

  # docker
  virtualisation.docker.enable = true;
  # virtualisation.podman.dockerSocket.enable = true;
 
  #spices (virtualization)
  services.spice-vdagentd.enable = true;  
 
  # ZRAM
  zramSwap.enable = true;

  virtualisation.kvmgt.enable = true;
  
}
