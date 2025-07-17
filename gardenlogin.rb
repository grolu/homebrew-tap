# typed: true
# frozen_string_literal: true

class Gardenlogin < Formula
  desc      "Command-line tool for authenticating with Gardener clusters"
  homepage  "https://gardener.cloud"
  version   "1.4.5"


  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenlogin/releases/download/v1.4.5/gardenlogin_darwin_arm64"
      sha256 "dummySHA256sum"
    else
      url "https://github.com/grolu/gardenlogin/releases/download/v1.4.5/gardenlogin_darwin_amd64"
      sha256 "dummySHA256sum"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenlogin/releases/download/v1.4.5/gardenlogin_linux_arm64"
      sha256 "dummySHA256sum"
    else
      url "https://github.com/grolu/gardenlogin/releases/download/v1.4.5/gardenlogin_linux_amd64"
      sha256 "dummySHA256sum"
      depends_on arch: :x86_64
    end
  end

  def install
    bin.install stable.url.split("/").last => "gardenlogin"
    bin.install_symlink bin/"gardenlogin" => "kubectl-gardenlogin"
  end

  def caveats
    <<~EOS
      If you are using an OIDC kubeconfig, you may need to install 'kubelogin'.
      You can install it manually by running:
        brew install int128/kubelogin/kubelogin
    EOS
  end

  test do
    system "#{bin}/gardenlogin", "version"
    system "#{bin}/kubectl-gardenlogin", "version"
  end
end
