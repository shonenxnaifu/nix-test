{ config, pkgs, ...  }:

{
  home.username = "vboxuser";
  home.homeDirectory = "/home/vboxuser";

  home.packages = with pkgs; [
    ripgrep
    fd
    jq

    # Terminal
    alacritty

    # App Launcher
    fuzzel

    # Status bar (opsional, Noctalia sudah ada panel)
    waybar

    # Fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    font-awesome

    # Utilities
    brightnessctl
    pamixer
    playerctl
  ];


  programs = {
    bash = {
      enable = true;
      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake ~/nix#nixos-pc";
      };
    };

    lazygit = {
      enable = true;
      enableBashIntegration = true;
    };

    noctalia = {
      systemd.enable = true;
      settings = {
        theme = {
          mode = "dark";
          source = "builtin";
          builtin = "Catpuccin";
        };
      
        wallpapaer = {
          enabled = true;
          default.path = "${pkgs.adwaita-icon-theme}/share/backgrounds/gnome/blobs-l.svg";
        };

        session = {
          lock_cmd = "swaylock";
          power_off_cmd = "systemctl poweroff";
          reboot_cmd = "systemctl reboot";
        };
      };
    };
  };

  # Screen lock
  programs.swaylock.enable = true;

  # Niri config dari file KDL
  xdg.configFile."niri/config.kdl".source = ./config/niri-config.kdl;
 
  # Wayland environment
  home.sessionVariables = {
    EDITOR = "nvim";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "niri";
  };
 
  home.stateVersion = "26.05";
}
