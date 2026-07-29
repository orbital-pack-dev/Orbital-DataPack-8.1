# TNT в любой половине делает всю конструкцию миной.
tag @s remove ms_safe_mine
tag @s remove ms_safe_partner_x_pos
tag @s remove ms_safe_partner_x_neg
tag @s remove ms_safe_partner_z_pos
tag @s remove ms_safe_partner_z_neg

execute if data block ~ ~ ~ Items[{id:"minecraft:tnt"}] run tag @s add ms_safe_mine

execute if block ~ ~ ~ minecraft:chest[facing=north,type=left] run tag @s add ms_safe_partner_x_pos
execute if block ~ ~ ~ minecraft:chest[facing=north,type=right] run tag @s add ms_safe_partner_x_neg
execute if block ~ ~ ~ minecraft:chest[facing=south,type=left] run tag @s add ms_safe_partner_x_neg
execute if block ~ ~ ~ minecraft:chest[facing=south,type=right] run tag @s add ms_safe_partner_x_pos
execute if block ~ ~ ~ minecraft:chest[facing=east,type=left] run tag @s add ms_safe_partner_z_pos
execute if block ~ ~ ~ minecraft:chest[facing=east,type=right] run tag @s add ms_safe_partner_z_neg
execute if block ~ ~ ~ minecraft:chest[facing=west,type=left] run tag @s add ms_safe_partner_z_neg
execute if block ~ ~ ~ minecraft:chest[facing=west,type=right] run tag @s add ms_safe_partner_z_pos

execute if entity @s[tag=ms_safe_partner_x_pos] positioned ~1 ~ ~ if data block ~ ~ ~ Items[{id:"minecraft:tnt"}] run tag @s add ms_safe_mine
execute if entity @s[tag=ms_safe_partner_x_neg] positioned ~-1 ~ ~ if data block ~ ~ ~ Items[{id:"minecraft:tnt"}] run tag @s add ms_safe_mine
execute if entity @s[tag=ms_safe_partner_z_pos] positioned ~ ~ ~1 if data block ~ ~ ~ Items[{id:"minecraft:tnt"}] run tag @s add ms_safe_mine
execute if entity @s[tag=ms_safe_partner_z_neg] positioned ~ ~ ~-1 if data block ~ ~ ~ Items[{id:"minecraft:tnt"}] run tag @s add ms_safe_mine
