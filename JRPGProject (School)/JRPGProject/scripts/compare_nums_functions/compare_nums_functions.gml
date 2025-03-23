// Helper functions for comparing two numbers,
// and returns true if statement is true, else return false

///@description Compares two values and checks if they're equal to each other.
///@param {*} valx
///@param {*} valy
function isEqualsNum(valx, valy) {
	if (valx == valy) return true;
	return false;
}

///@description Checks if valx is greater than or equal to valy.
///@param {*} valx
///@param {*} valy
function isGTorEqualsNum(valx, valy) {
	if (valx >= valy) return true;
	return false;
}

///@description Checks if valx is less than or equal to valy.
///@param {*} valx
///@param {*} valy
function isLTorEqualsNum(valx, valy) {
	if (valx <= valy) return true;
	return false;
}