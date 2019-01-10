pwd = `pwd`.chomp
launchd_service_filename = pwd + '/serveo_launchd_service.plist'

launchd_content = <<~EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" 
 "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>Label</key>
<string>com.serveo.localnotifications</string>
<key>ProgramArguments</key>
<array>
<string>#{ pwd + '/run_serveo_service' }</string>
</array>
<key>KeepAlive</key>
<true/>
<key>StandardOutPath</key>
<string>/tmp/serveo.stdout</string>
<key>StandardErrorPath</key>
<string>/tmp/serveo.stderr</string>
</dict>
</plist>
EOF

File.open(launchd_service_filename, "w") do |file|
  file.puts launchd_content
end
