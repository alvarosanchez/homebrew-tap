class Ocp < Formula
  desc "OpenCode configuration profiles CLI"
  homepage "https://github.com/alvarosanchez/ocp"
  license "Apache-2.0"

  depends_on "bat"

  OCP_VERSION = "1.0.0-RC1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{OCP_VERSION}/ocp-#{OCP_VERSION}-macos-aarch64"
    sha256 "84c20b518af9ef8c960c2cbbe5ccc174c879d3b7858e79f7c2f56b3c1967f26e"
  elsif OS.mac?
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{OCP_VERSION}/ocp-#{OCP_VERSION}-macos-x86_64"
    sha256 "d17269830032c07c51bcf37b0197fd8420ffd3b920786aa6474cb57f67a4d397"
  else
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{OCP_VERSION}/ocp-#{OCP_VERSION}-linux-x86_64"
    sha256 "4d4592aab925bc9c785c5aabb1c3e1abc5b628380d25e21c93f41643ce339a86"
  end

  def install
    binary_name =
      if OS.mac?
        Hardware::CPU.arm? ? "ocp-#{OCP_VERSION}-macos-aarch64" : "ocp-#{OCP_VERSION}-macos-x86_64"
      else
        "ocp-#{OCP_VERSION}-linux-x86_64"
      end

    bin.install binary_name => "ocp"
  end

  test do
    assert_match "Usage: ocp", shell_output("#{bin}/ocp help")
  end
end
