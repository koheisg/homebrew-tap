cask "emacx" do
  version "0.2.0"
  sha256 "0621a20d805688e691cdc7d63895ba7bc94d88ea6df63538c952f9158a32e664"

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
