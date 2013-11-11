var express = require('express');
var app     = express();
var fs      = require('fs');
var _	 	= require('underscore');
 
var resTemplate = JSON.parse(fs.readFileSync('weather_res_helsinki.json', 'utf8'));

function naiveClone(obj) {
	return JSON.parse(JSON.stringify(obj));
}

function randomFromInterval(from, to) {
    return Math.floor(Math.random()*(to-from+1)+from);
}

app.get('/weather', function(req, res) {
	var resObj = naiveClone(resTemplate);
	var params = req.query;
	var query  = params.q; // The location query param

	console.log(params);

	resObj.main.temp = randomFromInterval(253.15, 293.15);
	// resObj.main.temp = 253.15;
	resObj.name = query;

	res.json(resObj);
});

app.listen(3000);
