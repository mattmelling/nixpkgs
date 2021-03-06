{ lib
, buildGoModule
, fetchFromGitHub
}:

buildGoModule rec {
  pname = "librespeed-cli";
  version = "1.0.8";

  src = fetchFromGitHub {
    owner = "librespeed";
    repo = "speedtest-cli";
    rev = "v${version}";
    sha256 = "sha256-cbLuAOAGWmYj6xR2AjpwvRXrP3SXfHhjUp5MVLqC0WE=";
  };

  vendorSha256 = "sha256-psZyyySpY06J+ji+9uHUtX7Ks1hzZC3zINszYP75NfQ=";

  # Tests have additonal requirements
  doCheck = false;

  meta = with lib; {
    description = "Command line client for LibreSpeed";
    homepage = "https://github.com/librespeed/speedtest-cli";
    license = with licenses; [ lgpl3Only ];
    maintainers = with maintainers; [ fab ];
  };
}
