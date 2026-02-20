class Ocp < Formula
  desc "OpenCode configuration profiles CLI"
  homepage "https://github.com/alvarosanchez/ocp"
  version "0.6.1"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{version}/ocp-#{version}-macos-aarch64"
    sha256 "72558426581c34f0944b4318d7006568425dc721124a37bf2e010d7351158d15"
  elsif OS.mac?
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{version}/ocp-#{version}-macos-x86_64"
    sha256 "f767533804e516ae59d86a6c2fe81a7a0b516dbfc8cad601bed2854fe13eb177"
  else
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{version}/ocp-#{version}-linux-x86_64"
    sha256 "876c0dbf26a8f2d7e6827f43850615850d961b9938e6d70b266ccb331f08e092"
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
