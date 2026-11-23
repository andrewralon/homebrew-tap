cask "keycuts" do
  arch arm: "arm64", intel: "x64"

  version "2.1.0"
  sha256 arm:   "46d1b3338b9ae52d2e5f5a769011d8f93046542a9f9e4c5db72e089413697463",
         intel: "0cefb9b5c5016ac6689ee019464ed79f9322f49d1dac72ff9d4b581d36d3984b"

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
