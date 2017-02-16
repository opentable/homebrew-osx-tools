class Sous < Formula
  desc "Sous tool for building and deploying at OpenTable"
  homepage "https://github.com/opentable/sous"

  # When the version of Sous changes, these two fields need to be updated
  version "0.1.9"
  sha256 "217b6969ff130766f5540476908e26f798b0c8ce1e8f6eb025a3795eb9092351"

  url "https://github.com/opentable/sous/releases/download/#{version}/sous-darwin-amd64_#{version}.tar.gz"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    bin.install "sous"
  end

  test do
    system "sous", "version"
  end
end
