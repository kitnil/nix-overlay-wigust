# WiGust's NIX overlay

self: super:

let
  wigust-overlay = rec {
    inherit (super) callPackage;
    httpretty = callPackage ./pkgs/httpretty {};
    sure = callPackage ./pkgs/sure {};
    protobix = callPackage ./pkgs/protobix {};
    pyzabbix = callPackage ./pkgs/pyzabbix {};
    zabbix-alerta = callPackage ./pkgs/zabbix-alerta {};
  };
in
wigust-overlay // { inherit wigust-overlay; }
