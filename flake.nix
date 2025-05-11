{
  description = "Good Night App with Rails using Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShell = pkgs.mkShell {
          buildInputs = [
            pkgs.ruby_3_2
            pkgs.rubyPackages_3_2.railties
            pkgs.postgresql
            pkgs.nodejs_20
            pkgs.yarn
            pkgs.bundler
            pkgs.sqlite
          ];
          shellHook = ''
            export DATABASE_URL=postgresql://localhost/goodnight_development
          '';
        };
      });
}
