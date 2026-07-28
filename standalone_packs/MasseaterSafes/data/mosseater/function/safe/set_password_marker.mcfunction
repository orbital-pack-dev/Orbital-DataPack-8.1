# Контекст: as <маркер половины>, at <его блок>.
data modify entity @s data.safe.password set from storage mosseater:safe key.password
data modify entity @s data.safe.keep_open set value 0b
tag @s remove ms_safe_unconfigured
tag @s remove ms_safe_keep_open
tag @s add ms_safe_configured
function mosseater:safe/apply_lock
scoreboard players set @s mosseater.safe_data 0
