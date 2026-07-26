execute as @a[scores={t_stab_cd=1..}] run scoreboard players operation nuke.cfg.stab_cd nuke.settings += @s t_stab_cd
execute as @a[scores={t_stab_cd=..-1}] run scoreboard players operation nuke.cfg.stab_cd nuke.settings += @s t_stab_cd
execute if score nuke.cfg.stab_cd nuke.settings matches ..-1 run scoreboard players set nuke.cfg.stab_cd nuke.settings 0
execute if score nuke.cfg.stab_cd nuke.settings matches 1201.. run scoreboard players set nuke.cfg.stab_cd nuke.settings 1200
execute as @a[scores={t_stab_cd=1..}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"КД STAB: ","color":"aqua"},{"score":{"name":"nuke.cfg.stab_cd","objective":"nuke.settings"}},{"text":" тик.","color":"gray"}]
execute as @a[scores={t_stab_cd=..-1}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"КД STAB: ","color":"aqua"},{"score":{"name":"nuke.cfg.stab_cd","objective":"nuke.settings"}},{"text":" тик.","color":"gray"}]
execute as @a[scores={t_stab_cd=1..}] run dialog show @s nuke:stab_cd
execute as @a[scores={t_stab_cd=..-1}] run dialog show @s nuke:stab_cd
scoreboard players reset @a t_stab_cd

execute as @a[scores={t_nuke_cd=1..}] run scoreboard players operation nuke.cfg.nuke_cd nuke.settings += @s t_nuke_cd
execute as @a[scores={t_nuke_cd=..-1}] run scoreboard players operation nuke.cfg.nuke_cd nuke.settings += @s t_nuke_cd
execute if score nuke.cfg.nuke_cd nuke.settings matches ..-1 run scoreboard players set nuke.cfg.nuke_cd nuke.settings 0
execute if score nuke.cfg.nuke_cd nuke.settings matches 1201.. run scoreboard players set nuke.cfg.nuke_cd nuke.settings 1200
execute as @a[scores={t_nuke_cd=1..}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"КД NUKE: ","color":"red"},{"score":{"name":"nuke.cfg.nuke_cd","objective":"nuke.settings"}},{"text":" тик.","color":"gray"}]
execute as @a[scores={t_nuke_cd=..-1}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"КД NUKE: ","color":"red"},{"score":{"name":"nuke.cfg.nuke_cd","objective":"nuke.settings"}},{"text":" тик.","color":"gray"}]
execute as @a[scores={t_nuke_cd=1..}] run dialog show @s nuke:nuke_cd
execute as @a[scores={t_nuke_cd=..-1}] run dialog show @s nuke:nuke_cd
scoreboard players reset @a t_nuke_cd

execute as @a[scores={t_wither_cd=1..}] run scoreboard players operation nuke.cfg.wither_cd nuke.settings += @s t_wither_cd
execute as @a[scores={t_wither_cd=..-1}] run scoreboard players operation nuke.cfg.wither_cd nuke.settings += @s t_wither_cd
execute if score nuke.cfg.wither_cd nuke.settings matches ..-1 run scoreboard players set nuke.cfg.wither_cd nuke.settings 0
execute if score nuke.cfg.wither_cd nuke.settings matches 1201.. run scoreboard players set nuke.cfg.wither_cd nuke.settings 1200
execute as @a[scores={t_wither_cd=1..}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"КД WITHER: ","color":"dark_purple"},{"score":{"name":"nuke.cfg.wither_cd","objective":"nuke.settings"}},{"text":" тик.","color":"gray"}]
execute as @a[scores={t_wither_cd=..-1}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"КД WITHER: ","color":"dark_purple"},{"score":{"name":"nuke.cfg.wither_cd","objective":"nuke.settings"}},{"text":" тик.","color":"gray"}]
execute as @a[scores={t_wither_cd=1..}] run dialog show @s nuke:wither_cd
execute as @a[scores={t_wither_cd=..-1}] run dialog show @s nuke:wither_cd
scoreboard players reset @a t_wither_cd

execute as @a[scores={t_mortar_cd=1..}] run scoreboard players operation nuke.cfg.mortar_cd nuke.settings += @s t_mortar_cd
execute as @a[scores={t_mortar_cd=..-1}] run scoreboard players operation nuke.cfg.mortar_cd nuke.settings += @s t_mortar_cd
execute if score nuke.cfg.mortar_cd nuke.settings matches ..-1 run scoreboard players set nuke.cfg.mortar_cd nuke.settings 0
execute if score nuke.cfg.mortar_cd nuke.settings matches 1201.. run scoreboard players set nuke.cfg.mortar_cd nuke.settings 1200
execute as @a[scores={t_mortar_cd=1..}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"КД MORTAR: ","color":"gold"},{"score":{"name":"nuke.cfg.mortar_cd","objective":"nuke.settings"}},{"text":" тик.","color":"gray"}]
execute as @a[scores={t_mortar_cd=..-1}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"КД MORTAR: ","color":"gold"},{"score":{"name":"nuke.cfg.mortar_cd","objective":"nuke.settings"}},{"text":" тик.","color":"gray"}]
execute as @a[scores={t_mortar_cd=1..}] run dialog show @s nuke:mortar_cd
execute as @a[scores={t_mortar_cd=..-1}] run dialog show @s nuke:mortar_cd
scoreboard players reset @a t_mortar_cd

execute as @a[scores={t_archi_cd=1..}] run scoreboard players operation nuke.cfg.archi_cd nuke.settings += @s t_archi_cd
execute as @a[scores={t_archi_cd=..-1}] run scoreboard players operation nuke.cfg.archi_cd nuke.settings += @s t_archi_cd
execute if score nuke.cfg.archi_cd nuke.settings matches ..-1 run scoreboard players set nuke.cfg.archi_cd nuke.settings 0
execute if score nuke.cfg.archi_cd nuke.settings matches 1201.. run scoreboard players set nuke.cfg.archi_cd nuke.settings 1200
execute as @a[scores={t_archi_cd=1..}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"КД ARCHI-SHIELD: ","color":"yellow"},{"score":{"name":"nuke.cfg.archi_cd","objective":"nuke.settings"}},{"text":" тик.","color":"gray"}]
execute as @a[scores={t_archi_cd=..-1}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"КД ARCHI-SHIELD: ","color":"yellow"},{"score":{"name":"nuke.cfg.archi_cd","objective":"nuke.settings"}},{"text":" тик.","color":"gray"}]
execute as @a[scores={t_archi_cd=1..}] run dialog show @s nuke:archi_cd
execute as @a[scores={t_archi_cd=..-1}] run dialog show @s nuke:archi_cd
scoreboard players reset @a t_archi_cd

execute as @a[scores={t_xp_stab=1..}] run scoreboard players operation nuke.cfg.xp_stab nuke.settings += @s t_xp_stab
execute as @a[scores={t_xp_stab=..-1}] run scoreboard players operation nuke.cfg.xp_stab nuke.settings += @s t_xp_stab
execute if score nuke.cfg.xp_stab nuke.settings matches ..-1 run scoreboard players set nuke.cfg.xp_stab nuke.settings 0
execute if score nuke.cfg.xp_stab nuke.settings matches 101.. run scoreboard players set nuke.cfg.xp_stab nuke.settings 100
execute as @a[scores={t_xp_stab=1..}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"XP STAB: ","color":"green"},{"score":{"name":"nuke.cfg.xp_stab","objective":"nuke.settings"}},{"text":" levels.","color":"gray"}]
execute as @a[scores={t_xp_stab=..-1}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"XP STAB: ","color":"green"},{"score":{"name":"nuke.cfg.xp_stab","objective":"nuke.settings"}},{"text":" levels.","color":"gray"}]
execute as @a[scores={t_xp_stab=1..}] run dialog show @s nuke:xp_stab
execute as @a[scores={t_xp_stab=..-1}] run dialog show @s nuke:xp_stab
scoreboard players reset @a t_xp_stab

execute as @a[scores={t_xp_nuke=1..}] run scoreboard players operation nuke.cfg.xp_nuke nuke.settings += @s t_xp_nuke
execute as @a[scores={t_xp_nuke=..-1}] run scoreboard players operation nuke.cfg.xp_nuke nuke.settings += @s t_xp_nuke
execute if score nuke.cfg.xp_nuke nuke.settings matches ..-1 run scoreboard players set nuke.cfg.xp_nuke nuke.settings 0
execute if score nuke.cfg.xp_nuke nuke.settings matches 101.. run scoreboard players set nuke.cfg.xp_nuke nuke.settings 100
execute as @a[scores={t_xp_nuke=1..}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"XP NUKE: ","color":"green"},{"score":{"name":"nuke.cfg.xp_nuke","objective":"nuke.settings"}},{"text":" levels.","color":"gray"}]
execute as @a[scores={t_xp_nuke=..-1}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"XP NUKE: ","color":"green"},{"score":{"name":"nuke.cfg.xp_nuke","objective":"nuke.settings"}},{"text":" levels.","color":"gray"}]
execute as @a[scores={t_xp_nuke=1..}] run dialog show @s nuke:xp_nuke
execute as @a[scores={t_xp_nuke=..-1}] run dialog show @s nuke:xp_nuke
scoreboard players reset @a t_xp_nuke

execute as @a[scores={t_xp_wither=1..}] run scoreboard players operation nuke.cfg.xp_wither nuke.settings += @s t_xp_wither
execute as @a[scores={t_xp_wither=..-1}] run scoreboard players operation nuke.cfg.xp_wither nuke.settings += @s t_xp_wither
execute if score nuke.cfg.xp_wither nuke.settings matches ..-1 run scoreboard players set nuke.cfg.xp_wither nuke.settings 0
execute if score nuke.cfg.xp_wither nuke.settings matches 101.. run scoreboard players set nuke.cfg.xp_wither nuke.settings 100
execute as @a[scores={t_xp_wither=1..}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"XP WITHER: ","color":"green"},{"score":{"name":"nuke.cfg.xp_wither","objective":"nuke.settings"}},{"text":" levels.","color":"gray"}]
execute as @a[scores={t_xp_wither=..-1}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"XP WITHER: ","color":"green"},{"score":{"name":"nuke.cfg.xp_wither","objective":"nuke.settings"}},{"text":" levels.","color":"gray"}]
execute as @a[scores={t_xp_wither=1..}] run dialog show @s nuke:xp_wither
execute as @a[scores={t_xp_wither=..-1}] run dialog show @s nuke:xp_wither
scoreboard players reset @a t_xp_wither

execute as @a[scores={t_xp_mortar=1..}] run scoreboard players operation nuke.cfg.xp_mortar nuke.settings += @s t_xp_mortar
execute as @a[scores={t_xp_mortar=..-1}] run scoreboard players operation nuke.cfg.xp_mortar nuke.settings += @s t_xp_mortar
execute if score nuke.cfg.xp_mortar nuke.settings matches ..-1 run scoreboard players set nuke.cfg.xp_mortar nuke.settings 0
execute if score nuke.cfg.xp_mortar nuke.settings matches 101.. run scoreboard players set nuke.cfg.xp_mortar nuke.settings 100
execute as @a[scores={t_xp_mortar=1..}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"XP MORTAR: ","color":"gold"},{"score":{"name":"nuke.cfg.xp_mortar","objective":"nuke.settings"}},{"text":" levels.","color":"gray"}]
execute as @a[scores={t_xp_mortar=..-1}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"XP MORTAR: ","color":"gold"},{"score":{"name":"nuke.cfg.xp_mortar","objective":"nuke.settings"}},{"text":" levels.","color":"gray"}]
execute as @a[scores={t_xp_mortar=1..}] run dialog show @s nuke:xp_mortar
execute as @a[scores={t_xp_mortar=..-1}] run dialog show @s nuke:xp_mortar
scoreboard players reset @a t_xp_mortar

execute as @a[scores={t_xp_archi=1..}] run scoreboard players operation nuke.cfg.xp_archi nuke.settings += @s t_xp_archi
execute as @a[scores={t_xp_archi=..-1}] run scoreboard players operation nuke.cfg.xp_archi nuke.settings += @s t_xp_archi
execute if score nuke.cfg.xp_archi nuke.settings matches ..-1 run scoreboard players set nuke.cfg.xp_archi nuke.settings 0
execute if score nuke.cfg.xp_archi nuke.settings matches 101.. run scoreboard players set nuke.cfg.xp_archi nuke.settings 100
execute as @a[scores={t_xp_archi=1..}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"XP ARCHI-SHIELD: ","color":"yellow"},{"score":{"name":"nuke.cfg.xp_archi","objective":"nuke.settings"}},{"text":" levels.","color":"gray"}]
execute as @a[scores={t_xp_archi=..-1}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"XP ARCHI-SHIELD: ","color":"yellow"},{"score":{"name":"nuke.cfg.xp_archi","objective":"nuke.settings"}},{"text":" levels.","color":"gray"}]
execute as @a[scores={t_xp_archi=1..}] run dialog show @s nuke:xp_archi
execute as @a[scores={t_xp_archi=..-1}] run dialog show @s nuke:xp_archi
scoreboard players reset @a t_xp_archi


execute as @a[scores={t_vip=1..}] run scoreboard players operation @s nuke.temp = nuke.cfg.vip nuke.settings
execute as @a[scores={t_vip=1..}] if score @s nuke.temp matches 0 run scoreboard players set nuke.cfg.vip nuke.settings 1
execute as @a[scores={t_vip=1..}] if score @s nuke.temp matches 0 run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"VIP без XP включён.","color":"green"}]
execute as @a[scores={t_vip=1..}] unless score @s nuke.temp matches 0 run scoreboard players set nuke.cfg.vip nuke.settings 0
execute as @a[scores={t_vip=1..}] unless score @s nuke.temp matches 0 run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"VIP без XP выключен.","color":"red"}]
execute as @a[scores={t_vip=1..}] run dialog show @s nuke:vip
scoreboard players reset @a t_vip

execute as @a[scores={t_wither=1..}] run scoreboard players operation @s nuke.temp = nuke.cfg.wither nuke.settings
execute as @a[scores={t_wither=1..}] if score @s nuke.temp matches 0 run scoreboard players set nuke.cfg.wither nuke.settings 1
execute as @a[scores={t_wither=1..}] if score @s nuke.temp matches 0 run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"Черепа визера в NUKE включены.","color":"dark_purple"}]
execute as @a[scores={t_wither=1..}] unless score @s nuke.temp matches 0 run scoreboard players set nuke.cfg.wither nuke.settings 0
execute as @a[scores={t_wither=1..}] unless score @s nuke.temp matches 0 run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"Черепа визера в NUKE выключены.","color":"red"}]
execute as @a[scores={t_wither=1..}] run dialog show @s nuke:wither
scoreboard players reset @a t_wither

execute as @a[scores={t_orbital_nerf=1..}] run scoreboard players operation @s nuke.temp = orbital_nerf nuke.settings
execute as @a[scores={t_orbital_nerf=1..}] if score @s nuke.temp matches 0 run scoreboard players set orbital_nerf nuke.settings 1
execute as @a[scores={t_orbital_nerf=1..}] if score @s nuke.temp matches 0 run scoreboard players set global orbital_nerf 1
execute as @a[scores={t_orbital_nerf=1..}] if score @s nuke.temp matches 0 run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"orbital_nerf = 1.","color":"green"}]
execute as @a[scores={t_orbital_nerf=1..}] unless score @s nuke.temp matches 0 run scoreboard players set orbital_nerf nuke.settings 0
execute as @a[scores={t_orbital_nerf=1..}] unless score @s nuke.temp matches 0 run scoreboard players set global orbital_nerf 0
execute as @a[scores={t_orbital_nerf=1..}] unless score @s nuke.temp matches 0 run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"orbital_nerf = 0.","color":"red"}]
execute as @a[scores={t_orbital_nerf=1..}] run dialog show @s nuke:orbital_nerf
scoreboard players reset @a t_orbital_nerf

execute as @a[scores={t_block_protection=1..}] run scoreboard players operation @s nuke.temp = block_protection nuke.settings
execute as @a[scores={t_block_protection=1..}] if score @s nuke.temp matches 0 run scoreboard players set block_protection nuke.settings 1
execute as @a[scores={t_block_protection=1..}] if score @s nuke.temp matches 0 run scoreboard players set global block_protection 1
execute as @a[scores={t_block_protection=1..}] if score @s nuke.temp matches 0 run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"block_protection = 1.","color":"green"}]
execute as @a[scores={t_block_protection=1..}] unless score @s nuke.temp matches 0 run scoreboard players set block_protection nuke.settings 0
execute as @a[scores={t_block_protection=1..}] unless score @s nuke.temp matches 0 run scoreboard players set global block_protection 0
execute as @a[scores={t_block_protection=1..}] unless score @s nuke.temp matches 0 run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"block_protection = 0.","color":"red"}]
execute as @a[scores={t_block_protection=1..}] run dialog show @s nuke:block_protection
scoreboard players reset @a t_block_protection

execute as @a[scores={t_personal_cd=1..}] run scoreboard players operation @s nuke.temp = personal_cd nuke.settings
execute as @a[scores={t_personal_cd=1..}] if score @s nuke.temp matches 0 run scoreboard players set personal_cd nuke.settings 1
execute as @a[scores={t_personal_cd=1..}] if score @s nuke.temp matches 0 run scoreboard players set global personal_cd 1
execute as @a[scores={t_personal_cd=1..}] if score @s nuke.temp matches 0 run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"personal_cd = 1.","color":"green"}]
execute as @a[scores={t_personal_cd=1..}] unless score @s nuke.temp matches 0 run scoreboard players set personal_cd nuke.settings 0
execute as @a[scores={t_personal_cd=1..}] unless score @s nuke.temp matches 0 run scoreboard players set global personal_cd 0
execute as @a[scores={t_personal_cd=1..}] unless score @s nuke.temp matches 0 run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"personal_cd = 0.","color":"red"}]
execute as @a[scores={t_personal_cd=1..}] run dialog show @s nuke:personal_cd
scoreboard players reset @a t_personal_cd

execute as @a[scores={t_info=1..}] run function nuke:settings/info
scoreboard players reset @a t_info

execute as @a[scores={t_reset=1..}] run function nuke:settings/reset
execute as @a[scores={t_reset=1..}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"Настройки сброшены к дефолту.","color":"yellow"}]
scoreboard players reset @a t_reset


execute as @a[scores={t_bv_time=1..}] run scoreboard players operation nuke.cfg.bv_time nuke.settings = @s t_bv_time
execute as @a[scores={t_bv_time=1..}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"Таймер Подрывного Жилета установлен.","color":"yellow"}]
scoreboard players reset @a t_bv_time

execute as @a[scores={t_tt_scale=1..}] run scoreboard players operation nuke.cfg.tt_scale nuke.settings = @s t_tt_scale
execute as @a[scores={t_tt_scale=1..}] run tellraw @s ["",{"text":"[Settings] ","color":"dark_gray"},{"text":"Масштаб времени Таймер-ТНТ установлен.","color":"yellow"}]
scoreboard players reset @a t_tt_scale

execute as @a run function nuke:settings/enable_triggers
