class Zsplash < Formula
  desc "Lightweight CLI utility for colorful, expressive Zsh & terminal text (includes zsp alias)"
  homepage "https://github.com/acorrow/zsplash"
  url "https://github.com/acorrow/zsplash/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "635ce3d316e082b31b275036b171812170782545d996b4f8a869aa77917ed1b2"
  license "MIT"
  head "https://github.com/acorrow/zsplash.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
    bin.install_symlink "zsplash" => "zsp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zsplash --version")
    assert_match version.to_s, shell_output("#{bin}/zsp --version")
  end
end