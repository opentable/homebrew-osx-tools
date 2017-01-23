class Sous < Formula
  desc "Sous tool for building and deploying at OpenTable"
  homepage "https://github.com/opentable/sous"

  # When the version of Sous changes, these two fields need to be updated
  version "0.1.7"
  sha256 "539ca446ecd9f931cb6eba24312f7dd1c724c4222140a701ababa3aef9265a1e"

  url "https://github.com/opentable/sous/releases/download/v#{version}/sous-darwin-amd64_#{version}.tar.gz"

  # depends_on "cmake" => :build
  depends_on :x11 # if your formula requires any X11/XQuartz components

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    bin.install "sous"
  end

  test do
    system "sous", "version"
  end
end

=begin

class Sous < Formula
  head "https://github.com/opentable/sous.git"
  depends_on "go" => :build
  def install
    ENV["GOPATH"] = buildpath
    ENV["PATH"] = ENV["PATH"] + ":" + ENV["GOPATH"] + "/bin"
    system "mkdir", "-p", "src/github.com/opentable/sous"
    system "git ls-files | while read x; do X=(${x//// }); echo ${X[0]}; done | uniq | while read y; do mv $y src/github.com/opentable/sous/; done"
    system "mv .git src/github.com/opentable/sous/"
    system "go", "get", "-u", "github.com/tools/godep"
    cd "src/github.com/opentable/sous" do
      # These lines try to set BRANCH=tag, if it fails, sets BRANCH=branch name or 'HEAD' if detached
      set_tag = "BRANCH=$(git describe --exact-match --abbrev=0 --tags 2>/dev/null)"
      set_branch = "BRANCH=$(git rev-parse --abbrev-ref HEAD)"
      set_BRANCH = "#{set_tag} || #{set_branch}"
      compile_sous = "./scripts/build darwin/amd64"
      copy_artifact = "cp artifacts/$BRANCH/darwin/amd64/sous $GOPATH/sous"
      system "#{set_BRANCH} && #{compile_sous} && #{copy_artifact}"
      bin.install ENV["GOPATH"] + "/sous"
    end
  end
  test do
    system "sous", "version"
  end
end
