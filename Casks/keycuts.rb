cask "keycuts" do
  arch arm: "arm64", intel: "x64"

  version "2.2.1"
  sha256 arm:   "aa94e8ed1da1f72cbeae91e86f60479e349b14c437c0117e6e91437d465df7ec",
         intel: "488de9d378aa6e806ca77c9dc777e44d6d7d728abc88dd50ffb025420cddfb3d"

  url "https://github.com/andrewralon/keycuts/releases/download/v#{version}/keycuts-setup-#{arch}.pkg"
  name "keycuts"
  desc "Open anything by nickname: from Terminal, or from the Run box"
  homepage "https://github.com/andrewralon/keycuts"

  depends_on macos: ">= :ventura"

  pkg "keycuts-setup-#{arch}.pkg"

  # The CLI (keycuts, and keypaste through its shim) is linked onto PATH
  binary "#{appdir}/keycuts.app/Contents/MacOS/keycuts"

  uninstall quit:    "com.teamralon.keycuts",
            pkgutil: "com.teamralon.keycuts"

  zap trash: [
    "~/Library/Application Support/keycuts",
    "~/Library/Services/keycut this!.workflow",
  ]
end
