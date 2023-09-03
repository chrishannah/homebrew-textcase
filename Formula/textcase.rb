class Textcase < Formula
  desc "Text transformation tool"
  homepage "https://github.com/chrishannah/textcase-cli"
  url "https://github.com/chrishannah/textcase-cli/archive/refs/tags/1.3.tar.gz"
  sha256 "964a9dc5a9a8c852dc0fcd7886d81759f88509c1fb7552249b2b04ed34d4e7de"
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
