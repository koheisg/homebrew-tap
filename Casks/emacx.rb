cask "emacx" do
  version "0.1.0"
  sha256 "f6586c34dd1aff6620bb2c1d2af841ec00e1afd9e29bcf08f67a720b084a693c"

  url "https://github.com/koheisg/emacx/releases/download/v#{version}/Emacx-#{version}.zip"
  name "Emacx"
  desc "Menu bar app adding missing Emacs-style keybindings and clipboard history"
  homepage "https://github.com/koheisg/emacx"

  depends_on macos: :ventura

  app "Emacx.app"

  # The app is ad-hoc signed and not notarized, so Gatekeeper would block it.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Emacx.app"],
        writable_paths: ["Emacx.app"],
        writable_base:  :appdir
  end

  uninstall quit: "com.koheisg.emacx"

  zap trash: "~/Library/Preferences/com.koheisg.emacx.plist"
end
