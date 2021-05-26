#!/usr/bin/env node

console.log('Welcome to the NetworkManager demo!');
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
  .option('-n, --yourname [yourname]', 'Your name')
  .option('-g, --glad', 'Tell us you are happy')
  .option('-c, --cost [eth_name]', 'Monitor the network card [eth_name] traffic consumption')
  .parse(process.argv);

const options = program.opts();

if (options.yourname) {
	console.log(`Hello, ${options.yourname}! ${options.glad ? 'I am very happy to see you!' : ''}`);
}
//console.log(options.yourname);
//console.log(options.cost);
if (options.cost){
	var path = `find . -name manage_cost.sh`;
	console.log(path);
	//var cmd = `gnome-terminal -t "Manage_Cost_Terminal" -e 'bash -c "bash manage_cost.sh ${options.cost};exec bash"'`;//打开另一个终端执行脚本
	//var cmd1 = `bash manage_cost.sh ${options.cost}`;
	var cmd = `gnome-terminal -t "Manage_Cost_Terminal" -e 'bash -c "npm run manage_cost ${options.cost};exec bash"'`;
	exec(cmd ,function(err,stdout,stderr){
	    if(err) {
    		console.log('error:'+stderr);
	    }
	    else{
        	console.log(stdout);
	    }
	});
}
