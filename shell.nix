{ pkgs }:

pkgs.mkShell {
  buildInputs = [
    pkgs.terraform
  ];
}
