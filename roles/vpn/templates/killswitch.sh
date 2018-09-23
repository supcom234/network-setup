#!/bin/bash
EXPECTED_PUBLIC_IP="67.11.43.28"

function shutdown_services(){
    echo "Expected public IP is the same as actual IP. Kill Services!"
    systemctl stop {{ nzbget.service_name }}
    systemctl stop {{ sonarr.service_name }}
    systemctl stop {{ radarr.service_name }}

    exit 1
}

function check_public_ip(){
    local actual_ip="$(curl ipecho.net/plain ; echo)"
    if [ $EXPECTED_PUBLIC_IP == $actual_ip ]; then
        shutdown_services
    fi    
}

function check_openvpn_servie(){
    systemctl status openvpn@server > /dev/null
    local ret_val="$(echo $?)"
    
    if [ $ret_val != "0" ]; then
        shutdown_services
    fi 
}

check_public_ip
check_openvpn_servie