class Discover < Formula
  homepage "https://github.com/opentable/discover"

  version "0.0.6"
  sha256 "55c3793bb18d6be8f6d7e53140f33e522f2b803c"

  url "https://github.com/opentable/discover/archive/v0.0.6.tar.gz"

  depends_on "go" => :build

  def install
    system "GOPATH=" + buildpath + "/Godeps/_workspace go build -o discover"
    bin.install("discover")
  end

  test do
    system("discover", "--help")
  end
end
