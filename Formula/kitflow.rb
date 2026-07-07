class Kitflow < Formula
  desc "Small GitFlow-style workflow helper"
  homepage "https://github.com/koheisg/kitflow"
  url "https://github.com/koheisg/kitflow/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "1679ba88cf97f75117010114fc0827c2f790b71f6c16375ca4154e9b1833f1ce"
  license "MIT"
  head "https://github.com/koheisg/kitflow.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system "git", "init", "-b", "main"
    system "git", "config", "user.email", "test@example.com"
    system "git", "config", "user.name", "Test"
    system "git", "commit", "--allow-empty", "-m", "init"
    system bin/"kitflow", "init"
    assert_match "develop=develop", shell_output("#{bin}/kitflow status")
  end
end
