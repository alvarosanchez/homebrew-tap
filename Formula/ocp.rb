class Ocp < Formula
  desc "OpenCode configuration profiles CLI"
  homepage "https://github.com/alvarosanchez/ocp"
  license "Apache-2.0"

  depends_on "bat"

  OCP_VERSION = "1.0.0".freeze
  version OCP_VERSION

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{OCP_VERSION}/ocp-#{OCP_VERSION}-macos-aarch64"
    sha256 "3a98a640ec381e41110be7d80122432f4a00fe2f23b80c5ada8cc989e132f5e5"
  elsif OS.mac?
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{OCP_VERSION}/ocp-#{OCP_VERSION}-macos-x86_64"
    sha256 "bff7ccfba4ac95e19d15867020f6326b02db8dc3e2313bf43b183dcafc46d991"
  else
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{OCP_VERSION}/ocp-#{OCP_VERSION}-linux-x86_64"
    sha256 "5814aa50535406d3b9d38a88dbb74b6e87d6565b5bff3465e828e9661a42cb4d"
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
