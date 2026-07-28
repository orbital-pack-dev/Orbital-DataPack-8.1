# После разрушения половины Minecraft сам переводит оставшийся блок в type=single.
# NBT маркера не меняется; tick нормализует interaction до 1.1 x 1.4.
function mosseater:safe/ensure_interaction
