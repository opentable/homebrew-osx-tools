class Sous < Formula
  desc "Sous tool for building and deploying at OpenTable"
  homepage "https://github.com/opentable/sous"
  url "https://github.com/opentable/sous.git",
		  :tag => "v0.0.3-alpha.3",
		  :revision => "11504c79dc9d0308e5c29023bac1a414c90e6c76"
  head "https://github.com/opentable/sous.git"
  version "v0.0.3-alpha.3" 
  #bottle do
  #  root_url "http://artifactory.otenv.com/artifactory/internal/sous"
  #  sha256 "ff14bb2f5d3d3b43423b3ec0daf592193975ce4166b7599b87f5a1f8a392c0ef" => :el_capitan 
  #  sha256 "ff14bb2f5d3d3b43423b3ec0daf592193975ce4166b7599b87f5a1f8a392c0ef" => :yosemite 
  #  sha256 "ff14bb2f5d3d3b43423b3ec0daf592193975ce4166b7599b87f5a1f8a392c0ef" => :mavericks 
  #  sha256 "ff14bb2f5d3d3b43423b3ec0daf592193975ce4166b7599b87f5a1f8a392c0ef" => :mountain_lion 
  #end
  depends_on "go" => :build
  #go_resource "github.com/tools/godep" do
  #  url "https://github.com/tools/godep.git", :revision => "58d90f262c13357d3203e67a33c6f7a9382f9223"
  #end
  def install
    ENV["GOPATH"] = buildpath
    ENV["PATH"] = ENV["PATH"] + ":" + ENV["GOPATH"] + "/bin"
    system "mkdir", "-p", "src/github.com/opentable/sous"
    system "git ls-files | while read x; do X=(${x//// }); echo ${X[0]}; done | uniq | while read y; do mv $y src/github.com/opentable/sous/; done"
    system "mv .git src/github.com/opentable/sous/"
    system "go", "get", "-u", "github.com/tools/godep"
    cd "src/github.com/opentable/sous" do
      ENV["VERSION"] = "v0.0.3-alpha.3"
      # This line tries to set BRANCH=tag, if it fails, sets BRANCH=branch name or 'HEAD' if detached
      # This is used for `sous version`
      system "BRANCH=$(git describe --exact-match --abbrev=0 --tags 2>/dev/null) || BRANCH=$(git rev-parse --abbrev-ref HEAD); ./scripts/build darwin/amd64; cp artifacts/$BRANCH/darwin/amd64/sous $GOPATH/sous"
      bin.install ENV["GOPATH"] + "/sous"
    end
  end
  test do
    system "sous", "version"
  end
end
