pwd = `pwd`.chomp
launchd_service_filename = pwd + '/heroku_notifications_launchd_service.plist'

launchd_content = <<~EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" 
 "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
      <string>com.github.jacobsmith.herokunotifications</string>

    <key>ProgramArguments</key>
    <array>
      <string>#{ pwd + '/run_heroku_notifications_launchd_service' }</string>
    </array>

    <key>KeepAlive</key>
    <dict>
      <key>NetworkState</key>
      <true />
    </dict>

    <key>StandardOutPath</key>
      <string>/tmp/heroku_notifications.stdout</string>

    <key>StandardErrorPath</key>
      <string>/tmp/heroku_notifications.stderr</string>

    <key>EnvironmentVariables</key>
    <dict>
      <key>PATH</key>
      <string>#{ ENV["PATH"] }</string>
    </dict>
  </dict>
</plist>
EOF

File.open(launchd_service_filename, "w") do |file|
  file.puts launchd_content
end

File.open(pwd + '/run_heroku_notifications_launchd_service', 'w') do |file|
  ruby_path = `which ruby`.chomp
  file.puts "cd #{pwd} && PORT=60123 bundle exec #{ruby_path} #{pwd}/app.rb"
end
