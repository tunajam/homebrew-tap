# typed: false
# frozen_string_literal: true

class Packs < Formula
  desc "Agent skill package manager - share and install AI agent skills"
  homepage "https://packs.sh"
  version "0.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tunajam/packs/releases/download/v0.3.4/packs_0.3.4_darwin_amd64.tar.gz"
      sha256 "da14ddcb97b19e0dcc1f3098b359cbc6127589915ffefc30bbf31bcce10989d2"

      def install
        bin.install "packs"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/tunajam/packs/releases/download/v0.3.4/packs_0.3.4_darwin_arm64.tar.gz"
      sha256 "e7e735f9ee093e04189ba52d4ffbf72e53ebf581999f219819507b1f276ac4cc"

      def install
        bin.install "packs"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/tunajam/packs/releases/download/v0.3.4/packs_0.3.4_linux_amd64.tar.gz"
      sha256 "f360344b6e144c319b81882739d4d2b6aa8517efe7618bb21ce014944f11fe0c"
      def install
        bin.install "packs"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tunajam/packs/releases/download/v0.3.4/packs_0.3.4_linux_arm64.tar.gz"
      sha256 "b4e127761ffe4b481b63abf3c4868581b7e173bc147ad620c9a04c22b4de7dfc"
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
