class Ocp < Formula
  desc "OpenCode configuration profiles CLI"
  homepage "https://github.com/alvarosanchez/ocp"
  version "0.5.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{version}/ocp-#{version}-macos-aarch64"
    sha256 "cf2a6ecd6b52a4c1beb64fde79b7d5601ec8b71b015615a35046dbb0be32fb5b"
  elsif OS.mac?
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{version}/ocp-#{version}-macos-x86_64"
    sha256 "0314439bd3bea6b894d17ee8209a766ae255138f6dd6d0c4cfe1645dee307e31"
  else
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{version}/ocp-#{version}-linux-x86_64"
    sha256 "6ad7e7a0a493ee6ce99c50f5a9dce6bc8f02980fa7397fdf4ae0e08a32c4a1a5"
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
