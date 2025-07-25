# typed: true
# frozen_string_literal: true

# GardenctlV2 is a formula for installing Gardenctl-v2
class GardenctlV2 < Formula
  desc "Command-line tool for managing Gardener clusters"
  homepage "https://gardener.cloud"
  version "3.0.50"

  depends_on "gardener/tap/gardenlogin"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenctl-v2/releases/download/v3.0.50/gardenctl_v2_darwin_arm64"
      sha256 "b"
    else
      url "https://github.com/grolu/gardenctl-v2/releases/download/v3.0.50/gardenctl_v2_darwin_amd64"
      sha256 "a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenctl-v2/releases/download/v3.0.50/gardenctl_v2_linux_arm64"
      sha256 "d"
    else
      url "https://github.com/grolu/gardenctl-v2/releases/download/v3.0.50/gardenctl_v2_linux_amd64"
      sha256 "c"
      depends_on arch: :x86_64
    end
  end

  def install
    bin.install stable.url.split("/")[-1] => "gardenctl"
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
    system "#{bin}/gardenctl", "version"
  end
end
