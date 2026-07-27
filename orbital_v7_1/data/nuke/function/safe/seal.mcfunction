# Context: Safe marker; called only when no player is within six blocks.
tag @a remove safe_user
tag @a remove safe_awaiting_key

# Configured marker has password data; restore the exact password lock.
execute if data entity @s data.pw unless data block ~ ~ ~ components."minecraft:lock" run function nuke:safe/restore_lock_read

# Unconfigured Safe keeps a generic active-key lock.
execute unless data entity @s data.pw unless data block ~ ~ ~ components."minecraft:lock" run data modify block ~ ~ ~ components."minecraft:lock" set value {items:"minecraft:tripwire_hook",predicates:{"minecraft:custom_data":{nuke_key_active:1b}}}
