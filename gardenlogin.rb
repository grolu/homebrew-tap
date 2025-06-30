# typed: true
# frozen_string_literal: true

class Gardenlogin < Formula
  desc      "Command-line tool for authenticating with Gardener clusters"
  homepage  "https://gardener.cloud"
  version   "3.0.18"


  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenlogin/releases/download/v3.0.18/gardenlogin_darwin_arm64"
      sha256 "430414884ae9231c7a58b672ae58f094ef7ba66d9d291982a95a43dbcaed4ad8"
    else
      url "https://github.com/grolu/gardenlogin/releases/download/v3.0.18/gardenlogin_darwin_amd64"
      sha256 "74dda97206e4c0b5d4d362d25418eb55ee33b9b6cfeef41918b09ef905f214d5"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenlogin/releases/download/v3.0.18/gardenlogin_linux_arm64"
      sha256 "ee4f53d30355571f39908190f4bf3e200dcd581d7ad0b89a7c6a40c16517507b"
    else
      url "https://github.com/grolu/gardenlogin/releases/download/v3.0.18/gardenlogin_linux_amd64"
      sha256 "b80a7eaf0e77d32243cd287177a8a71ca74c135e2f86815c9003ae3ff8c2661b"
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
