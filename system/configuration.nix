# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./users/anuragh.nix
      <home-manager/nixos>
    ];
   nixpkgs.overlays = [
    (import ./overlays/waybar.nix)
  ];
    # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.extraHosts = ''
  127.0.0.1 openlms.local.com
'';
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  #hardware.pulseaudio.enable = false;
  hardware.bluetooth.enable = true;
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "anuragh" ];
  users.users.anuragh.extraGroups = ["adbusers"];
  virtualisation.virtualbox.host.enableExtensionPack = true;
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.x11 = true;
  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
  services.xserver.enable = true;
services.xserver.displayManager.gdm.enable = true;
#services.xserver.desktopManager.gnome.enable = true;
  services.blueman.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
    
  virtualisation.docker.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  neovim
  sway
  wayland
  xdg-utils
  glib
  dracula-theme
  swaylock
  swayidle
  grim
  slurp
  wl-clipboard
  bemenu
  mako
  brave
  waybar
  discord
  docker
  fish
  git
  go
  upower
  python
  python39
  python39Packages.pip
  python39Packages.pycairo
  python39Packages.pygobject3
  gobject-introspection
  fzf
  ulauncher
  clipman
  cliphist
  kitty
  starship
  cmake
  gcc
  gnumake
  autotiling
  swaynotificationcenter
  poweralertd
  avizo
  swaybg
  gnome.gnome-keyring
  fd
  bat
  ranger
  pcmanfm
  neofetch
  swappy
  zip
  unzip
  spotify
  vscode.fhs
  nodejs
  nodePackages.bash-language-server
  php82Packages.composer
  php82
  tmux
  ripgrep
  proselint
  gitlint
  luajitPackages.luacheck
  jq
  stylua
  sumneko-lua-language-server
  tree-sitter
  exa
  postman
  lm_sensors
  lolcat
  alsa-utils
  playerctl
  python39Packages.gst-python
  nmap
  anydesk
  pamixer
  powershell
  p7zip
  pavucontrol
  firefox
  rpi-imager
  xz
  bash
  libusb1
  pipewire-media-session
  ];
  fonts.fonts = with pkgs; [ 
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  liberation_ttf
  fira-code
  fira-code-symbols
  mplus-outline-fonts.githubRelease
  dina-font
  proggyfonts
  nerdfonts
  font-awesome
  ];
  fonts.fontDir.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;
   services.pipewire = {
    enable = true ;
    alsa.enable = true ;
    pulse.enable = true ;
};
services.dbus.enable = true ;
services.upower.enable = true;
security.polkit.enable = true;

xdg.portal = {
	enable = true ;
 	wlr.enable = true ;
	extraPortals = [pkgs.xdg-desktop-portal-gtk] ;
};
programs.waybar.enable = true;
hardware.opengl.driSupport32Bit = true;
sound.enable = true;
programs.sway = {
enable = true ;
wrapperFeatures.gtk = true;
};
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;
 system.stateVersion = "22.11"; # Did you read the comment?

}

