class Textcase < Formula
  desc "Text transformation tool"
  homepage "https://github.com/chrishannah/textcase-cli"
  url "https://github.com/chrishannah/textcase-cli/archive/refs/tags/1.2.tar.gz"
  sha256 "9543378c17ab133a3e1635c8d2c478c8b7350b1e014d181f995c5ecf7468e918"
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
