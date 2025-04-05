// Script with functions which handle date stuff
function advance_date(oldDay, oldMonth, oldYear) {
	oldDay += 1; // Add one to the oldDay
	
	var febLength = 0;
	if ((oldYear % 4) == 0)			{ febLength = 29; 
	} else if ((oldYear % 100) == 0)	{ febLength = 28; 
	} else if ((oldYear % 4) == 0)		{ febLength = 29;
	} // Set length of february based on if a leap oldYear or not
	
	var newMonth = false;
	switch (oldMonth) {
		case 1: // January
		case 3: // March
		case 5: // May
		case 7: // July
		case 8: // August
		case 10:// October
		case 12:// December
			// Months with 31 days advanced on oldDay 32
			if (oldDay == 32) { newMonth = true; }
			break;
		
		case 4: // April
		case 6: // June
		case 9: // September
		case 11:// November
			// Months with 30 days
			if (oldDay == 31) { newMonth = true; }
			break;
		
		case 2: // just February lol
			if (oldDay == (febLength+1)) { newMonth = true; }
			break;
	}
	
	if (newMonth == true) { // Update oldMonth on oldMonth tick over
		
		oldDay = 1; // First oldDay of oldMonth
		if (oldMonth == 12) { // If december, go to next oldYear
			oldYear++;
			oldMonth = 1;
			for (var i = array_length(global.holidays)-1; i>=0; --i) {
				global.holidays[i] = 0;
			}

		} else { // If not december, advance to next oldMonth as normal
			oldMonth += 1;
		}
	}
	
	var offset = -1;
	switch (oldMonth) { // Determine oldMonth offset for weekday calculation
		case 1:
			offset = 0;
			break;
		case 2:
			offset = 3;
			break;
		case 3:
			if (febLength == 28) { offset = 3; } else { offset = 4; }
			break;
		case 4:
			if (febLength == 28) { offset = 6; } else { offset = 0; }
			break;
		case 5:
			if (febLength == 28) { offset = 1; } else { offset = 2; }
			break;
		case 6:
			if (febLength == 28) { offset = 4; } else { offset = 5; }
			break;
		case 7:
			if (febLength == 28) { offset = 6; } else { offset = 0; }
			break;
		case 8:
			if (febLength == 28) { offset = 2; } else { offset = 3; }
			break;
		case 9:
			if (febLength == 28) { offset = 5; } else { offset = 6; }
			break;
		case 10:
			if (febLength == 28) { offset = 0; } else { offset = 1; }
			break;
		case 11:
			if (febLength == 28) { offset = 3; } else { offset = 4; }
			break;
		case 12:
			if (febLength == 28) { offset = 5; } else { offset = 6; }
			break;
			
	}
	
	var newWeekday = (oldDay + offset + 5*((oldYear-1) % 4) + 4*((oldYear-1) % 100) + 6*((oldYear-1) % 400)) % 7;
	
	var newDate = {
		day		: oldDay,
		month	: oldMonth,
		year	: oldYear,
		weekday : newWeekday
	};

	return newDate;
};



// Get name of month
function month_name(num) {
	var name = "";
	
	switch (num) {
		case 1:
			name = "January";
			break;
		case 2:
			name = "February";
			break;
		case 3:
			name = "March";
			break;
		case 4:
			name = "April";
			break;
		case 5:
			name = "May";
			break;
		case 6:
			name = "June";
			break;
		case 7:
			name = "July";
			break;
		case 8:
			name = "August";
			break;
		case 9:
			name = "September";
			break;
		case 10:
			name = "October";
			break;
		case 11:
			name = "November";
			break;
		case 12:
			name = "December";
			break;
	}
	
	return name;
};

// Get name of weekday
function weekday_name(num) {
	var name = "";
	
	switch (num) {
		case 1:
			name = "Sunday";
			break;
		case 2:
			name = "Monday";
			break;
		case 3:
			name = "Tuesday";
			break;
		case 4:
			name = "Wednesday";
			break;
		case 5:
			name = "Thursday";
			break;
		case 6:
			name = "Friday";
			break;
		case 0:
			name = "Saturday";
			break;
	}
	
	return name;
};

// Get ordinal number suffix
function ordinal_suffix(num) {
	var ordinal = "";
	
	switch (num % 10) {
		case 1:
			ordinal = string(num) + "st";
			break;
		case 2:
			ordinal = string(num) + "nd";
			break;
		case 3:
			ordinal = string(num) + "rd";
			break;
		default:
			ordinal = string(num) + "th";
			break;
	}

	switch (num % 100) {
		case 11:
		case 12:
		case 13:
			ordinal = string(num) + "th";
			break;
	}

	return ordinal;
};

function get_weekday_of_date(day, month, year) {
	var febLength = 0;
	
	if ((year % 4) == 0)			{ febLength = 29; 
	} else if ((year % 100) == 0)	{ febLength = 28; 
	} else if ((year % 4) == 0)		{ febLength = 29;
	} // Set length of february based on if a leap year or not
	
	var offset = -1;
	switch (month) { // Determine oldMonth offset for weekday calculation
		case 1:
			offset = 0;
			break;
		case 2:
			offset = 3;
			break;
		case 3:
			if (febLength == 28) { offset = 3; } else { offset = 4; }
			break;
		case 4:
			if (febLength == 28) { offset = 6; } else { offset = 0; }
			break;
		case 5:
			if (febLength == 28) { offset = 1; } else { offset = 2; }
			break;
		case 6:
			if (febLength == 28) { offset = 4; } else { offset = 5; }
			break;
		case 7:
			if (febLength == 28) { offset = 6; } else { offset = 0; }
			break;
		case 8:
			if (febLength == 28) { offset = 2; } else { offset = 3; }
			break;
		case 9:
			if (febLength == 28) { offset = 5; } else { offset = 6; }
			break;
		case 10:
			if (febLength == 28) { offset = 0; } else { offset = 1; }
			break;
		case 11:
			if (febLength == 28) { offset = 3; } else { offset = 4; }
			break;
		case 12:
			if (febLength == 28) { offset = 5; } else { offset = 6; }
			break;
			
	}
	
	var weekday = (day + offset + 5*((year-1) % 4) + 4*((year-1) % 100) + 6*((year-1) % 400)) % 7;
	return weekday;
};

function get_month_length(month, year) {
	var febLength = 0;
	if ((year % 4) == 0)			{ febLength = 29; 
	} else if ((year % 100) == 0)	{ febLength = 28; 
	} else if ((year % 4) == 0)		{ febLength = 29;
	} // Set length of february based on if a leap year or not
	
	var length = 0;
	switch (month) {
		case 1: // January
		case 3: // March
		case 5: // May
		case 7: // July
		case 8: // August
		case 10:// October
		case 12:// December
			// Months with 31 days 
			length = 31;
			break;
		
		case 4: // April
		case 6: // June
		case 9: // September
		case 11:// November
			// Months with 30 days
			length = 30;
			break;
		
		case 2: // just February lol
			length = febLength;
			break;
	}
	
	return length;
};