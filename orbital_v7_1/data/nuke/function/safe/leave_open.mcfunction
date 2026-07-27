# Context: the setup interaction at the Safe.
# Keep safe_box permanently active so neighbour protection never stops.
tag @e[type=minecraft:marker,tag=safe_box,distance=..0.9,limit=1,sort=nearest] add safe_unlocked
tag @e[type=minecraft:marker,tag=safe_box,distance=..0.9,limit=1,sort=nearest] remove safe_unconfigured

# Never remove the lock component in this branch. Generic active keys remain valid.
execute unless data block ~ ~ ~ components."minecraft:lock" run data modify block ~ ~ ~ components."minecraft:lock" set value {items:"minecraft:tripwire_hook",predicates:{"minecraft:custom_data":{nuke_key_active:1b}}}
kill @s
