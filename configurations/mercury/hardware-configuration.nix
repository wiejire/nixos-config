# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/4ec1493e-9f34-4da5-958e-e7f0d76535fa";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."cryptroot" = {
    device = "/dev/disk/by-uuid/52c8cd4f-343f-4ada-b310-2d6a462fed66";
    allowDiscards = true;
    bypassWorkqueues = true;
  };

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/A3D8-4BBA";
      fsType = "vfat";
    };

  fileSystems."/mnt/alexandria" = {
    device = "alexandria:/mnt/storage";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" "noatime" "soft" ];
  };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/21e91dcf-51d1-4b37-aa45-a0adcf1f0111"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s13f0u3u2.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
