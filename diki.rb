# typed: true
# frozen_string_literal: true

class Diki < Formula
  desc      "Command-line tool for compliance checks"
  homepage  "https://gardener.cloud"
  version   "6.4.98"


  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/diki/releases/download/v6.4.98/diki_darwin_arm64"
      sha256 "dummySHA256sum"
    else
      url "https://github.com/grolu/diki/releases/download/v6.4.98/diki_darwin_amd64"
      sha256 "dummySHA256sum"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/diki/releases/download/v6.4.98/diki_linux_arm64"
      sha256 "dummySHA256sum"
    else
      url "https://github.com/grolu/diki/releases/download/v6.4.98/diki_linux_amd64"
      sha256 "dummySHA256sum"
      depends_on arch: :x86_64
    end
  end

  def install
    bin.install stable.url.split("/").last => "diki"

  end

  test do
    system #{bin}/diki, version
  end
end
