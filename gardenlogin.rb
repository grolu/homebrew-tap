class Gardenlogin < Formula
  desc "Gardenlogin"
  homepage "https://gardener.cloud"
  version "v3.0.15"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/gardener/gardenlogin/releases/download/v3.0.15/gardenlogin_darwin_arm64"
      sha256 "188f54d34b3a045c33ff6dce28bb78338a397683d9a8ba987165c07e1b007125"
    else
      url "https://github.com/gardener/gardenlogin/releases/download/v3.0.15/gardenlogin_darwin_amd64"
      sha256 "f0b97cad56c26e841e347ab344853bbd8ea99d6bb6c8aec62a837be2ca7940ca"
    end
  elsif OS.linux?
    url "https://github.com/gardener/gardenlogin/releases/download/v3.0.15/gardenlogin_linux_amd64"
    sha256 "60b929228ac88cdebb7c90975f31f25db83881c6ca452e48bfafcbe3b3b5c04d"
    depends_on :arch => :x86_64
  end

  def install
    bin.install stable.url.split("/")[-1] => "gardenlogin"
    bin.install_symlink bin/"gardenlogin" => "kubectl-gardenlogin"
  end

  test do
    system "#{bin}/gardenlogin", "version"
    system "#{bin}/kubectl-gardenlogin", "version"
  end
end

