# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports = [
    (let nixos-hardware =
           builtins.fetchTarball
             https://github.com/NixOS/nixos-hardware/archive/master.tar.gz;
     in "${nixos-hardware}/dell/xps/13-9370")
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  ## CPU
  nix.maxJobs = lib.mkDefault 8;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  ## SSDs
  services.fstrim.enable = true;

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/nixos";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/BOOT";
      fsType = "vfat";
    };
    "/home" = {
      device = "/dev/disk/by-uuid/home";
      fsType = "ext4";
    };
  };
  swapDevices = [ { device = "/dev/disk/by-label/swap"; }];
}