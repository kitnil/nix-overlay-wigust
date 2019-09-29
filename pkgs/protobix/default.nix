{ stdenv
, pkgs
, python
, lib
, python3Packages
}:

pkgs.python3Packages.buildPythonPackage rec {
  pname = "protobix";
  version = "1.0.2";

  src = python.pkgs.fetchPypi {
    inherit pname version;
    sha256 = "1nq4qmpy38sd2lnjdcfjwfv0w3gqncvjnbqb6v57zf7kgb3rwkv4";
  };

  propagatedBuildInputs = [ python3Packages.simplejson python3Packages.configobj ];

  checkPhase = ''
    
  '';

  disabled = python3Packages.pythonOlder "3.5";

  meta = with lib; {
    description = "Python API send interface for Zabbix";
    homepage = src.meta.homepage;
    license = [ licenses.gpl3 ];
    maintainers = [ maintainers.wigust ];
  };
}
