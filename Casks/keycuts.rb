cask "keycuts" do
  arch arm: "arm64", intel: "x64"

  version "2.2.0"
  sha256 arm:   "27fc7e9c6d3d1d8e7abab2538801a2d3c223741f13af66fbdfde602cb2bf98c4",
         intel: "4166b18bb5b715ebe2368ee2d7c241d902380d1103ceabe8db36ea215debde13"

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
