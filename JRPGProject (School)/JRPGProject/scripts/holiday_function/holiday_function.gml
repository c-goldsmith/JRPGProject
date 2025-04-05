// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function holiday_check(day, month, request){
	
	switch (month) {
		case 8:
			switch (day) {
				case 20:	// August 20th
					switch (request) {
						case "Exists":
						return true;
						
						case "Contents":
							return [
								"Attention!",
								"Today is Veegeria the Second's Day!",
								"A renowned warrior, fighter of evil in the dark, and explorer of worlds, may Veegeria the Second's legacy last for all time.",
								"Huh... I always loved Veegeria the Second's day! ...Wonder why nobody ever talks about Veegeria the first, though."
								];
						
						case "Speakers":
							return [ "Holiday Notif.", "Holiday Notif.", "Holiday Notif.", "Rosette" ];
						
						case "Emotes":
							return [ undefined, undefined, undefined, tspr_Rosette_Happy_2 ];
							
						
						case "Index":
							return 0;
					}
				break;
			}
		break;
	}
	
	
	switch (request) {
		case "Exists":
			return false;
	}
}