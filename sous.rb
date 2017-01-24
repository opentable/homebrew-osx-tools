class Sous < Formula
  desc "Sous tool for building and deploying at OpenTable"
  homepage "https://github.com/opentable/sous"

  # When the version of Sous changes, these two fields need to be updated
  version "0.1.7"
  sha256 "539ca446ecd9f931cb6eba24312f7dd1c724c4222140a701ababa3aef9265a1e"

  url "https://github.com/opentable/sous/releases/download/v#{version}/sous-darwin-amd64_#{version}.tar.gz"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    bin.install "sous"
  end

  test do
    system "sous", "version"
  end
end
