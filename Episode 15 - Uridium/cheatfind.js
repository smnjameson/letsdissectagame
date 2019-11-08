var fs = require('fs');

const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
})

readline.question(`First filename : `, (fileOne) => {
    readline.question(`Second filename : `, (fileTwo) => {
        readline.question(`Initial value(s) in HEX: `, (valOne) => {
            readline.question(`Changed value(s) in HEX: `, (valTwo) => {
                if(valOne.length !== valTwo.length) {
                    console.log("ERROR : compared data must be of same byte length...")
                    process.exit();
                } else {
                    compareData(fileOne,fileTwo,valOne,valTwo);
                    process.exit();
                }
                readline.close();
            })
        })
    })
})


function compareData(fileOne,fileTwo,valOne,valTwo) {
    let f1,f2 = null;
    try {
        f1 = new Uint8Array(fs.readFileSync(fileOne).buffer);
        f2 = new Uint8Array(fs.readFileSync(fileTwo).buffer);
    } catch (e) {
        console.log("ERROR : could not read files...");
        process.exit();
    }

    let v1,v2 = [];
    try {
        v1 = valOne.replace(/\s/g, "").match(/.{2}/g).map(a => parseInt(a,16));   
        v2 = valTwo.replace(/\s/g, "").match(/.{2}/g).map(a => parseInt(a,16));  
    } catch(e) {
        console.log("ERROR : could not parse hex values...");
        process.exit();        
    }

    console.log("\n");
    
    let checkIndex = 0;
    for(let i=0; i<f1.length - v1.length; i++) {
        if(f1[i] === v1[checkIndex] && f2[i] ===v2[checkIndex]) {
            checkIndex++;
            if(checkIndex === v1.length) {
                console.log(`MATCH FOUND @ ${i.toString(16)}`);
                checkIndex = 0;
            }
        } else {
            checkIndex = 0;
        }
    }
}