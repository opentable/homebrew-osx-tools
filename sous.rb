class Sous < Formula
  desc "Sous tool for building and deploying at OpenTable"
  homepage "https://github.com/opentable/sous"
  url "http://artifactory.otenv.com/artifactory/internal/sous/sous-v0.0.0-alpha.4-darwin-amd64.tar.gz"
  version "0.0.0"
  sha256 "4027a4148ec82de52d725108228dc02b03485624a09e524604aee72468e22c53"
  def install
    prefix.install "sous"
  end
  test do
    sous version
  end
end
