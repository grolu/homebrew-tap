# typed: true
# frozen_string_literal: true

class GARDENLOGIN < Formula
  desc      "Auto-generated formula for gardenlogin"
  homepage  "https://gardener.cloud"
  version   "1.2.3"

  

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenlogin/releases/download/v1.2.3/gardenlogin_darwin_arm64"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    else
      url "https://github.com/grolu/gardenlogin/releases/download/v1.2.3/gardenlogin_darwin_amd64"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    fi
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenlogin/releases/download/v1.2.3/gardenlogin_linux_arm64"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    else
      url "https://github.com/grolu/gardenlogin/releases/download/v1.2.3/gardenlogin_linux_amd64"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
      depends_on arch: :x86_64
    fi
  end

  def install
    bin.install stable.url.split("/").last => "gardenlogin"
  end

  test do
    system "\#{bin}/gardenlogin", "version"
  end
end
