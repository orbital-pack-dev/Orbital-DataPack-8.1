# Защита блоков: гасим ванильный взрыв TNT до разрушения блоков.
# ИСПРАВЛЕНО: раньше срабатывало всегда, игнорируя настройку block_protection,
# из-за чего режим "разрушение разрешено" не работал вообще.
execute if score block_protection nuke.settings matches 1 as @e[type=tnt] if data entity @s {fuse:1s} run function nuke:orbital_strike_cannon/safe_tnt
