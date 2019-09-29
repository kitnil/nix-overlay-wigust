{ stdenv
, pkgs
, python
, lib
, python3Packages
, httpretty
}:

pkgs.python3Packages.buildPythonPackage rec {
  pname = "pyzabbix";
  version = "0.7.5";

  src = python.pkgs.fetchPypi {
    inherit pname version;
    sha256 = "0mvm8giv9876dps21zvz3din2qkg09nl0g9q582hglp9vxy8rki3";
  };

  propagatedBuildInputs = [ python3Packages.requests ];

  disabled = python3Packages.pythonOlder "3.5";

  meta = with lib; {
    description = "Python API interface for Zabbix";
    homepage = src.meta.homepage;
    license = [ licenses.gpl3 ];
    maintainers = [ maintainers.wigust ];
  };
}
