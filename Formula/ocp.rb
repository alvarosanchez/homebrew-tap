class Ocp < Formula
  desc "OpenCode configuration profiles CLI"
  homepage "https://github.com/alvarosanchez/ocp"
  version "0.6.2"
  license "Apache-2.0"
  revision 1

  depends_on "bat"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{version}/ocp-#{version}-macos-aarch64"
    sha256 "d2350b38f55cd0537a4fe67831839646ea4783b33c4b561e99c9f877377400d4"
  elsif OS.mac?
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{version}/ocp-#{version}-macos-x86_64"
    sha256 "30f15c15fce314df5efb76bd69c77abc11fd368dbb521d1f862947d96700fd46"
  else
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{version}/ocp-#{version}-linux-x86_64"
    sha256 "9b236e2f70f7c3fb620453e71b3696b195bb19a5f62296dc2db1f36f2cb1440c"
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "ocp-#{version}-macos-aarch64" : "ocp-#{version}-macos-x86_64"
    else
      "ocp-#{version}-linux-x86_64"
    end

    bin.install binary_name => "ocp"
  end

  test do
    assert_match "Usage: ocp", shell_output("#{bin}/ocp help")
  end
end
