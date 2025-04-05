/// @description Create items and manage them

// Item constructor
function create_item(i_name, i_desc) constructor {
	name = i_name;
	description = i_desc;
}

// Create items here
// Sprites may be implemented later, but for now,
// Name and desc is the minimum
global.item_list = {
	potion1 : new create_item(
		"Potion",
		"A basic healing potion that restores X HP."
	),

	elixir1 : new create_item(
		"Elixir",
		"A basic elixir that resotres X MP."
	),

	key1 : new create_item(
		"Key",
		"A key that will open a lock."
	)
}

// Create the inventory
inventory = array_create(0)
// Add some stuff as a test
// You can see the items in the inventory screen
array_push(inventory, global.item_list.potion1)
array_push(inventory, global.item_list.elixir1)


