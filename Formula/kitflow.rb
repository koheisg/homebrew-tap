class Kitflow < Formula
  desc "Small GitFlow-style workflow helper"
  homepage "https://github.com/koheisg/kitflow"
  url "https://github.com/koheisg/kitflow/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "61d5acdc551a02836203c9f3fc93ca69aceb1a4a08f8b5a9fe017e3a02a60c18"
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
