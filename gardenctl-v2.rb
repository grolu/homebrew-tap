# typed: true
# frozen_string_literal: true

class GardenctlV2 < Formula
  desc      "Command-line tool for managing Gardener clusters"
  homepage  "https://gardener.cloud"
  version   "1.2.3"
  depends_on "gardener/tap/gardenlogin"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenctl-v2/releases/download/v1.2.3/gardenctl_v2_darwin_arm64"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    else
      url "https://github.com/grolu/gardenctl-v2/releases/download/v1.2.3/gardenctl_v2_darwin_amd64"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenctl-v2/releases/download/v1.2.3/gardenctl_v2_linux_arm64"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    else
      url "https://github.com/grolu/gardenctl-v2/releases/download/v1.2.3/gardenctl_v2_linux_amd64"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
      depends_on arch: :x86_64
    end
  end

  def install
    bin.install stable.url.split("/").last => "gardenctl"

  end

  def caveats
    <<~EOS
      Consider adding the gardenctl startup script to your shell profile.
      Run `gardenctl rc --help` for more information.
    EOS
  end

  test do
    system #{bin}/gardenctl, version
  end
end
