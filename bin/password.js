#!/usr/local/bin/node

Array.prototype.sample = function(){
    return this[Math.floor(Math.random() * this.length)];
}

String.prototype.has = function(substr){
    return this.indexOf(substr) !== -1;
}

function shuffle(o){
    for(var j, x, i = o.length; i; j = Math.floor(Math.random() * i), x = o[--i], o[i] = o[j], o[j] = x);
    return o;
}


var args = process.argv.slice(2);
var fs = require('fs');
var words = shuffle(fs.readFileSync('/Users/zach/words').toString().split('\n').filter(word => word.length > 3));
var password = [];
var numWords = 4;

args.forEach(function(arg){
    if (arg.has('-h')) {
        console.log(
`
description
    will generate a random password using 4 unique words from 
    '~/words'
    
    see https://xkcd.com/936/

    word list pulled from https://github.com/first20hours/google-10000-english

usage
    $ password.js [numwords]

numwords defaults to 4
`);

        process.exit(0);
    } else {
        numWords = parseInt(arg);
    }
});


for (var i = 0; i < numWords; i++){
    password.push(words.pop())
}

console.log(`"${password.join(' ')}"`);
