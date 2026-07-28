# Контекст: as <configured marker>, at <его блок>.
data modify storage mosseater:safe key.password set from entity @s data.safe.password
execute unless data storage mosseater:safe key.password run return 0
function mosseater:safe/apply_lock
data remove storage mosseater:safe key
