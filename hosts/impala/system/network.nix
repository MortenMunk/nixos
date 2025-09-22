{...}: {
  networking = {
    networkmanager.enable = true;
  };

  services.openvpn.servers = {
    work_vpn = {
      autoStart = false;
      config = ''
        config /home/morten/.ssh/ovpn_work_private_key
        auth-user-pass /home/morten/.ssh/vpn_creds
      '';
      updateResolvConf = false;
    };
  };
}
