# Контекст: as <цель>. Атакующий берётся по тегу, а не по @p,
# иначе владельцем урона мог оказаться сам пострадавший.
damage @s 4 minecraft:player_attack by @a[tag=archi_user,limit=1,sort=nearest]
