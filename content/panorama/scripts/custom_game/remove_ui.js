let root = $.GetContextPanel();

while (root.id !== "DotaHud") {
  root = root.GetParent();
}

root.FindChildTraverse("GlyphScanContainer").visible = false;
root.FindChildTraverse("inventory_neutral_slot_container").visible = false;
root.FindChildrenWithClassTraverse("GridNeutralsTabContainer")[0].visible = false;