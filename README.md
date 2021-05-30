# Welcome to the netman!

Netman is a light weight network manage tool on Ubuntu. You can easily find network problems on your personal host using netman.

# What can netman do?
1. Accounting management

	1.1 Real-time monitoring of network equipment traffic and rate changes, based on[[Bmon](https://zhuanlan.zhihu.com/p/26307811) tool.

	1.2 a log of network traffic for the selected interface(s). It uses the network interface statistics provided by the kernel as information source, based on [vnstat](https://humdi.net/vnstat/) tool.
2. Configuration management
3. Safty management
4. Performance management
5. Fault management

# Installation

npm i [-g] netman

# Usage

```
Usage: netman [options]
 
Options:
  -V, --version            output the version number
  -s, --NI_stat [NI_name]  Log network traffic for the specified interface
  -m, --monitor [NI_name]  Real-time Monitoring of network interface(NI)
                           bandwidth.
  -h, --help               display help for command
```
