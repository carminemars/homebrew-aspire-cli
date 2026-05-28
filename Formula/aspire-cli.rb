class AspireCli < Formula
  desc "Aspire CLI"
  homepage "https://github.com/microsoft/aspire"
  version "13.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/microsoft/aspire/releases/download/v13.3.5/aspire-cli-osx-arm64-13.3.5.tar.gz"
      sha256 "7ae8181bec6dee12d1cfb039dd201d7cfb71b51c674b0f06a853f402742afbd3"
    else
      url "https://github.com/microsoft/aspire/releases/download/v13.3.5/aspire-cli-osx-x64-13.3.5.tar.gz"
      sha256 "dafcf1633a6f2970c017d75287f502b0a033d65ff6acac02899f2761f8d16c62"
    end
  end

  on_linux do
    url "https://github.com/microsoft/aspire/releases/download/v13.3.5/aspire-cli-linux-musl-x64-13.3.5.tar.gz"
    sha256 "b3a7c77490ca9bf1fd433b6e3b100bea7bfa32d1529904d6617a04281e562f3c"
  end

  def install
    bin.install "aspire"
  end

  def caveats
    <<~EOS

   ______           __    ___            _     _ ___     _                                               
  / __/ /____ _____/ /_  / _ | ___ ___  (_)___(_) _/_ __(_)__  ___ _  __ _____  __ ______  ___ ____  ___ 
 _\ \/ __/ _ `/ __/ __/ / __ |(_-</ _ \/ / __/ / _/ // / / _ \/ _ `/ / // / _ \/ // / __/ / _ `/ _ \/ _ \
/___/\__/\_,_/_/  \__/ /_/ |_/___/ .__/_/_/ /_/_/ \_, /_/_//_/\_, /  \_, /\___/\_,_/_/    \_,_/ .__/ .__/
                                /_/              /___/       /___/  /___/                    /_/  /_/    
                                                                         
                                                                         

                  Run: aspire --help
                                                                   
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aspire --version")
  end
end
