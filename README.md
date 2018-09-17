# To finish the installation of the VPN role you must run the following commands
vi /etc/openvpn/cred.conf
#Enter username and password
#:wq!

# Run the following commands to verify that your IP and GeoLocation has changed
curl ipecho.net/plain ; echo
curl ipinfo.io
