{...}:
{
  users.users.vboxuser = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    initialPassword = "qwerty123";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIESSceLCDFWz7vqKdn7/dEAaUzvEc9PyirftdJ1/6yqb vboxuser 2"
    ];
  };
}
