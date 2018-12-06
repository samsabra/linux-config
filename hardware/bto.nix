# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/e050f4f6-83f4-4740-a97f-5eaa991fc1cb";
      fsType = "btrfs";
      options = [ "subvol=nixos" ];
    };

  boot.initrd.luks.devices."enix".device = "/dev/disk/by-uuid/ff73f6c5-170a-4362-b06d-3069105b43d4";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/036B-1B1B";
      fsType = "vfat";
    };

  swapDevices = [ {device="/dev/nvme0n1p2";} ];

  nix.maxJobs = lib.mkDefault 8;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
