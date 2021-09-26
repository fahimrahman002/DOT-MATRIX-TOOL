var checkBoxes = document.querySelectorAll(".checkbox-input");
var clearBtn = document.getElementById("clearBtn");
var generateBtn = document.getElementById("generateBtn");
var output = document.getElementById("output");
var startingAddress = document.getElementById("startingAddress");
var copyBtn = document.getElementById("copyBtn");
var trackSequence = document.getElementById("sequenceWithCheckbox");

var extra = "000000000";
var sequenceList = [];

window.onload = () => {
	init();
};

function init() {
	for (var i = 0; i < checkBoxes.length; i++) {
		checkBoxes[i].value = i;
	}
	checkBoxes.forEach((item) => {
		item.addEventListener("click", (event) => {
			generateSequence(item.value);
		});
	});
}
function generateSequence(value) {
	var address = "2000";
	var addressInput = startingAddress.value;
	if (addressInput != "") {
		address = addressInput;
	}
	var position = parseInt(value);
	var row = position / 5;
	var col = position % 5;
	var reversedStr = getCheckBoxColumValues(col);
	reversedStr = extra + reversedStr;
	var hexValue = bin2hex(reversedStr) + "H";

	var addressInt = parseInt(address, 16);
	var currentAddressHex = int2hex(addressInt + col);

	var code =
		"MOV DX, " +
		currentAddressHex +
		"H\nMOV AL, 0" +
		hexValue +
		"\nOUT DX, AL\n";

	sequenceList.push(code);
}

function outputWithSequence() {
	output.value = "";
	for (var i = 0; i < sequenceList.length; i++) {
		output.value = output.value + sequenceList[i] + "\n";
	}
}

function getCheckBoxColumValues(i) {
	var str = "";
	for (var j = i; j < checkBoxes.length; j += 5) {
		if (checkBoxes[j].checked == true) {
			str = str + "1";
		} else {
			str = str + "0";
		}
	}
	return str.split("").reverse().join("");
}

function outputWithoutSequence() {
	var address = "2000";
	var addressInput = startingAddress.value;
	if (addressInput != "") {
		address = addressInput;
	}
	output.value = "";
	for (var i = 0; i < 5; i++) {
		var reversedStr = getCheckBoxColumValues(i);
		reversedStr = extra + reversedStr;
		var hexValue = bin2hex(reversedStr) + "H";

		var addressInt = parseInt(address, 16);
		var currentAddressHex = int2hex(addressInt + i);

		var code =
			"MOV DX, " +
			currentAddressHex +
			"H\nMOV AL, 0" +
			hexValue +
			"\nOUT DX, AL\n";

		output.value = output.value + code + "\n";
	}
}
clearBtn.addEventListener("click", (event) => {
	sequenceList = [];
	for (var i = 0; i < checkBoxes.length; i++) {
		checkBoxes[i].checked = false;
	}
});
generateBtn.addEventListener("click", (event) => {
	if (sequenceWithCheckbox.checked == true) {
		outputWithSequence();
	} else {
		outputWithoutSequence();
	}
});

copyBtn.addEventListener("click", (event) => {
	navigator.clipboard.writeText(output.value);
	toastr.options.timeOut = 1000;
	toastr.info("Code copied.");
});

function bin2hex(binary) {
	var digit = parseInt(binary, 2);
	hexString = digit.toString(16);
	return hexString.toUpperCase();
}
function int2hex(digit) {
	hexString = digit.toString(16);
	return hexString.toUpperCase();
}
