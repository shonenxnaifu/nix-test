{...}:
{
  users.users.vboxuser = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    initialPassword = "qwerty123";
  };
}
