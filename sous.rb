class Sous < Formula
  desc "Sous tool for building and deploying at OpenTable"
  homepage "https://github.com/opentable/sous"
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
