{...}: {
  networking.hostName = "nixos";

  networking = {
    networkmanager.enable = true;
    # 127.7.7.6
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
  };
}
