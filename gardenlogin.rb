# typed: true
# frozen_string_literal: true

class Gardenlogin < Formula
  desc      "Command-line tool for authenticating with Gardener clusters"
  homepage  "https://gardener.cloud"
  version   "3.021"


  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenlogin/releases/download/v3.021/gardenlogin_darwin_arm64"
      sha256 "d6f6b389a2f88ce053a9b61e15f6c47d315742ca50fb39538f594c139c4ad372"
    else
      url "https://github.com/grolu/gardenlogin/releases/download/v3.021/gardenlogin_darwin_amd64"
      sha256 "07cb4fb2c15d3b371ce437bc73816e6d5b29b28f347ab9fd3a304450eb9240a5"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenlogin/releases/download/v3.021/gardenlogin_linux_arm64"
      sha256 "fa3ee0f61b32b5ee0999450ffeee4401428e56d66e4429dce41386b47a177bbd"
    else
      url "https://github.com/grolu/gardenlogin/releases/download/v3.021/gardenlogin_linux_amd64"
      sha256 "24dd765487b04d40d300e9eb36a8d74668f1081c7444a5fc0c72dfca40866602"
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
