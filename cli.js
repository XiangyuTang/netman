#!/usr/bin/env node

var program = require('commander');
var exec = require('child_process').exec; 

program
  .version('0.1.0')
  .option('-s, --NI_stat [NI_name]', 'Log network traffic for the specified interface')
  .option('-m, --monitor [NI_name]', 'Real-time Monitoring of network interface(NI) bandwidth.')
  .option('-nm, --management', 'manage your network in GUI')
  .parse(process.argv);

const options = program.opts();

if (options.monitor){
	console.log("Launching Bmon terminal...");
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
	console.log("here");
	var cmd = `gnome-terminal -t "Network_Management_Terminal" -e 'bash -c "npm run -s management ${options.cost};exec bash"'`;//打开另一个终端执行脚本
	//var cmd1 = `bash manage_cost.sh ${options.cost}`;
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

