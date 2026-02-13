class Ocp < Formula
  desc "OpenCode configuration profiles CLI"
  homepage "https://github.com/alvarosanchez/ocp"
  version "0.4.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{version}/ocp-#{version}-macos-aarch64"
    sha256 "d1f3ded4c531d685d20d847c813dd754fbe683a6adadc0fde405b29cd924abcb"
  elsif OS.mac?
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{version}/ocp-#{version}-macos-x86_64"
    sha256 "9f5ac797408578c1e6f59707f484430c17ae84c190d4cac320c99c973e89e870"
  else
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{version}/ocp-#{version}-linux-x86_64"
    sha256 "82d01d5f014fb17676d43356542cb5ad3f2c45e8c5b3cad9ba69dd141ebf4c16"
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
