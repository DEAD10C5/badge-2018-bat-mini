#    ____  _____      _    ____    _  ___     ____ ____
#   |  _ \| ____|_   / \  |  _ \ _/ |/ _ \ _ / ___| ___|
#   | | | |  _| (_) / _ \ | | | (_) | | | (_) |   |___ \
#   | |_| | |___ _ / ___ \| |_| |_| | |_| |_| |___ ___) |
#   |____/|_____(_)_/   \_\____/(_)_|\___/(_)\____|____/


#   Author : @dead10c5 @theDevilsVoice
#   Date   : July 9, 2018
#   Version: 0.2
`
  #$HOME/.arduino15
  export DISPLAY=:1.0
  wget http://downloads.arduino.cc/arduino-1.8.6-linux64.tar.xz
  tar xf arduino-1.8.6-linux64.tar.xz
  sudo mv arduino-1.8.6 /usr/local/share/arduino
  sudo ln -s /usr/local/share/arduino/arduino /usr/local/bin/arduino
  ln -s $PWD /usr/local/share/arduino/libraries/
  arduino --pref "boardsmanager.additional.urls=http://arduino.esp8266.com/stable/package_esp8266com_index.json,https://raw.githubusercontent.com/damellis/attiny/ide-1.6.x-boards-manager/package_damellis_attiny_index.json" --save-prefs
  wget https://github.com/damellis/attiny/archive/master.zip
  unzip master.zip
  sudo mkdir -p /usr/local/share/arduino/hardware/attiny
  sudo mv attiny-master /usr/local/share/arduino/hardware/attiny/avr
  arduino --install-boards attiny:avr 
  arduino --board $BD --save-prefs
  arduino --pref "compiler.warning_level=all" --save-prefs
  #- arduino --pref "custom_clock=attiny_internal1"  --save-prefs
  #- arduino --pref "custom_cpu=attiny_attiny84" --save-prefs
  git clone https://github.com/pololu/apa102-arduino.git /usr/local/share/arduino/libraries/apa102-arduino
  # do the checks
  arduino --verify --board $BD /usr/local/share/arduino/libraries/bat_mini/arduino/hardware_test/hardware_test.ino
  arduino --verify --board $BD /usr/local/share/arduino/libraries/bat_mini/arduino/bat_mini_2018/bat_mini_2018.ino
