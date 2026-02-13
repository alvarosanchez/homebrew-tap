class Ocp < Formula
  desc "OpenCode configuration profiles CLI"
  homepage "https://github.com/alvarosanchez/ocp"
  version "0.3.0"
  license "Apache-2.0"
  depends_on "git"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{version}/ocp-#{version}-macos-aarch64"
    sha256 "8616ed374076218c301707dc581fe64715f5ccef8d8a57f8f3154f58cd416d4e"
  elsif OS.mac?
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{version}/ocp-#{version}-macos-x86_64"
    sha256 "89acd7428bede03abedf1b1998e86cacb486ac4f12e3f080e375c8a4af346142"
  else
    url "https://github.com/alvarosanchez/ocp/releases/download/v#{version}/ocp-#{version}-linux-x86_64"
    sha256 "fc00bc8291913a8b2318f8aaa79aecb58d445349d9c85a16b92b6a866418efeb"
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
