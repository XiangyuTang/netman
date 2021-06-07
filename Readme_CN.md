<img src="https://img-blog.csdnimg.cn/2021060700295267.png" width = "230" height = ""  />
**简体中文| [English](https://github.com/XiangyuTang/netman/blob/master/README.md)** <br>
# 欢迎来到netman !

[![Build Status](https://travis-ci.org/meolu/walden.svg?branch=master)](https://travis-ci.org/meolu/walden)

Netman是Ubuntu上的一个轻量级、易部署、可扩展的网络管理工具。它由常用的网络管理工具组成。使用netman，您可以很容易地在您的个人主机上发现并解决常见的网络问题。

# netman能做什么?

## 项目框架

<img src="https://img-blog.csdnimg.cn/20210607113209700.png" align="center" width = "" height = "400"  />

## 功能原理实现介绍

1. **计费管理**

	1.1 实时监控网络设备带宽流量和速率变化，基于 [Bmon](https://zhuanlan.zhihu.com/p/26307811) 工具实现。

	1.2 统计网络设备接口的流量日志，它使用内核提供的网络接口统计信息作为信息源，基于 [vnstat](https://humdi.net/vnstat/) 工具实现。
2. **配置管理**

	2.1 显示支持添加、修改、查看和删除连接的网络连接编辑器，基于nmtui工具实现。

	2.2 部署在 [IPMininet](https://ipmininet.readthedocs.io/en/latest/) 上的高级网络管理，可以通过SRv6提供流量工程。
	
3. **安全管理**

	3.1 基于[ufw](https://help.ubuntu.com/community/UFW)的防火墙配置，包括打开/关闭防火墙，允许/拒绝特定端口或服务，检查防火墙状态等。

	3.2 根据[netstat](https://en.wikipedia.org/wiki/Netstat)和[危险端口列表](https://github.com/T0xst/linux/blob/master/checkrules/dangerstcpports.dat)自动检查是否有危险端口在使用。

4. **性能管理**

	4.1 网络性能模块收集延迟和丢包数据，并自动估计应用程序感知的延迟供用户参考。

5. **故障管理**

	5.1 网络故障自动诊断，通过网络节点间的连通性测试和DNS服务器检测，自动检测和定位网络故障，并提供解决建议。

	5.2 网络诊断通过探测路由器上的路由路径并提供相应的统计信息，基于[mtr](https://help.aliyun.com/knowledge_detail/98706.html)工具。利用这些信息，可以更准确地定位网络故障的位置。

# 快速开始

- 全局安装

```bash
npm install -g netman
```
之后cd进入到包含package.json所在目录下，执行netman命令验证是否安装成功。

- 本地安装（适用于二次开发调试）

  1.新建一个目录，进入该目录后输入命令：

  ```bash
  npm install netman
  ```

  2.此时该目录下会生成node_module文件夹和package_lock.json文件，cd 进入 node_module/netman/，当前目录下应包含package.json文件；

  3.输入命令：（如果不需要进入开发环境，跳过该步即可）
  
  ```bash
  npm link
  ```
  
  4.输入netman验证是否安装成功。

# 使用指南

```bash
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
