class Textcase < Formula
  desc "Text transformation tool"
  homepage "https://github.com/chrishannah/textcase-cli"
  url "https://github.com/chrishannah/textcase-cli/archive/refs/tags/1.0.tar.gz"
  sha256 "d0c4e51db7fef8cea375ac4ab08790056a0cff240defc311baa48fd8a66fff82"
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
