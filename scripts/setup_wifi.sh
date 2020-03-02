

wpa_passphrase "$WIFI_NAME" "$WIFI_PASSWORD" | sed -e 's/#.*$//' -e '/^$/d' >> /etc/wpa_supplicant/wpa_supplicant.conf
cat /etc/wpa_supplicant/wpa_supplicant.conf
