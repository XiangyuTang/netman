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

