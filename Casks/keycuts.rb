cask "keycuts" do
  arch arm: "arm64", intel: "x64"

  version "2.3.0"
  sha256 arm:   "7844ddb88c52d0eb15ea56a4c8c9d503c982586ef3778827a2a7383e521d4c83",
         intel: "d4c43a4e9e057d09f98083f6755365e41886e7bd0b7f34f14c71465c16da3466"

  url "https://github.com/andrewralon/keycuts/releases/download/v#{version}/keycuts-setup-#{arch}.pkg"
  name "keycuts"
  desc "Open anything by nickname: from Terminal, or from the Run box"
  homepage "https://github.com/andrewralon/keycuts"

  depends_on macos: :ventura

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
