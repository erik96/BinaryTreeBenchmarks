const electron = require('electron');
const url = require('url');
const path = require('path');
const fs = require('fs');

const {app, BrowserWindow} = electron;

let mainWindow;
let rez = [];

app.on('ready', () => {
mainWindow = new BrowserWindow({});
mainWindow.loadURL(url.format({
pathname: path.join(__dirname, 'index.html'),
protocol: 'file:',
slashes: true
}));

createTree();
});


async function readFile() {
return new Promise((res, rej) => {
fs.readFile(__dirname + '\\test.txt', 'utf8', (err, data) => {
if (err) {
rej(err);
}
res(data);
});
});
};

async function createTree() {
let data = await readFile();
let aux = data.split(' ');

let tree = new Tree();
let cap = null;

cap = tree.insert(cap, aux[0]);

for (let i = 1; i < aux.length; i++) {
tree.insert(cap, parseInt(aux[i]));
}


tree.traverse(cap);
await writeFile();
app.quit();

}

async function writeFile() {
return new Promise((res, rej) => {
var stream = fs.createWriteStream(__dirname + "\\append.txt", {flags:'a'});
stream.write("" + rez);
res();
});
}

function Nod() {
this.val = null;
this.left = null;
this.right = null;
}

function Tree() {
this.insert = function(root, v) {
if (root === null || root === undefined) {
root = new Nod();
root.val = v;
} else if (v < root.val) {
root.left = this.insert(root.left, v);
} else {
root.right = this.insert(root.right, v);
}

return root;
}

this.traverse = function(root) {
 	if (root === null || root === undefined) {
   	return;
   	}
   
   	this.traverse(root.left);
   	rez.push(root.val);
   	this.traverse(root.right);
 	}
}