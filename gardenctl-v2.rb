# typed: true
# frozen_string_literal: true

class GardenctlV2 < Formula
  desc      "Command-line tool for managing Gardener clusters"
  homepage  "https://gardener.cloud"
  version   "3.0.16"
  depends_on "gardener/tap/gardenlogin"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenctl-v2/releases/download/v3.0.16/gardenctl_v2_darwin_arm64"
      sha256 "cf8c5464d16fa7cac4331ce64638f4e50f640fdeb8604fc4fb76fad86712d190"
    else
      url "https://github.com/grolu/gardenctl-v2/releases/download/v3.0.16/gardenctl_v2_darwin_amd64"
      sha256 "45863f6b3002613307a516eb7e9d1616b7e764ad660220d596ead6532973afe2"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenctl-v2/releases/download/v3.0.16/gardenctl_v2_linux_arm64"
      sha256 "42a1be80073bdc843d49deffa09aed66ed4a0d979c56bb3b7458be90227acf21"
    else
      url "https://github.com/grolu/gardenctl-v2/releases/download/v3.0.16/gardenctl_v2_linux_amd64"
      sha256 "a8d7a7114470ee3ca776379bfa2c94116185b233bb90a619f5e56f9ca446e9d0"
      depends_on arch: :x86_64
    end
  end

  def install
    bin.install stable.url.split("/")[-1] => "gardenlogin"

  end

  def caveats
    <<~EOS
      [HINT]
      Consider adding the gardenctl startup script to your shell profile.
      It contains various tweaks, such as setting environment variables,
      loading completions, and adding some helpful aliases or functions.
      Run `gardenctl rc --help` for more information.
    EOS
  end

  test do
    system bin/gardenctl, --version
  end
end
