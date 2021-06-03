# Welcome to the netman!

Netman is a light weight network manage tool on Ubuntu. It consists of common network management tools. You can easily find network problems on your personal host using netman.

# What can netman do?
1. Accounting management

	1.1 Real-time monitoring of network equipment traffic and rate changes, based on [Bmon](https://zhuanlan.zhihu.com/p/26307811) tool.

	1.2 A log of network traffic for the selected interface(s). It uses the network interface statistics provided by the kernel as information source, based on [vnstat](https://humdi.net/vnstat/) tool.
2. Configuration management
3. Safty management
4. Performance management
5. Fault management

# Installation

npm i <-g> netman

# Usage

```
Usage: netman [options]
 
Options:
  -V, --version                          output the version number
  -s, --NI_stat [NI_name]                Log network traffic for the specified interface
  -m, --monitor [NI_name]                Real-time Monitoring of network interface(NI) bandwidth.
  -fw, --firewall [action,paremeter...]  open: Open firewall
  					 close: Close firewall
  					 status: Show current firewall status
  					 allow: Allow specific ports or services (e.g., allow 72/tcp 73/udp 90 http)
  					 deny: Deny specific ports or services (e.g., deny 72 73 90 http)
  					 reset: Clear all fire settings
  -check, --security_check               Check whether there are open dangerous ports
  -h, --help                             display help for command

```
