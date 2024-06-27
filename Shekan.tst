{
 "stats": {},
 "log": {
  "loglevel": "none"
 },
 "policy": {
  "levels": {
   "8": {
    "handshake": 4,
    "connIdle": 300,
    "uplinkOnly": 1,
    "downlinkOnly": 1
   }
  },
  "system": {
   "statsOutboundUplink": true,
   "statsOutboundDownlink": true
  }
 },
 "inbounds": [
  {
   "tag": "socks",
   "port": 10808,
   "protocol": "socks",
   "settings": {
    "auth": "noauth",
    "udp": true,
    "userLevel": 8
   },
   "sniffing": {
    "enabled": true,
    "destOverride": [
     "http",
     "tls"
    ]
   }
  },
  {
   "tag": "http",
   "port": 10809,
   "protocol": "http",
   "settings": {
    "userLevel": 8
   }
  }
 ],
 "outbounds": [
  {
   "tag": "proxy",
   "protocol": "vless",
   "settings": {
    "vnext": [
     {
      "address": "9.shecanmarket.com",
      "port": 8443,
      "users": [
       {
        "id": "c0a7bf9e-a9fe-49bf-bf0f-8fb162c6a849",
        "security": "auto",
        "level": 8,
        "encryption": "none",
        "flow": ""
       }
      ]
     }
    ]
   },
   "streamSettings": {
    "network": "tcp",
    "security": "none",
    "tcpSettings": {
     "header": {
      "type": "http",
      "request": {
       "path": [
        "\/"
       ],
       "headers": {
        "Host": [
         "head.shecanmarket.com"
        ],
        "User-Agent": [
         "Mozilla\/5.0 (Windows NT 10.0; WOW64) AppleWebKit\/537.36 (KHTML, like Gecko) Chrome\/53.0.2785.143 Safari\/537.36",
         "Mozilla\/5.0 (iPhone; CPU iPhone OS 10_0_2 like Mac OS X) AppleWebKit\/601.1 (KHTML, like Gecko) CriOS\/53.0.2785.109 Mobile\/14A456 Safari\/601.1.46"
        ],
        "Accept-Encoding": [
         "gzip, deflate"
        ],
        "Connection": [
         "keep-alive"
        ],
        "Pragma": "no-cache"
       },
       "version": "1.1",
       "method": "GET"
      }
     }
    }
   },
   "mux": {
    "enabled": false,
    "concurrency": -1,
    "xudpConcurrency": 8,
    "xudpProxyUDP443": ""
   }
  },
  {
   "tag": "direct",
   "protocol": "freedom",
   "settings": {},
   "mux": {
    "enabled": false,
    "concurrency": 8,
    "xudpConcurrency": 8,
    "xudpProxyUDP443": ""
   }
  },
  {
   "tag": "block",
   "protocol": "blackhole",
   "settings": {
    "response": {
     "type": "http"
    }
   },
   "mux": {
    "enabled": false,
    "concurrency": 8,
    "xudpConcurrency": 8,
    "xudpProxyUDP443": ""
   }
  }
 ],
 "dns": {
  "servers": [
   "8.8.8.8"
  ]
 },
 "routing": {
  "domainStrategy": "Asls",
  "rules": []
 }
}
