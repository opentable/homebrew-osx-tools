class Sous < Formula
  desc "Sous tool for building and deploying at OpenTable"
  homepage "https://github.com/opentable/sous"

  # When the version of Sous changes, these two fields need to be updated
  version "0.1.8"
  sha256 "5eab36f22813350520102298a677eaa6614521b57e594ef5a5d06446e5973f4a"

  url "https://github.com/opentable/sous/releases/download/#{version}/sous-darwin-amd64_#{version}.tar.gz"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    bin.install "sous"
  end

  test do
    system "sous", "version"
  end
end
