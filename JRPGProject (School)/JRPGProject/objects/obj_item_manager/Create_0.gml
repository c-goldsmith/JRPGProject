/// @description Create items and manage them

// Item constructor
function create_item(i_name, i_desc, i_sellable, i_price, i_sell_price) constructor {
	name = i_name;
	description = i_desc;
	sellable = i_sellable; // Flag for sellable or not sellable items*
	price = i_price; // Price to buy item from shops
	sell_price = i_sell_price; // Price to sell the item yourself
}
// * If item is not sellable, the vendor would refuse to buy the
// item from you; relevant for key items
// May implement sprites and the number of HP/MP that each healable item heals later


// Create items here
// Currency for money may be something like gold (G), idk
global.item_list = {
	potion1 : new create_item(
		"Potion",
		"A basic healing potion with a mild flavor.\nRestores X HP.",
		true,
		15,
		7
	),

	elixir1 : new create_item(
		"Elixir",
		"A basic elixir with a mild flavor.\nRestores X MP.",
		true,
		10,
		5
	),

	key1 : new create_item(
		"Key",
		"A key that will open a lock.",
		false,
		20,
		0
	)
}

// Create the inventory with nothing in it
inventory = array_create(0)

// Add some stuff as a test by appending them to the inventory array
// You can see the items in the inventory screen
array_push(inventory, global.item_list.potion1)
array_push(inventory, global.item_list.elixir1)
array_push(inventory, global.item_list.key1)


