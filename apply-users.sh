#!/bin/sh
pushd ~/.my_nix
home-manager switch -f ./users/anuragh/home.nix
popd
