{ stdenv
, pkgs
, python3Packages
, python
}:

pkgs.python3Packages.buildPythonPackage rec {
  pname = "sure";
  version = "1.2.3";

  src = python.pkgs.fetchPypi {
    inherit pname version;
    sha256 = "1xxdrzjq7cdk92kvfjv6p99vx5csw5kljf0x5m7hjqsvvrvh487n";
  };

  buildInputs = [ python3Packages.rednose ];
  propagatedBuildInputs = [ python3Packages.six python3Packages.mock ];

  meta = with stdenv.lib; {
    description = "Utility belt for automated testing";
    homepage = https://sure.readthedocs.io/en/latest/;
    license = licenses.gpl3Plus;
  };

}
