if (!global.pause)
	return;

#region Draw background

draw_set_alpha(0.75);
	
draw_set_color(c_black);

draw_rectangle(0, 0, ww, wh, false);

draw_set_alpha(1);

#endregion

#region Draw inventory

draw_sprite_stretched(
	Inventory_background, // Sprite
	0, // frame
	x - 4, // x
	y - 4, // y
	inventory_width, // width
	inventory_height // height
);

var inventoryAux = InventoryGetValids(obj_inventory)

for(var i = 0; i < array_length(inventoryAux); i += 1)
{
	var xx = x + (i mod rowLength) * size + 4;
	var yy = y + (i div rowLength) * size + 2;
	
	var image_reference = index_item_selected == i ? Inventory_select : Inventory_Slot;
	
	draw_sprite_stretched(image_reference, 0, xx, yy, size_slot, size_slot);
	
	var item = inventoryAux[i];
	
	if (item == global.empty_item)
		continue;
		
	if (index_item_selected == i)
	{
		draw_sprite_stretched(
			Inventory_background, // Sprite
			0, // frame
			50, // x
			wh - 180, // y
			ww - 100, // width
			160 // height
		);
		
		draw_set_font(Font1);
		
		draw_set_color(c_white);
		
		draw_set_valign(fa_center);
		
		draw_set_halign(fa_center);
		
		draw_text(ww / 2, wh - 100, item.description);
		
		draw_set_valign(-1);
		
		draw_set_halign(-1);
	}
	
	draw_sprite_stretched(item.image, 0, xx, yy, size_slot, size_slot);
}

#endregion