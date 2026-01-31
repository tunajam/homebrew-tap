# typed: false
# frozen_string_literal: true

class Packs < Formula
  desc "Agent skill package manager - share and install AI agent skills"
  homepage "https://packs.sh"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tunajam/packs/releases/download/v0.3.3/packs_0.3.3_darwin_amd64.tar.gz"
      sha256 "4c21751ce78da142dc76e3892257075264dd35a70c5f254141ee75a9f2ae1d58"

      def install
        bin.install "packs"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/tunajam/packs/releases/download/v0.3.3/packs_0.3.3_darwin_arm64.tar.gz"
      sha256 "f8ddd357946828b286c4e4fbcc36a211bd91601d66daec6f09f92e387cbb63fc"

      def install
        bin.install "packs"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/tunajam/packs/releases/download/v0.3.3/packs_0.3.3_linux_amd64.tar.gz"
      sha256 "b58e7e51172fc33cbc838e892fbd86589f6245bca3dc876a6a04b851e97cc2cd"
      def install
        bin.install "packs"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tunajam/packs/releases/download/v0.3.3/packs_0.3.3_linux_arm64.tar.gz"
      sha256 "b5e8084571e08964e7496ee7dbc63083a03f58e6d6892a2fa96721d4ccb3a83c"
      def install
        bin.install "packs"
      end
    end
  end

  def caveats
    <<~EOS
      🎒 packs is ready! Try these commands:

        packs                      # Browse packs in TUI
        packs find <query>         # Search for packs
        packs get <name>           # Install a pack
        packs get gh:user/repo/path  # Install from GitHub

      Docs: https://packs.sh
    EOS
  end

  test do
    system "#{bin}/packs", "--version"
  end
end
