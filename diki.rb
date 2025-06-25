# typed: true
# frozen_string_literal: true

class Diki < Formula
  desc      "Command-line tool for compliance checks"
  homepage  "https://gardener.cloud"
  version   "1.2.3"


  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/diki/releases/download/v1.2.3/diki_darwin_arm64"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    else
      url "https://github.com/grolu/diki/releases/download/v1.2.3/diki_darwin_amd64"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/diki/releases/download/v1.2.3/diki_linux_arm64"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    else
      url "https://github.com/grolu/diki/releases/download/v1.2.3/diki_linux_amd64"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
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
