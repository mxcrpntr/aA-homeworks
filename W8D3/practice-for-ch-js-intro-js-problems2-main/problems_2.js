function titleize(names, printCallback) {
    let newNames = names.map(name => ["Mx.", name, "Jingleheimer", "Schmidt"]);
    return printCallback(newNames);
}
function printCallback(names) {
    names.forEach(name => console.log(name.join(' ')) );
}


function Elephant(name,height,tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
    console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
}
Elephant.prototype.grow = function() {
    this.height += 12;
}
Elephant.prototype.addTrick = function(trick) {
    newArray = this.tricks;
    newArray.push(trick);
    this.tricks = newArray;
}
Elephant.prototype.play = function() {
    let i = getRandomIntInclusive(0,(this.tricks.length - 1));
    console.log(`${this.name} is ${this.tricks[i]}!`);
}
function getRandomIntInclusive(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1) + min); // The maximum is inclusive and the minimum is inclusive
}
