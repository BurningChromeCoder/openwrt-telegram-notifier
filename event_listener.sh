#!/bin/ash


TELEGRAM_BOT="https://api.telegram.org/bot$API_KEY/sendMessage"

# Define variables to store the MAC addresses of the known devices
DEVICE1="00:00:00:00:00:00"
DEVICE2="00:00:00:00:00:00"
DEVICE3="00:00:00:00:00:00"
DEVICE4="00:00:00:00:00:00"
DEVICE5="00:00:00:00:00:00"
DEVICE6="00:00:00:00:00:00"
DEVICE7="00:00:00:00:00:00"
DEVICE8="00:00:00:00:00:00"
DEVICE9="00:00:00:00:00:00"
DEVICE10="00:00:00:00:00:00"




# Define variables to store the names of the known devices
DEVICE1_NAME="Device1"
DEVICE2_NAME="Device2"
DEVICE3_NAME="Device3"
DEVICE4_NAME="Device4"
DEVICE5_NAME="Device5"
DEVICE6_NAME="Device6"
DEVICE7_NAME="Device7"
DEVICE8_NAME="Device8"
DEVICE9_NAME="Device9"
DEVICE10_NAME="Device10"


# Define a function to send a message to Telegram
send_telegram_message() {
  local message="$1"
  curl -s --data-urlencode "text=$message" --data-urlencode "chat_id=$GROUP_CHAT_ID" "$TELEGRAM_BOT" > /dev/null
}

# Check if a device has connected
if [[ $2 == "AP-STA-CONNECTED" ]]; then
  if [[ -z $3 ]]; then
    echo "missing argument"
  else
    DEVICE_NAME=""
    if [[ $3 == $DEVICE1 ]]; then
      DEVICE_NAME="$DEVICE1_NAME"
    elif [[ $3 == $DEVICE2 ]]; then
      DEVICE_NAME="$DEVICE2_NAME"
    elif [[ $3 == $DEVICE3 ]]; then
      DEVICE_NAME="$DEVICE3_NAME"
    elif [[ $3 == $DEVICE4 ]]; then
      DEVICE_NAME="$DEVICE4_NAME"
    elif [[ $3 == $DEVICE5 ]]; then
      DEVICE_NAME="$DEVICE5_NAME"
    elif [[ $3 == $DEVICE6 ]]; then
      DEVICE_NAME="$DEVICE6_NAME"
    elif [[ $3 == $DEVICE7 ]]; then
      DEVICE_NAME="$DEVICE7_NAME"
    elif [[ $3 == $DEVICE8 ]]; then
      DEVICE_NAME="$DEVICE8_NAME"
    elif [[ $3 == $DEVICE9 ]]; then
      DEVICE_NAME="$DEVICE9_NAME"
    elif [[ $3 == $DEVICE10 ]]; then
      DEVICE_NAME="$DEVICE10_NAME"                  
    else
      DEVICE_NAME="Unknown device ($3)"
    fi
    TEXT="$DEVICE_NAME has joined $1"
    send_telegram_message "$TEXT"
  fi
fi

# Check if a device has disconnected
if [[ $2 == "AP-STA-DISCONNECTED" ]]; then
  if [[ -z $3 ]]; then
    echo "missing argument"
  else
    DEVICE_NAME=""
    if [[ $3 == $DEVICE1 ]]; then
      DEVICE_NAME="$DEVICE1_NAME"
    elif [[ $3 == $DEVICE2 ]]; then
      DEVICE_NAME="$DEVICE2_NAME"
    elif [[ $3 == $DEVICE3 ]]; then
      DEVICE_NAME="$DEVICE3_NAME"
    elif [[ $3 == $DEVICE4 ]]; then
      DEVICE_NAME="$DEVICE4_NAME"
    elif [[ $3 == $DEVICE5 ]]; then
      DEVICE_NAME="$DEVICE5_NAME"
    elif [[ $3 == $DEVICE6 ]]; then
      DEVICE_NAME="$DEVICE6_NAME"
    elif [[ $3 == $DEVICE7 ]]; then
      DEVICE_NAME="$DEVICE7_NAME"
    elif [[ $3 == $DEVICE8 ]]; then
      DEVICE_NAME="$DEVICE8_NAME"
    elif [[ $3 == $DEVICE9 ]]; then
      DEVICE_NAME="$DEVICE9_NAME"
    elif [[ $3 == $DEVICE10 ]]; then
      DEVICE_NAME="$DEVICE10_NAME"

    else
      DEVICE_NAME="Unknown device ($3)"
    fi
    TEXT="$DEVICE_NAME has disconnected from $1"
    send_telegram_message "$TEXT"
  fi
fi


