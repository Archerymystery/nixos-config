{ config, pkgs, ... }:

{
  # Налаштування інтерфейсів
  networking.interfaces.wlan0 = {
    ipv4.addresses = [{
      address = "192.168.50.1";
      prefixLength = 24;
    }];
  };

  # Вимкнути NetworkManager для wlan0
  networking.networkmanager.unmanaged = [ "wlan0" ];

  # NAT
  networking.nat = {
    enable = true;
    externalInterface = "enp6s0f4u2"; # ВАЖЛИВО: Змініть на ваш інтерфейс з інтернетом!
    internalInterfaces = [ "wlan0" ];
  };

  # Firewall
  networking.firewall = {
    allowedUDPPorts = [ 53 67 ];
    trustedInterfaces = [ "wlan0" ];
  };

  # IP forwarding
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;

  # hostapd
  services.hostapd = {
    enable = true;
    radios.wlan0 = {
      band = "2g";
      channel = 6;
      countryCode = "UA";

      networks.wlan0 = {
        ssid = "Grokhem_WiFi";
        authentication = {
          mode = "wpa2-sha256";
          wpaPassword = "QAZwsx123";
        };
      };
    };
  };

  # DHCP сервер
  services.dnsmasq = {
    enable = true;
    settings = {
      interface = "wlan0";
      bind-interfaces = true;
      dhcp-range = [ "192.168.50.10,192.168.50.50,24h" ];
      dhcp-option = [
        "3,192.168.50.1"
        "6,192.168.50.1"
      ];
      server = [ "8.8.8.8" "8.8.4.4" ];
      log-queries = true;
      log-facility = "/var/log/dnsmasq.log";
    };
  };

  # Пакети для моніторингу
  environment.systemPackages = with pkgs; [
    tcpdump
    iftop
    vnstat
    iptables
    nmap
    wireshark
    htop
  ];

  services.vnstat.enable = true;

  # Опціонально: ntopng для веб-моніторингу
  services.ntopng = {
    enable = true;
    interfaces = [ "wlan0" ];
    httpPort = 3000;
  };
}
