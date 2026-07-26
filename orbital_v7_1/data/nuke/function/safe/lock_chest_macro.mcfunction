# Макрос запирания сейфа. Вызывается как:
#   function nuke:safe/lock_chest_macro with storage nuke:safe key
# где key.pw — установленный пароль, а контекст позиции — блок сейфа.

# Старый маркер на этой же позиции убираем, чтобы не копить дубли.
kill @e[type=minecraft:marker,tag=safe_box,distance=..0.9]

# 1) Ванильный зампок: открыть можно только активным ключом с верным именем.
$data modify block ~ ~ ~ components."minecraft:lock" set value {items:"minecraft:tripwire_hook",components:{"minecraft:custom_name":'$(pw)'},predicates:{"minecraft:custom_data":{nuke_key_active:true}}}

# 2) Маркер-состояние сейфа: хранит пароль для автозапечатывания и держит тиковую охрану.
$summon minecraft:marker ~ ~ ~ {Tags:["safe_box"],data:{pw:'$(pw)'}}

# 3) Сразу же гарантируем одиночное состояние блока.
execute unless block ~ ~ ~ minecraft:chest[type=single] as @e[type=minecraft:marker,tag=safe_box,distance=..0.9] at @s run function nuke:safe/split_self_do

playsound minecraft:block.chest.locked block @a[distance=..16] ~ ~ ~ 1 1
