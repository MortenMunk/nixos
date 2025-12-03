{pkgs, ...}: {
  services.easyeffects = {
    enable = true;
    extraPresets = {
      nova-pro = {
        input = {
          blocklist = [];

          "plugins_order" = [
            "rnnoise#0"
            "autogain#0"
            # "gate#0"
          ];

          "rnnoise#0" = {
            bypass = false;
            "enable-vad" = true;
            "vad-thres" = 25.0;
            "wet" = 0.0;
            "release" = 20.0;
            "input-gain" = 0.0;
            "output-gain" = 0.0;
          };

          # Gate
          # attack 1ms,
          # release 70ms,
          # reduction -72db,
          # threshold -38db,
          # zone -4db,
          # hysterisis threshold -6db
          # hysterisis zone -8 db

          "autogain#0" = {
            bypass = false;
            "input-gain" = 0.0;
            "reference" = "Geometric Mean (MSI)";
            "silence-threshold" = -70.0;
            "maximum-history" = 15;
            "target" = -23.0;
            "output-gain" = 6.0;
          };
        };
      };
    };
  };

  home.packages = with pkgs; [
    deepfilternet
    rnnoise-plugin
  ];
}
