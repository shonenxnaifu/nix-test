{...}:
{
  users.users.vboxuser = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    # initialPassword = "qwerty123";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJzmrK26arRwgJuzhB2QIZRlEyf05nBK3cKl2fuJo8p6 vboxuser"
    ];
  };
}
