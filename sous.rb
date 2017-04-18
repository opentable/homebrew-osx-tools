class Sous < Formula
  desc "Sous tool for building and deploying at OpenTable"
  homepage "https://github.com/opentable/sous"

  # When the version of Sous changes, these two fields need to be updated
  version "0.5.0"
  sha256 "b730a0c10e45139ead0755e008f241854388a0490d27840ed76d5e05fac486e4"

  url "https://github.com/opentable/sous/releases/download/0.5.0/sous-darwin-amd64_0.5.0.tar.gz"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    bin.install "sous"
  end

  test do
    system "sous", "version"
  end
end
