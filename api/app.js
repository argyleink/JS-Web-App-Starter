var http      = require('http');
var path      = require('path');
var async     = require('async');
var express   = require('express');

var router = express();
var server = http.createServer(router);

router.use(express.static(path.resolve(__dirname, 'client')));

server.listen(3000, "127.0.0.1", function(){
  var addr = server.address();
  console.log("Server listening at", addr.address + ":" + addr.port);
});

// test REST endpoint
router.get('/api/user/:id', function(req, res) {
  console.log(req.params);
  res.send('User ' + req.params.id);
});