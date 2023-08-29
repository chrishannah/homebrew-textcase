class Textcase < Formula
  desc "Text transformation tool"
  homepage "https://github.com/chrishannah/textcase-cli"
  url "https://github.com/chrishannah/textcase-cli/archive/refs/tags/1.0.tar.gz"
  sha256 "ecad14bd576eee6c3652e0a412d056571c7dfd1a66cc86a042199a9d8b5a6693"
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
