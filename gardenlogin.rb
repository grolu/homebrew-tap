# typed: true
# frozen_string_literal: true

class Gardenlogin < Formula
  desc      "Command-line tool for authenticating with Gardener clusters"
  homepage  "https://gardener.cloud"
  version   "3.0.20"


  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenlogin/releases/download/v3.0.20/gardenlogin_darwin_arm64"
      sha256 "b1d76da25f6dccf52a1bac16aa52072a39697661ea52defef69ba3156651546b"
    else
      url "https://github.com/grolu/gardenlogin/releases/download/v3.0.20/gardenlogin_darwin_amd64"
      sha256 "b60c043b11c1b9e9e1fa7160ba83831dffa4ad201ce74e6cea96a1d9c61a3729"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/grolu/gardenlogin/releases/download/v3.0.20/gardenlogin_linux_arm64"
      sha256 "b77a23436dec3b0c247dbf9fba37c6ecd9262cd587b5e12f7495c282a8c91600"
    else
      url "https://github.com/grolu/gardenlogin/releases/download/v3.0.20/gardenlogin_linux_amd64"
      sha256 "b27af28ca8a6fc5f34a0d2600527845c5ba39c2ec079ceda82197ffe4aeb3d5e"
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
