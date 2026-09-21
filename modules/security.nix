{
  config,
  pkgs,
  lib,
  ...
}:
{
  services.openssh = {
    enable = true;
    ports = [
      222
    ];
    settings = {
      AllowUsers = [ "vboxuser" ];
      PermitRootLogin = "no";
      LogLevel = "VERBOSE";
    };
  };

  netoworking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80
      222
      443
    ];
    allowPing = true;
  };

  services.fail2ban = {
    enable = true;
    maxretry = 3;
    bantime = "1h";
    jails = {
        sshd.settings = {
            port = "222";
            mode = "aggressive";
        };
    };
  };
}
