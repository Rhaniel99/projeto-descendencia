empty_item = -1;

struct_item_1 = { index: 1, used: false, image: item_1, description: "Item 1: Lorem ipsum dolor sit amet, consectetur adipiscing elit." };
struct_item_2 = { index: 2, used: false, image: item_2, description: "Item 2: Ut vulputate nisi nec leo elementum, at finibus quam laoreet." };
struct_item_3 = { index: 3, used: false, image: item_3, description: "Item 3: Suspendisse a orci mi." };
struct_item_4 = { index: 4, used: false, image: item_4, description: "Item 4: Vestibulum in viverra lectus." };
struct_item_5 = { index: 5, used: false, image: item_5, description: "Item 5: Phasellus pharetra mollis neque, in viverra lacus dictum ut." };
struct_item_6 = { index: 6, used: false, image: item_6, description: "Item 6: Etiam nec nulla pretium, placerat risus consectetur, egestas neque." };
struct_item_7 = { index: 7, used: false, image: item_7, description: "Item 7: Mauris augue mi, ultrices nec cursus eget, mattis nec ligula." };
struct_item_8 = { index: 8, used: false, image: item_8, description: "Item 8: Pellentesque consectetur, mauris quis egestas tincidunt, arcu mi lacinia turpis, ut tincidunt nisi ex a quam." };
struct_item_9 = { index: 9, used: false, image: item_9, description: "Item 9: Phasellus interdum sem at dolor tempus, at accumsan urna ullamcorper." };
struct_item_10 = { index: 10, used: false, image: item_10, description: "Item 10: Nam rhoncus purus turpis, vel posuere ipsum vulputate eget." };
struct_item_11 = { index: 11, used: false, image: item_11, description: "Item 11: Cras a venenatis mi." };
struct_item_12 = { index: 12, used: false, image: item_12, description: "Item 12: Phasellus in turpis justo." };
struct_item_13 = { index: 13, used: false, image: item_13, description: "Item 13: Quisque molestie feugiat massa, ac vulputate massa hendrerit a." };
struct_item_14 = { index: 14, used: false, image: item_14, description: "Item 14: Etiam ultricies nunc id nisl pharetra vehicula." };
struct_item_15 = { index: 15, used: false, image: item_15, description: "Description of Item 15" };
struct_item_16 = { index: 16, used: false, image: item_16, description: "Description of Item 16" };
struct_item_17 = { index: 17, used: false, image: item_17, description: "Description of Item 17" };

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
		with (obj) inventory[_slot].used = true;
		
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

function InventorySearchByIndex(obj, index)
{
	return obj.inventory[index];
}

function InventoryGetValids(obj)
{
	var inventoryAux = array_create(INVENTORY_SLOTS, global.empty_item);
	
	var index = 0;
	
	for(var i = 0; i < INVENTORY_SLOTS; i += 1)
	{
		var item = obj.inventory[i];
		
		if (item && !item.used)
		{
			inventoryAux[index] = item;
			
			index++;
		}
	}
	
	return inventoryAux;
}