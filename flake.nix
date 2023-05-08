{
  description = "Wrapper for the Pixel Starships API";

  # Flake outputs
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        # Use a system-specific version of Nixpkgs
        pkgs = nixpkgs.legacyPackages.${system};
      in with pkgs; rec {
        # nix develop
        devShells.default = mkShell {
          name = "pssapi";
          venvDir = "./.venv";

          buildInputs = [
            # Python interpreter
            python311Packages.python

            # This executes some shell code to initialize a venv in $venvDir before
            # dropping into the shell
            python311Packages.venvShellHook
          ];

          # Run this command, only after creating the virtual environment
          postVenvCreation = ''
            unset SOURCE_DATE_EPOCH
            pip install -r dev-requirements.txt
          '';

          # Now we can execute any commands within the virtual environment.
          # This is optional and can be left out to run pip manually.
          postShellHook = ''
            # allow pip to install wheels
            unset SOURCE_DATE_EPOCH
          '';
        };
      }
    );
}
