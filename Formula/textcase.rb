class Textcase < Formula
  desc "Text transformation tool"
  homepage "https://github.com/chrishannah/textcase-cli"
  url "https://github.com/chrishannah/textcase-cli/archive/refs/tags/1.4.tar.gz"
  sha256 "beb1aab6733657966f9a3ba543dcad112a4a669d8937e7b2f63642b6805a0d32"
  license "GPL-3.0-only"

  depends_on :macos

  uses_from_macos "swift"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/#{name}"
  end

  test do
    # print the help text
    system "#{bin}/textcase", "format --help"
    # print the list of available formats
    system "#{bin}/textcase", "list-formats"
  end
end
