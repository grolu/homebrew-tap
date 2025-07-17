# typed: true
# frozen_string_literal: true

class Gardenlogin < Formula
  desc      "Command-line tool for authenticating with Gardener clusters"
  homepage  "https://gardener.cloud"
  version   "6.4.9"


  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenlogin/releases/download/v6.4.9/gardenlogin_darwin_arm64"
      sha256 "38f64536a419423e7625f43b6419e8e0ea3a8e84802fe39e4b1dfee60f5b6d02"
    else
      url "https://github.com/grolu/gardenlogin/releases/download/v6.4.9/gardenlogin_darwin_amd64"
      sha256 "b72f57b07f78d7ef45e1b9bf57af8deab6646e1769f812af91f118173be4b448"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenlogin/releases/download/v6.4.9/gardenlogin_linux_arm64"
      sha256 "224e3719578b2bf55766d796a5e36e89c9aebb4b9e6a9e57e6b0b7acb58286a9"
    else
      url "https://github.com/grolu/gardenlogin/releases/download/v6.4.9/gardenlogin_linux_amd64"
      sha256 "a6801b80d61b47a40f59d21aab4b9d8c688ecf42a26d6dd9d2e4c3adbe8a85ff"
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
