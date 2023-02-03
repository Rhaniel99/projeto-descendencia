if (item != global.empty_item)
{
	function GetObject()
	{
		InventoryAdd(obj_inventory, item);
	
		instance_destroy(id);
	}
	
	return;
}

instance_destroy(id);