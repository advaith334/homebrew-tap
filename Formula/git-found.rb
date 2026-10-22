class GitFound < Formula
  desc "Git credential helper that picks the right GitHub account for every repo"
  homepage "https://github.com/advaith334/git-found"
  url "https://github.com/advaith334/git-found/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "70eb905f69c76c808b3eb303e7e5deac18af97c608245695a67fc72813e53791"
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
