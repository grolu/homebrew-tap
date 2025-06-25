# typed: true
# frozen_string_literal: true

class Gardenlogin < Formula
  desc      "Command-line tool for authenticating with Gardener clusters"
  homepage  "https://gardener.cloud"
  version   "1.2.3"


  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenlogin/releases/download/v1.2.3/gardenlogin_darwin_arm64"
      sha256 "${DARWIN_SHA_ARM64}"
    else
      url "https://github.com/grolu/gardenlogin/releases/download/v1.2.3/gardenlogin_darwin_amd64"
      sha256 "${DARWIN_SHA_AMD64}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenlogin/releases/download/v1.2.3/gardenlogin_linux_arm64"
      sha256 "${LINUX_SHA_ARM64}"
    else
      url "https://github.com/grolu/gardenlogin/releases/download/v1.2.3/gardenlogin_linux_amd64"
      sha256 "${LINUX_SHA_AMD64}"
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
    system "#{bin}/'${component%%-*}'", "version"
  end
end
