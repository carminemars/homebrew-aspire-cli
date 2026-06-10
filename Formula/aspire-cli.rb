class AspireCli < Formula
  desc "Aspire CLI"
  homepage "https://github.com/microsoft/aspire"
  version "13.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/microsoft/aspire/releases/download/v13.4.3/aspire-cli-osx-arm64-13.4.3.tar.gz"
      sha256 "fcc5516aa148933cee8b842e4d808947393c88d930e534ebb722661ebd50a98a"
    else
      url "https://github.com/microsoft/aspire/releases/download/v13.4.3/aspire-cli-osx-x64-13.4.3.tar.gz"
      sha256 "ffd5d0b92e01440954fc2a4bc3a53fc67db6e83c64986fec8e07fd1f714ed31a"
    end
  end

  on_linux do
    url "https://github.com/microsoft/aspire/releases/download/v13.4.3/aspire-cli-linux-musl-x64-13.4.3.tar.gz"
    sha256 "013b48f892c4a9eca8fad8e1f9b02c2d9006c64b67011b19dd013c92f25c9dd0"
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
