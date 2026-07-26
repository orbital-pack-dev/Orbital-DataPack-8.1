# Контекст: as <цель>.
execute if entity @a[tag=bv_owner,limit=1] run damage @s 30 minecraft:explosion by @a[tag=bv_owner,limit=1]
execute unless entity @a[tag=bv_owner,limit=1] run damage @s 30 minecraft:explosion
