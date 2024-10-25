## Setup
Using ssh to avoid having to generate a token, but requires some setup:
```
git clone git@github.com:1caka12/NixRep.git 
```
Otherwise, using https:
```
git clone https://github.com/1caka12/NixRep.git
```
Then, run this command in the directory where the flake is:
```
sudo nixos-rebuild switch --flake .
```

## Note
In case of this error: "nix/store/....: No such file or directory", it probably means that the file is not tracked by git.
