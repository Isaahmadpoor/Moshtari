#profile-title: base64:VFZDIHwgV0FSUA==
#profile-update-interval: 1
#subscription-userinfo: upload=0; download=0; total=10737418240000000; expire=1722211131
#support-url: https://t.me/v2raycollector
#profile-web-page-url: https://github.com/yebekhe/TelegramV2rayCollector

{
    "log": {
        "disabled": false,
        "level": "fatal",
        "timestamp": true
    },
    "experimental": {
        "clash_api": {
            "external_controller": "0.0.0.0:9090",
            "external_ui": "yacd",
            "external_ui_download_url": "https:\/\/github.com\/MetaCubeX\/Yacd-meta\/archive\/gh-pages.zip",
            "external_ui_download_detour": "direct",
            "secret": "",
            "default_mode": "rule"
        }
    },
    "dns": {
        "servers": [
            {
                "address": "tcp:\/\/185.228.168.9",
                "address_resolver": "dns-direct",
                "strategy": "ipv4_only",
                "tag": "dns-remote"
            },
            {
                "address": "tcp:\/\/185.228.168.9",
                "address_resolver": "dns-local",
                "detour": "direct",
                "strategy": "ipv4_only",
                "tag": "dns-direct"
            },
            {
                "address": "local",
                "detour": "direct",
                "tag": "dns-local"
            },
            {
                "address": "rcode:\/\/success",
                "tag": "dns-block"
            }
        ],
        "rules": [
            {
                "domain_suffix": [
                    ".ir"
                ],
                "server": "dns-direct"
            },
            {
                "outbound": "direct",
                "server": "dns-direct",
                "rewrite_ttl": 20
            },
            {
                "outbound": "any",
                "server": "dns-direct",
                "rewrite_ttl": 20
            }
        ],
        "reverse_mapping": true,
        "strategy": "ipv4_only",
        "independent_cache": true
    },
    "inbounds": [
        {
            "listen": "0.0.0.0",
            "listen_port": 6450,
            "override_address": "8.8.8.8",
            "override_port": 53,
            "tag": "dns-in",
            "type": "direct"
        },
        {
            "type": "tun",
            "tag": "tun-in",
            "domain_strategy": "",
            "interface_name": "tun0",
            "inet4_address": "172.19.0.1\/30",
            "mtu": 9000,
            "auto_route": true,
            "strict_route": true,
            "stack": "system",
            "endpoint_independent_nat": true,
            "sniff": true,
            "sniff_override_destination": false
        },
        {
            "domain_strategy": "",
            "listen": "0.0.0.0",
            "listen_port": 2080,
            "sniff": true,
            "sniff_override_destination": false,
            "tag": "mixed-in",
            "type": "mixed"
        }
    ],
    "outbounds": [
        {
            "tag": "proxy",
            "type": "selector",
            "outbounds": [
                "URL-TEST",
                "WARP"
            ]
        },
        {
            "tag": "URL-TEST",
            "type": "urltest",
            "outbounds": [
                "WARP"
            ],
            "url": "https:\/\/www.gstatic.com\/generate_204",
            "interval": "3m",
            "tolerance": 50
        },
        {
            "tag": "direct",
            "type": "direct"
        },
        {
            "tag": "bypass",
            "type": "direct"
        },
        {
            "tag": "block",
            "type": "block"
        },
        {
            "tag": "dns-out",
            "type": "dns"
        },
        {
            "type": "wireguard",
            "server": "188.114.96.244",
            "server_port": 1701,
            "local_address": [
                "172.16.0.2\/32",
                "2606:4700:110:88ea:4a08:ef40:10cb:2c\/128"
            ],
            "private_key": "qEo3MIGS6PuyneJsdIbX6Ww24AMhOqLye5gK6BkjL2Y=",
            "peer_public_key": "bmXOC+F1FxEMF9dyiK2H5\/1SUtzH0JuVo51h2wPfgyo=",
            "mtu": 1280,
            "reserved": "pkof",
            "tag": "WARP"
        }
    ],
    "route": {
        "auto_detect_interface": true,
        "override_android_vpn": true,
        "final": "proxy",
        "geoip": {
            "download_url": "https:\/\/github.com\/MiSaturo\/sing-box-geoip-ir\/releases\/latest\/download\/geoip.db",
            "download_detour": "direct"
        },
        "geosite": {
            "download_url": "https:\/\/github.com\/MasterKia\/iran-hosted-domains\/releases\/latest\/download\/iran-geosite.db",
            "download_detour": "direct"
        },
        "rules": [
            {
                "outbound": "dns-out",
                "port": [
                    53
                ]
            },
            {
                "inbound": [
                    "dns-in"
                ],
                "outbound": "dns-out"
            },
            {
                "domain_suffix": [
                    "ir"
                ],
                "outbound": "bypass"
            },
            {
                "geoip": [
                    "ir"
                ],
                "outbound": "bypass"
            },
            {
                "geosite": [
                    "ir"
                ],
                "outbound": "direct"
            },
            {
                "geosite": [
                    "other"
                ],
                "outbound": "direct"
            },
            {
                "geosite": [
                    "ads"
                ],
                "outbound": "block"
            },
            {
                "ip_cidr": [
                    "224.0.0.0\/3",
                    "ff00::\/8"
                ],
                "outbound": "block",
                "source_ip_cidr": [
                    "224.0.0.0\/3",
                    "ff00::\/8"
                ]
            }
        ]
    }
}
