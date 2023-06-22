function madlib(verb,adj,noun) {
    newString = `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`
    return newString
}

function isSubstring(searchString,subString) {
    let i_2 = 0
    for (let i_1 = 0; i_1 < searchString.length; i_1++) {
        if (searchString[i_1] === subString[i_2]) {
            i_2++;
        } else {
            i_2 = 0;
        }
        if (i_2 === subString.length) {
            return true;
        }
    }
    return false;
}

function fizzBuzz(array) {
    let newArray = [];
    array.forEach(el => {
        if (el % 3 === 0 && el % 5 != 0) {
            newArray.push(el);
        } else if (el % 3 != 0 && el % 5 === 0) {
            newArray.push(el);
        }
    })
    return newArray;
}

function isPrime(number) {
    if (number < 2) {
        return false;
    }
    for (let i = 2; i < number; i++) {
        if (number % i === 0) {
            return false;
        }
    }
    return true;
}


function firstNPrimes(n) {
    newArray = [];
    counter = 0;
    let i = 2;
    while (counter < n) {
        if (isPrime(i)) {
            newArray.push(i);
            counter++;
        }
        i++;
    }
    return newArray;
}

function sumOfNPrimes(n) {
    primes = firstNPrimes(n);
    return primes.reduce((a,b) => a+b,0);
}