cask "pomopet" do
  version "1.1.0"
  sha256 "036d9f01a4addec50ff90bcf237e4bb4a2ca5406698ad7a9adfa756e2415e6b8"

  url "https://github.com/kes02/Pomopet/releases/download/v#{version}/Pomopet-#{version}.dmg"
  name "Pomopet"
  desc "Menu bar Pomodoro timer with an uploaded character that wakes up as you study"
  homepage "https://github.com/kes02/Pomopet"

  app "Pomopet.app"

  # 미서명 빌드: Gatekeeper 격리 속성 제거해 바로 실행되게 함
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Pomopet.app"]
  end

  zap trash: [
    "~/Library/Containers/com.kes02.Pomopet",
    "~/Library/Preferences/com.kes02.Pomopet.plist",
  ]
end
