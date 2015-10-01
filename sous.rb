class Sous < Formula
  desc "Sous tool for building and deploying at OpenTable"
  homepage "https://github.com/opentable/sous"
  url "http://artifactory.otenv.com/artifactory/internal/sous/sous-master-darwin-amd64.tar.gz"
  version "0.0.0-alpha.5"
  sha256 "fb16436ce626807c93252ee48941c0a529d42178caeb43f15d83036c8197537a"
  def install
    bin.install("sous")
  end
  test do
    system("sous", "version")
  end
end
