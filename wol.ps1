$mac = "DE:DA:CD:ED"
$macbytes = $mac -split "[:-]" | ForEach-Object { [Byte] "0x$_"}
[Byte[]] $mgcpkt = (,0xFF * 6) + ($macbytes * 16)
$udp = New-Object System.Net.Sockets.UdpClient
$udp.Connect("192.168.1.255", 9)
$udp.Send($mgcpkt, $mgcpkt.length)
$udp.Close()


# https://www.pdq.com/blog/wake-on-lan-wol-magic-packet-powershell/
## i use port 9 instead of pdq.com's port 7 because, somewhere forgotten,
## maybe wikipedia linked off ubuntu community page for WoL, said to send
## wake on lan over "port 9 discard"
