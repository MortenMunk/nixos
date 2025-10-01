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
      ovpn_work = {
        file = ../../secrets/ovpn_work.age;
        path = "/home/morten/.ssh/ovpn_work_private_key";
        owner = "morten";
        mode = "600";
      };
    };
  };
}
