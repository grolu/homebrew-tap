# typed: true
# frozen_string_literal: true

class Gardenlogin < Formula
  desc      "Command-line tool for authenticating with Gardener clusters"
  homepage  "https://gardener.cloud"
  version   "3.0.19"


  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenlogin/releases/download/v3.0.19/gardenlogin_darwin_arm64"
      sha256 "087121180a6d85b66d2ecd6a1b34b77789ada9b1b4d3100281d58726a74c2c0e"
    else
      url "https://github.com/grolu/gardenlogin/releases/download/v3.0.19/gardenlogin_darwin_amd64"
      sha256 "f48d1de6709a1899161b44827c23eb05043f6a7e21971997fafc45cdd8d495a1"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenlogin/releases/download/v3.0.19/gardenlogin_linux_arm64"
      sha256 "4759f8f770e92724aa081d2584027d8b23448f833406b6e042bb8be5f944df0f"
    else
      url "https://github.com/grolu/gardenlogin/releases/download/v3.0.19/gardenlogin_linux_amd64"
      sha256 "126c40eb50af21a342198a59b779ea4e2baee1882dd54a1e352a39453a33fc8e"
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
