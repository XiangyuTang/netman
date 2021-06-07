![](https://img-blog.csdnimg.cn/2021060700295267.png)
# Welcome to the netman!

[![Build Status](https://travis-ci.org/meolu/walden.svg?branch=master)](https://travis-ci.org/meolu/walden)

Netman is a light weight network manage tool on Ubuntu. It consists of common network management tools. You can easily find network problems on your personal host using netman.

# What can netman do?

## Framework
![](https://img-blog.csdnimg.cn/20210607113209700.png)

## Details

1. Accounting management

	1.1 Real-time monitoring of network equipment traffic and rate changes, based on [Bmon](https://zhuanlan.zhihu.com/p/26307811) tool.

	1.2 A log of network traffic for the selected interface(s). It uses the network interface statistics provided by the kernel as information source, based on [vnstat](https://humdi.net/vnstat/) tool.
2. Configuration management

	2.1 Show a network connection editor that supports adding, modifying, viewing and deleting connections, based on [nmtui](nmtui is a curses‐based TUI application for interacting with NetworkManager. When starting nmtui, the user is prompted to choose the activity to perform unless it was specified as the first argument.).

	2.2 Advanced network management deployed on [IPMininet](https://ipmininet.readthedocs.io/en/latest/) which can offer traffic engineering by SRv6.
	
3. Safty management

	3.1 Firewall configuration based on [ufw](https://help.ubuntu.com/community/UFW), including open/close firewall, allow/deny specific ports or services, check firewall status, etc.

	3.2 Check whether there are dangerous ports in use automatically, based on [netstat](https://en.wikipedia.org/wiki/Netstat) and [a list of dangerous ports](https://github.com/T0xst/linux/blob/master/checkrules/dangerstcpports.dat).

4. Performance management

	4.1 Network Performance module collects the latency and packet loss data and automatically estimates a application-perceived latency for the user's references.

5. Fault management

	5.1 Automatic network fault diagnostic for you reference. It automatically detects and locates network faults by testing the connectivity between network nodes and inspecting DNS servers, and provides suggested solutions.

	5.2 Network diagnostic by probing routers on the route path and provide corresponding statistical information, based on [mtr](https://help.aliyun.com/knowledge_detail/98706.html) tool. Using these information, the location of network fault can be located more accurately.

# Installation

npm i <-g> netman

# Usage

```
Usage: netman [options]

Options:
  -V, --version                             output the version number
  -s, --NI_stat [NI_name]                   Log network traffic for the specified interface.
  -m, --monitor [NI_name]                   Real-time Monitoring of network interface(NI) bandwidth.
  -nm, --management                         Configure network info in GUI.
  -fw, --firewall [action,paremeter...]     Actions:
  						open: Open firewall
  						close: Close firewall
  						status: Show current firewall status
  						allow: Allow specific ports or services (e.g., allow 72/tcp 73/udp 90 http)
  						deny: Deny specific ports or services (e.g., deny 72 73 90 http)
  						reset: Clear all fire settings
  -check, --security_check                  Check whether there are open dangerous ports.
  -mtr, --mytraceroute [parameter...]       Network diagnostic by probing routers on the route path.
                                            [-mtr help] for more information.
  -afd, --auto_fault_diagnostic [hostname]  Automatic network fault diagnostic for you reference.
  -p, --performance [paremeter...]          Calculate packet loss rate, RTT Delay. (e.g.netman -p
                                            [eth_name][host_name])
  -h, --help                                display help for command

```
