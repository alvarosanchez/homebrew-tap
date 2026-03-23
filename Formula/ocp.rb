class Ocp < Formula
  desc "OpenCode configuration profiles CLI"
  homepage "https://github.com/alvarosanchez/ocp"
  license "Apache-2.0"

  depends_on "bat"

  OCP_VERSION = "1.0.0-RC2".freeze

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{OCP_VERSION}/ocp-#{OCP_VERSION}-macos-aarch64"
    sha256 "d58a629f4b0d03595eeb38d5a2daf0aa6420829c78e91bebf2a0433eaea931aa"
  elsif OS.mac?
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{OCP_VERSION}/ocp-#{OCP_VERSION}-macos-x86_64"
    sha256 "29ce16614b8b138881b694324b249264e1922bd8eda2760fecb4d65b13f477da"
  else
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{OCP_VERSION}/ocp-#{OCP_VERSION}-linux-x86_64"
    sha256 "8f646b4cd28effe0201ff41a89c47cb94f58c7e69f742f5c123ec956f76523e2"
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
