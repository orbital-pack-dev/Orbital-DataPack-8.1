# Контекст: as <жертва в радиусе взрыва жилета>.
execute if entity @a[tag=nuke_attacker,limit=1] run damage @s 45 minecraft:explosion by @a[tag=nuke_attacker,limit=1]
execute unless entity @a[tag=nuke_attacker,limit=1] run damage @s 45 minecraft:explosion
