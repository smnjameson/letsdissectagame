const fs = require('fs');

const filename = process.argv[2];
const carttype = process.argv[3] || "MAGICDESK";

let bytes = new Uint8Array(fs.readFileSync(filename))

let output = []

//Add header
output = [...output, ...getCartHeader(carttype)]

//Add banks
let index = 0;
let bankNum = 0;

while(index < bytes.length) {
	output = [...output, ...getBankHeader(carttype, bankNum)]

	let bCount = 0;
	while(bCount < 0x2000 && index < bytes.length) {
		output.push(bytes[index])
		index++;
		bCount++;
	}

	bankNum++;

	//Fill out bank if needed
	if(bCount < 0x2000) {
		while(bCount<0x2000) {
			bCount++
			output.push(0)
		}
	}
}


fs.writeFileSync(filename, new Uint8Array(output));




function getCartHeader(type) {
	const C64_CARTRIDGE = [0x43,0x36,0x34,0x20,0x43,0x41,0x52,0x54,0x52,0x49,0x44,0x47,0x45,0x20,0x20,0x20];
	const HEADER_LENGTH = [0x00,0x00,0x00,0x40]
	const UNUSED = [0,0,0,0,0,0]


	switch(type) {
		case "GMOD2":
			return [
				...C64_CARTRIDGE,
				...HEADER_LENGTH,
				0x01,0x00,0x00,0x3c,0x00,0x01,
				...UNUSED,
				0x47,0x4d,0x4f,0x44,0x32,
				0,0,0,0,0,0,0,0,0,0,0,
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

			];
			break

		case "MAGICDESK":
			return [
				...C64_CARTRIDGE,
				...HEADER_LENGTH,
				0x01,0x00,0x00,0x13,0x00,0x01,
				...UNUSED,
				0x4D,0x61,0x67,0x69,0x63,0x20,0x44,0x65,0x73,0x6B,
				0,0,0,0,0,0,
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

			];
			break	

		case "EASYFLASH":
			return [
				...C64_CARTRIDGE,
				...HEADER_LENGTH,
				0x01,0x00,0x00,0x20,0x00,0x01,
				...UNUSED,
				0x45,0x4A,0x53,0x59,0x20,0x46,0x4C,0x41,0x4F,0x48,
				0,0,0,0,0,0,
				0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

			];
			break			
	}
}

function getBankHeader(type, bank) {
	const CHIP = [0x43,0x48,0x49,0x50];
	const HEADER_LENGTH = [0x00,0x00,0x00,0x40]
	const UNUSED = [0,0,0,0,0,0]


	switch(type) {
		case "GMOD2":
			return [
				...CHIP,
				0x00,0x00,0x20,0x10,
				0x00,0x00,
				0x00,bank,
				0x80,0x00,
				0x20,0x00
			];
			break
		case "MAGICDESK":
			return [
				...CHIP,
				0x00,0x00,0x20,0x10,
				0x00,0x00,
				0x00,bank,
				0x80,0x00,
				0x20,0x00
			];
			break			
		case "EASYFLASH":
			return [
				...CHIP,
				0x00,0x00,0x20,0x10,
				0x00,0x02,
				0x00,bank,
				0x80,0x00,
				0x20,0x00
			];
			break			
	}
}