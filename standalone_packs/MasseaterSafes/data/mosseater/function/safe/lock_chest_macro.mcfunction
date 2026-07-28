# УСТАРЕЛО: заменено на apply_lock + bind_marker (строгое совпадение ключа и замка).
function mosseater:safe/apply_lock
function mosseater:safe/bind_marker
function mosseater:safe/ensure_interaction
playsound minecraft:block.chest.locked block @a[distance=..16] ~ ~ ~ 1 1
