#!/usr/bin/env node

var program = require('commander');
var exec = require('child_process').exec; 
/*
	var cmdStr ='ifconfig';
	exec(cmdStr ,function(err,stdout,stderr){
	if(err) {
   		console.log('error:'+stderr);
	} 
	else{
		console.log(stdout);
	}
	});
*/

program
  .version('0.1.0')
  .option('-s, --NI_stat [NI_name]', 'Log network traffic for the specified interface')
  .option('-m, --monitor [NI_name]', 'Real-time Monitoring of network interface(NI) bandwidth.')
  .option('-fw, --firewall [action,paremeter...]', 'open: Open firewall\n\t\t\t\t\t close: Close firewall\n\t\t\t\t\t status: Show current firewall status\n\t\t\t\t\t allow: Allow specific ports or services (e.g., allow 72/tcp 73/udp 90 http)\n\t\t\t\t\t deny: Deny specific ports or services (e.g., deny 72 73 90 http)\n\t\t\t\t\t reset: Clear all fire settings')
  .option('-check, --security_check', 'Check whether there are open dangerous ports')
  .option('-mtr, --mytraceroute [action,parameter...]', 'Network diagnostic by probing routers on the route path')
  .option('-afd, --auto_fault_diagnostic', 'Automatic network fault diagnostic for you reference')
  .parse(process.argv);

const options = program.opts();

if (options.monitor){
	var cmd = `gnome-terminal -t "Bmon_Terminal" -e 'bash -c "npm run monitor ${options.monitor};exec bash"'`;
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
        var cmd = `npm run stat ${options.NI_stat}`;
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
	var cmd=`npm run firewall`;
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
	var cmd=`npm run security_check`;
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
    var cmd = `npm run mytraceroute`;
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
	var cmd=`npm run auto_fault_diagnostic`;
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
	var cmd = `npm run index`;
        exec(cmd ,function(err,stdout,stderr){
            if(err) {
                console.log('error:'+stderr);
            }
	    else{
                console.log(stdout);
            }
        });

}
