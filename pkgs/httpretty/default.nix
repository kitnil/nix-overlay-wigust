{ stdenv
, pkgs
, python
, python3Packages
}:

pkgs.python3Packages.buildPythonPackage rec {
  pname = "httpretty";
  version = "0.8.7";

  src = python.pkgs.fetchPypi {
    inherit pname version;
    sha256 = "1qnad0dvrhky9pdlw099aglg6cpc8xl23v8bcpky685f1wrf7xdz";
  };

  propagatedBuildInputs = [ python3Packages.six ];

  checkInputs = [
    python3Packages.nose
    python3Packages.sure
    python3Packages.coverage
    python3Packages.mock
    python3Packages.rednose

    # Following not declared in setup.py
    python3Packages.nose-randomly
    python3Packages.requests
    python3Packages.tornado
    python3Packages.httplib2
    python3Packages.nose-exclude
  ];

  __darwinAllowLocalNetworking = true;

  # Those flaky tests are failing intermittently on all platforms
  NOSE_EXCLUDE = stdenv.lib.concatStringsSep "," [
    "tests.functional.test_httplib2.test_callback_response"
    "tests.functional.test_requests.test_streaming_responses"
  ];

  meta = with stdenv.lib; {
    homepage = "https://httpretty.readthedocs.org/";
    description = "HTTP client request mocking tool";
    license = licenses.mit;
  };
}
