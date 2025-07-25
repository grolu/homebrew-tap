# typed: true
# frozen_string_literal: true

# Diki is a formula for installing Diki
class Diki < Formula
  desc "Command-line tool for compliance checks"
  homepage "https://gardener.cloud"
  version "3.0.50"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/diki/releases/download/v3.0.50/diki-darwin-arm64"
      sha256 "dummySHA256sum"
    else
      url "https://github.com/grolu/diki/releases/download/v3.0.50/diki-darwin-amd64"
      sha256 "dummySHA256sum"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/diki/releases/download/v3.0.50/diki-linux-arm64"
      sha256 "dummySHA256sum"
    else
      url "https://github.com/grolu/diki/releases/download/v3.0.50/diki-linux-amd64"
      sha256 "dummySHA256sum"
      depends_on arch: :x86_64
    end
  end

  def install
    bin.install stable.url.split("/")[-1] => "diki"
  end

  def caveats
    <<~EOS
      [HINT]
      Run `diki --help` for more information or find out more at https://github.com/gardener/diki.
    EOS
  end

  test do
    system "#{bin}/diki", "version"
  end
end
