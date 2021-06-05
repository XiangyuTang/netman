#!/usr/bin/env node

var program = require('commander');
var exec = require('child_process').exec; 

program
  .version('0.1.0')
  .option('-s, --NI_stat [NI_name]', 'Log network traffic for the specified interface.')
  .option('-m, --monitor [NI_name]', 'Real-time Monitoring of network interface(NI) bandwidth.')
  .option('-nm, --management', 'Configure network info in GUI.')
  .option('-fw, --firewall [action,paremeter...]', 'Actions:\n\t\t\t\t\t\topen: Open firewall\n\t\t\t\t\t\tclose: Close firewall\n\t\t\t\t\t\tstatus: Show current firewall status\n\t\t\t\t\t\tallow: Allow specific ports or services (e.g., allow 72/tcp 73/udp 90 http)\n\t\t\t\t\t\tdeny: Deny specific ports or services (e.g., deny 72 73 90 http)\n\t\t\t\t\t\treset: Clear all fire settings')
  .option('-check, --security_check', 'Check whether there are open dangerous ports.')
  .option('-mtr, --mytraceroute [parameter...]', 'Network diagnostic by probing routers on the route path. [-mtr help] for more information.')
  .option('-afd, --auto_fault_diagnostic [hostname]', 'Automatic network fault diagnostic for you reference.')
  .option('-p, --performance [paremeter...]', 'Calculate packet loss rate, RTT Delay. (e.g.netman -p [eth_name][host_name])')
  .parse(process.argv);

const options = program.opts();

if (options.monitor){
	var cmd = `gnome-terminal -t "Bmon_Terminal" -e 'bash -c "npm run -s monitor ${options.monitor};exec bash"'`;
	exec(cmd ,function(err,stdout,stderr){
	    if(err) {
    		console.log('error:'+stderr);
	    }
	    else{
        	console.log(stdout);
	    }
	});
}
else if (options.NI_stat){
        var cmd = `npm run -s stat ${options.NI_stat}`;
        exec(cmd ,function(err,stdout,stderr){
            if(err) {
                console.log('error:'+stderr);
            }
	    else{
                console.log(stdout);
            }
        });
}
else if (options.management){
	var cmd = `gnome-terminal -t "Configuration_Management_Terminal" -e 'bash -c "npm run -s management;exec bash"'`;//打开另一个终端执行脚本
	exec(cmd ,function(err,stdout,stderr){
	    if(err) {
                console.log('error:'+stderr);
            }
            else{
                console.log(stdout);
            }
	});
}
else if (options.firewall){
	var cmd=`npm run -s firewall`;
	for(var i=0;i<options.firewall.length;i++){
		cmd+=" ";
		cmd+=options.firewall[i];
	}
	exec(cmd ,function(err,stdout,stderr){
		if(err) {
			console.log('error:'+stderr);
		}
		else{
			console.log(stdout);
		}
	});
}
else if (options.security_check){
	var cmd=`npm run -s security_check`;
	exec(cmd ,function(err,stdout,stderr){
		if(err) {
			console.log('error:'+stderr);
		}
	else{
			console.log(stdout);
		}
	});
}
else if (options.mytraceroute){
    var cmd = `npm run -s mytraceroute`;
    for(var i=0;i<options.mytraceroute.length;i++){
        cmd += " ";
        cmd += options.mytraceroute[i];
    }
	cmd+=";exec bash"
	var cmd2 = `gnome-terminal -t "MTR_Terminal" -e 'bash -c "`+cmd+`"'`;
	exec(cmd2 ,function(err,stdout,stderr){
	    if(err) {
    		console.log('error:'+stderr);
	    }
	    else{
        	console.log(stdout);
	    }
	});
}
else if (options.auto_fault_diagnostic){
	var cmd=`npm run -s auto_fault_diagnostic`;
	for(var i=0;i<options.auto_fault_diagnostic.length;i++){
		cmd+=" ";
		cmd+=options.auto_fault_diagnostic[i];
	}
	exec(cmd ,function(err,stdout,stderr){
		if(err) {
			console.log('error:'+stderr);
		}
	else{
			console.log(stdout);
		}
	});
}
else if (options.performance){
        var cmd=`npm run -s performance`;
        for(var i=0;i<options.performance.length;i++){
                cmd+=" ";
                cmd+=options.performance[i];
        }
        exec(cmd ,function(err,stdout,stderr){
                if(err) {
                        console.log('error:'+stderr);
                }
                else{
                        console.log(stdout);
                }
        });
}
else{
	//display welcome page
	var cmd = `npm run -s index`;
        exec(cmd ,function(err,stdout,stderr){
            if(err) {
                console.log('error:'+stderr);
            }
	    else{
                console.log(stdout);
            }
        });

}
