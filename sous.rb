class Sous < Formula
  desc "Sous tool for building and deploying at OpenTable"
  homepage "https://github.com/opentable/sous"
  url "https://github.com/opentable/sous.git",
		  :tag => "v0.0.2-alpha.1",
		  :revision => "bb168adb8c49d45e951e46efd162eef82f078a3d"
  head "https://github.com/opentable/sous.git"
  version "v0.0.2-alpha.1"
  bottle do
    root_url "http://artifactory.otenv.com/artifactory/internal/sous"
    sha256 "f165c745ae2833bf058a4ae7464a67f3ce129a4660c006e8b53e285e32a419b6" => :el_capitan 
    sha256 "f165c745ae2833bf058a4ae7464a67f3ce129a4660c006e8b53e285e32a419b6" => :yosemite 
    sha256 "f165c745ae2833bf058a4ae7464a67f3ce129a4660c006e8b53e285e32a419b6" => :mavericks 
    sha256 "f165c745ae2833bf058a4ae7464a67f3ce129a4660c006e8b53e285e32a419b6" => :mountain_lion 
  end
  depends_on "go" => :build
  def install
	system "GOPATH=" + buildpath + "/Godeps/_workspace go build -o sous"
    bin.install("sous")
  end
  test do
    system("sous", "version")
  end
end
