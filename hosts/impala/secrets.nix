{...}: let
  github = "github-impala";
in {
  age = {
    identityPaths = ["/home/morten/.ssh/id_ed25519"];
    secrets = {
      ${github} = {
        file = ../../secrets/github-impala.age;
        path = "/home/morten/.ssh/github_private_key";
        owner = "morten";
        mode = "600";
      };
      work-vpn-impala = {
        file = ../../secrets/work-vpn-impala.age;
        path = "/etc/wireguard/wg1.conf";
        owner = "morten";
        mode = "600";
      };
    };
  };
}
