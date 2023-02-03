#macro INVENTORY_SLOTS 8
rowLength = 4;
inventory = array_create(INVENTORY_SLOTS, global.empty_item);
randomize();

size = 32 * 3;
size_slot = size - 4;

ww = window_get_width();
wh = window_get_height();

inventory_width = 12 + rowLength * size;
inventory_height = 12 + (((INVENTORY_SLOTS - 1) div rowLength) + 1) * size;

index_item_selected = 0;

function SelectUp()
{
	var last_index = index_item_selected;
	
	index_item_selected -= rowLength;
	
	if (index_item_selected < 0)
		index_item_selected = last_index;
}

function SelectLeft()
{
	var last_index = index_item_selected;
	
	index_item_selected--;
	
	if (index_item_selected < 0)
		index_item_selected = last_index;
}

function SelectDown()
{
	var last_index = index_item_selected;
	
	index_item_selected += rowLength;
	
	if (index_item_selected >= INVENTORY_SLOTS)
		index_item_selected = last_index;
}

function SelectRight()
{
	var last_index = index_item_selected;
	
	index_item_selected++;
	
	if (index_item_selected >= INVENTORY_SLOTS)
		index_item_selected = last_index;
}