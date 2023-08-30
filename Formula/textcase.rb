class Textcase < Formula
  desc "Text transformation tool"
  homepage "https://github.com/chrishannah/textcase-cli"
  url "https://github.com/chrishannah/textcase-cli/archive/refs/tags/1.1.tar.gz"
  sha256 "d6fde73ed74521c2b3b37a012da909a51d710c16f4ae78ac5a3ac8aa111fff6a"
  license "GPL-3.0-only"

  depends_on :macos

  uses_from_macos "swift"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/#{name}"
  end

  test do
    # print the help text
    system "#{bin}/textcase", "--help"
    # print the list of available formats
    system "#{bin}/textcase", "--listFormats"
  end
end
