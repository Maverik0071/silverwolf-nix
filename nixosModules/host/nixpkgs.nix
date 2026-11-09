# nixpkgs

{ config, pkgs, ... }:

{
  # Add packages to the system
  environment.systemPackages = with pkgs; [
    nixd
    zsh-nix-shell
    nix-search-cli
    pkgs.nvd
    nix-output-monitor
    nix-top
    nix-doc
    nix-pin
    nix-tree
    nix-melt
    nix-info
    nix-diff
    nix-serve
    nix-index
    nix-update
    nix-script
    nix-bundle
    nixos-icons
    nixos-shell
    nix-plugins
    fprintd
      
   ];

  nixpkgs.config = {
  # Allow unfree packages if needed
  allowUnfree = true;
  allowBroken = true;
  nixos = {
  problems.handlers = {
  "gtk+".broken = "ignore";
       };
     };
    };
   

  nixpkgs.config.permittedInsecurePackages = [
    "nodejs-12.22.12"
    "python-2.7.18.7"
    "nix-2.17.1"
    "openssl-1.1.1w"
    "qtwebengine-5.15.19"
    "gtk+-2.24.33"
  ];

 nix.settings.use-xdg-base-directories = true;
    
  [
      {
    handler = "warn";
    kind = "maintainerless";
     }
       {
    handler = "error";
    package = "gtk+";
       }
]

}

