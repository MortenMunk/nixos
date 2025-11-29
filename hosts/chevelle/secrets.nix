{...}: let
  github = "github-chevelle";
in {
  age = {
    identityPaths = ["/home/morten/.ssh/id_ed25519"];
    secrets = {
      ${github} = {
        file = ../../secrets/github-chevelle.age;
        path = "/home/morten/.ssh/github_private_key";
        owner = "morten";
        mode = "600";
      };
    };
  };
}
