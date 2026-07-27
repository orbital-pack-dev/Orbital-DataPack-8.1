# Контекст: as <жертва в радиусе взрыва>.
# Урон всегда с явным источником-игроком, если автор известен.
execute if entity @a[tag=nuke_attacker,limit=1] run damage @s 20 minecraft:explosion by @a[tag=nuke_attacker,limit=1]
execute unless entity @a[tag=nuke_attacker,limit=1] run damage @s 20 minecraft:explosion
