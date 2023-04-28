#!/bin/sh
pushd ~/.my_nix
sudo  nixos-rebuild switch -I nixos-config=./system/configuration.nix
popd

