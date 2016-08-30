#!/usr/local/bin/node

Array.prototype.first = function(n){
    n = (typeof n != 'undefined') ? n : 1;
    var x = this.slice(0, n);
    return (x.length == 1) ? x[0] : x;
}

var fs = require('fs')

var fileName = process.argv[2]

var contents = fs.readFileSync(fileName)
    .toString()
    .toLowerCase()
    .split(/\s+|[^a-zA-z]{2,}/)
    .reduce((acc, word) => {
        var index = acc.indexOf(acc.filter(w => w.word == word).first());
        if (index == -1) {
           acc.push({word: word, count: 1}); 
        } else {
            acc[index].count++;
        }
        return acc;
    }, [])
    .sort((obj1, obj2) => obj2.count - obj1.count);
    

console.log(contents);

