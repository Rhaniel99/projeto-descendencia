empty_item = -1;

struct_item_1 = { index: 1, image: item_1, description: "Item 1: Lorem ipsum dolor sit amet, consectetur adipiscing elit." };
struct_item_2 = { index: 2, image: item_2, description: "Item 2: Ut vulputate nisi nec leo elementum, at finibus quam laoreet." };
struct_item_3 = { index: 3, image: item_3, description: "Item 3: Suspendisse a orci mi." };
struct_item_4 = { index: 4, image: item_4, description: "Item 4: Vestibulum in viverra lectus." };
struct_item_5 = { index: 5, image: item_5, description: "Item 5: Phasellus pharetra mollis neque, in viverra lacus dictum ut." };
struct_item_6 = { index: 6, image: item_6, description: "Item 6: Etiam nec nulla pretium, placerat risus consectetur, egestas neque." };
struct_item_7 = { index: 7, image: item_7, description: "Item 7: Mauris augue mi, ultrices nec cursus eget, mattis nec ligula." };
struct_item_8 = { index: 8, image: item_8, description: "Item 8: Pellentesque consectetur, mauris quis egestas tincidunt, arcu mi lacinia turpis, ut tincidunt nisi ex a quam." };
struct_item_9 = { index: 9, image: item_9, description: "Item 9: Phasellus interdum sem at dolor tempus, at accumsan urna ullamcorper." };
struct_item_10 = { index: 10, image: item_10, description: "Item 10: Nam rhoncus purus turpis, vel posuere ipsum vulputate eget." };
struct_item_11 = { index: 11, image: item_11, description: "Item 11: Cras a venenatis mi." };
struct_item_12 = { index: 12, image: item_12, description: "Item 12: Phasellus in turpis justo." };
struct_item_13 = { index: 13, image: item_13, description: "Item 13: Quisque molestie feugiat massa, ac vulputate massa hendrerit a." };
struct_item_14 = { index: 14, image: item_14, description: "Item 14: Etiam ultricies nunc id nisl pharetra vehicula." };
struct_item_15 = { index: 15, image: item_15, description: "Description of Item 15" };
struct_item_16 = { index: 16, image: item_16, description: "Description of Item 16" };

function InventorySearch(obj, item)
{
	for(var i = 0; i < INVENTORY_SLOTS; i += 1)
		if (obj.inventory[i] == item)
			return(i);
			
	return(global.empty_item);
}

function InventoryReorder(obj, item)
{
	for(var i = 0; i < INVENTORY_SLOTS - 1; i += 1)
		if (obj.inventory[i] == global.empty_item)
			obj.inventory[i] = obj.inventory[i + 1];
}

function InventoryRemove(obj, item)
{
	var _slot = InventorySearch(obj, item)
	if (_slot != -1)
	{
		with (obj) inventory[_slot] = global.empty_item;
		
		InventoryReorder(obj, item);
		
		return true;
	}
	
	return false;
}

function InventoryAdd(obj, item)
{
	var _slot = InventorySearch(obj, global.empty_item)
	if (_slot != -1)
	{
		with (obj) inventory[_slot] = item;
		return true;
	}
	
	return false;
}

