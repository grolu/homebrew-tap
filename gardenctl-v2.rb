# typed: true
# frozen_string_literal: true

class GardenctlV2 < Formula
  desc      "Command-line tool for managing Gardener clusters"
  homepage  "https://gardener.cloud"
  version   "V3.0.16"
  depends_on "gardener/tap/gardenlogin"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenctl-v2/releases/download/V3.0.16/gardenctl_v2_darwin_arm64"
      sha256 "e13d8410d2a30dc7c25e1e3fc5048a1f9b5e9bcd649ba38b8dcfa608f77b7dae"
    else
      url "https://github.com/grolu/gardenctl-v2/releases/download/V3.0.16/gardenctl_v2_darwin_amd64"
      sha256 "0e94d24b98145ae2fc5f61a63bccac50df0713fc4198c355b55bfe0eba94631f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenctl-v2/releases/download/V3.0.16/gardenctl_v2_linux_arm64"
      sha256 "293b176e777a995b6162e1c4fc6a4c7b41ae503cff4e3d2dd3c31f1df2bab3cd"
    else
      url "https://github.com/grolu/gardenctl-v2/releases/download/V3.0.16/gardenctl_v2_linux_amd64"
      sha256 "e27634c02a5bb4a2f380020f5aa2098b30d08f3d93e8c0f0417d7cda11b143a8"
      depends_on arch: :x86_64
    end
  end

  def install
    bin.install stable.url.split("/")[-1] => "gardenlogin"

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
