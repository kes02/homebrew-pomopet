cask "pomopet" do
  version "1.3.0"
  sha256 "ab24fe2b429d43cab4e1648be0d936115f24612a091f8986190be8c27aa6be98"

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
