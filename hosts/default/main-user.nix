{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.main-user;
in {
  options.main-user = {
    enable = lib.mkEnableOption "enable user module";
    userName = lib.mkOption {
      default = "mainuser";
      description = ''username'';
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      hashedPassword = "$6$yaUWt7jiOj2qI/zE$ExdWt.oTYqd/OP3Ao8oH3t1FwP2NHGNq3bx5PXpZctsDW.wUurYnbppVBC8sGHpYK5utft7Z3HCkHgxVs3zXW/";
      description = "main user";
      shell = pkgs.zsh;
    };
  };
}
