var http      = require('http');
var path      = require('path');
var async     = require('async');
var express   = require('express');     // http://expressjs.com/
var mysql     = require('mysql');       // https://github.com/felixge/node-mysql

var router = express().use(express.static(path.resolve(__dirname, 'client')));
var server = http.createServer(router);

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'password',
  database : 'app'
});

// Example MySQL connection & query
connection.connect(function(err) {
  if (err) throw err;
  console.log('Node has connected to MySQL');
});

connection.query('select * from users', function(err, rows, fields) {
  if (err) throw err;
  console.log('Data row: ', rows[0]);
});

connection.end();

server.listen(3000, "127.0.0.1", function(){
  var addr = server.address();
  console.log("Server listening at", addr.address + ":" + addr.port);
});

// Example REST endpoint
router.get('/api/user/:id', function(req, res) {
  console.log(req.params);
  res.send('Sup ' + req.params.id);
});