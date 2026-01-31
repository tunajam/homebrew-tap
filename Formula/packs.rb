# typed: false
# frozen_string_literal: true

class Packs < Formula
  desc "Agent skill package manager - share and install AI agent skills"
  homepage "https://packs.sh"
  version "0.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tunajam/packs/releases/download/v0.3.5/packs_0.3.5_darwin_amd64.tar.gz"
      sha256 "da1b2651d99c460318cb353af890c4a708553574316ce2458ac945c739f62019"

      def install
        bin.install "packs"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/tunajam/packs/releases/download/v0.3.5/packs_0.3.5_darwin_arm64.tar.gz"
      sha256 "ea8821e120537e43adce0ccee45acda414595bb2636cd486201c12cd227fff34"

      def install
        bin.install "packs"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/tunajam/packs/releases/download/v0.3.5/packs_0.3.5_linux_amd64.tar.gz"
      sha256 "72fb385b76be35766b91d293ca122c4ac32f7936f612fb41653e80a6a3fcb2c1"
      def install
        bin.install "packs"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tunajam/packs/releases/download/v0.3.5/packs_0.3.5_linux_arm64.tar.gz"
      sha256 "4e8a2cd7c25ac85c49b9f4671072193af9eeb1c336b794a518c8e912e6191305"
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
