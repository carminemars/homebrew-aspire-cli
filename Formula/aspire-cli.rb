class AspireCli < Formula
  desc "Aspire CLI"
  homepage "https://github.com/microsoft/aspire"
  version "13.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/microsoft/aspire/releases/download/v13.4.6/aspire-cli-osx-arm64-13.4.6.tar.gz"
      sha256 "a8c844cca68dc313f313a486ce1f7bbed64070c6717957cbe23653c1b7e33e96"
    else
      url "https://github.com/microsoft/aspire/releases/download/v13.4.6/aspire-cli-osx-x64-13.4.6.tar.gz"
      sha256 "5d2719f19794a9074a5fb0c03986e8ae68cc80192af7004bb955b05ea196d575"
    end
  end

  on_linux do
    url "https://github.com/microsoft/aspire/releases/download/v13.4.6/aspire-cli-linux-musl-x64-13.4.6.tar.gz"
    sha256 "a203a1d53dd5424f4a8ba83cbe128b0bb60887d92cb61c8e8fd1375ecbabd823"
  end

  def install
    bin.install "aspire"
  end

  def caveats
    <<~EOS
                                                              
Hey there! Aspire CLI installed succesfully!
Run: aspire --help
                                                                   
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aspire --version")
  end
end
