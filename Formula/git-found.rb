class GitFound < Formula
  desc "Git credential helper that picks the right GitHub account for every repo"
  homepage "https://github.com/advaith334/git-found"
  url "https://github.com/advaith334/git-found/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "61a3c9c60ee538c8b9cdf79ea02b30ed3e507709768004ad04b48153f7dbfb60"
  license "MIT"

  depends_on "gh"

  def install
    bin.install "git-credential-found"
  end

  def caveats
    <<~EOS
      To make Git use git-found, run:
        git-credential-found setup

      To check why a repo fails:
        git-credential-found doctor
    EOS
  end

  test do
    assert_match "git-found #{version}", shell_output("#{bin}/git-credential-found version")
  end
end
