function FindProxyForURL(url, host)
{
  if (dnsDomainIs(host, ".mentorg.com")
      || dnsDomainIs(host, ".mentor.com")
      || host == "help"
      || shExpMatch(host, "teams-*")
      || shExpMatch(host, "*web")
      || host == "hardware"
      || host == "webrequest")
  {
    return "SOCKS5 localhost:8000; DIRECT";
  }
  return "DIRECT";
}
