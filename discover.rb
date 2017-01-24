class Discover < Formula
  homepage "https://github.com/opentable/discover"

  version "0.0.6"
  sha256 "43669bd78f2552e0bf96f796d9ef328537b8a4031c895e617e66caed68b66571"

  # Github releases to private repos return 404 without an Oauth token, which
  # would need to be distributed in this (public, because brew...) repo.
  # Therefore, when discover is released, the source tarball needs to be
  # deployed as well to artifactory
  url "http://artifactory.otenv.com/artifactory/dev_tools/discover-0.0.6.tar.gz"

  depends_on "go" => :build

  def install
    system "GOPATH=" + buildpath + "/Godeps/_workspace go build -o discover"
    bin.install("discover")
  end

  test do
    system("discover", "--help")
  end
end
