class Textcase < Formula
  desc "Text transformation tool"
  homepage "https://github.com/chrishannah/textcase-cli"
  url "https://github.com/chrishannah/textcase-cli/archive/refs/tags/1.0.tar.gz"
  sha256 "e7daff41716d092b07b60da93b0731ba276207685521c2dee0efd03b4616aae1"
  license "GPL-3.0-only"

  depends_on xcode: ["14.0", :build]

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
