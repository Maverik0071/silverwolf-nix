# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, modulesPath, lib, inputs, home-manager, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
     		# host
       ./nixosModules/host/bash.nix
      ./nixosModules/host/boot.nix
      ./nixosModules/host/system.nix
      ./nixosModules/host/virtualization.nix
      ./nixosModules/host/smartcard.nix
      ./nixosModules/host/themes.nix
      		# gaming
      ./nixosModules/gaming/amd-gpu.nix
      ./nixosModules/gaming/gaming.nix
		# desktoppapps
      ./nixosModules/desktopapps/dms.nix
      ./nixosModules/desktopapps/apps.nix      
       ./nixosModules/desktopapps/sway.nix
     # /nixosModules/desktopapps/hyprland.nix
      		 # flake
      # chaotic.nixosModules.default
     # inputs.nixos-cosmic.nixosModules.default
     # inputs.home-manager.nixosModules.default
    ];
   
   
 
  networking.hostName = "silverwolf"; # Define your hostname.
  networking.domain = "example.com";
  
  # configuration.nix
  # networking.fqdn = "${networking.hostName}.${networking.domain}";
   networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  #networking.hosts = {
  #"127.0.0.1" = [ "://example.com" "myhost" ];
  #"::1"       = [ "://example.com" "myhost" ];
  # };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver = {
  enable = true;
  displayManager.sessionCommands = ''
  xset r rate 200 35 & 
   '';
  }; 
 
  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # enable flatpak
  services.flatpak.enable = true;
  
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.densetsu = {
    isNormalUser = true;
    description = "densetsu";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      ungoogled-chromium
      vlc
    ];
  };

  
 
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Flakes and the command-line tool with nix command settings
  nix.settings.experimental-features = [ "nix-command flakes"];
 
   # Set default editor to vim
  #environment.variables.EDITOR = "nvim";

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    
  # nixpkgs
    nixpkgs-lint
    nixos-option
    nixos-generators
    nix-build-uncached
    nom
    nitch
    nh
    nil

  # system packages
    wget
    curl
    pkgs.kdePackages.ark
    git
    meson
    gcc
    clang
    zig
    cmake
    ninja
    lm_sensors
    xsensors
    gnumake
    gnumake42
    tmux
    fastfetch
    lsd
    zsh
    pfetch
    gh
    pasystray
    dhcpdump
    btop
    postgresql
    w3m
    usbimager
    distrobox
    lshw
    rPackages.gbm
    gtk-layer-shell
    gvfs
    topgrade
    libvirt
    neocmakelsp
    lua
    cheese
    xclip
    wl-clipboard-x11
    xclicker  
    autotiling-rs 
  
   # vim and programming langauges
    vim
    neovim
    vimPlugins.nvim-treesitter-textsubjects
    nodejs_22
    lua
    zig

 ];
    
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

         
   services.power-profiles-daemon.enable = true;
   #nix.settings.use-xdg-base-directories = true;
   # use-xdg-base-directories = true;


  # List services that you want to enable:
    services.sshd.enable = true;
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
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    services.blueman.enable = true;
    #services.pulseaudo.enable = true;

  # list of programs with services       

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.ports = [
     22 80
   ];

  # Open ports in the firewall.
   networking.firewall.allowedTCPPorts = [ 22 80 443 ];
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.11"; # Did you read the comment?

}
