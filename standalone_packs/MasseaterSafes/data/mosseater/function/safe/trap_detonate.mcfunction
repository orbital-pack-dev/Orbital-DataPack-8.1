# МОДУЛЬ 4 — Сундук-Мина. Детонация при несанкционированном разрушении.
# Контекст: as <маркер>, at <центр уже разрушенного блока>.
#
# Вызывается только из drop, то есть в тик, когда блок сейфа исчез, а окно
# доступа закрыто и тега ms_safe_auth нет. Владелец, открывший сейф ключом,
# держит ms_safe_auth и может свободно забрать заряд.

# 1. Взрывной эффект.
execute align xyz run particle minecraft:explosion_emitter ~0.5 ~0.5 ~0.5 0 0 0 1 1 force @a[distance=..64]
execute align xyz run particle minecraft:large_smoke ~0.5 ~0.5 ~0.5 0.4 0.4 0.4 0.05 40 normal @a[distance=..48]
playsound minecraft:entity.generic.explode block @a[distance=..48] ~ ~ ~ 4 0.85

# 2. Физический заряд для антуража и урона по окружению.
summon minecraft:tnt ~ ~ ~ {fuse:10s,Tags:["ms_safe_mine"]}

# 3. Гарантированное убийство ИМЕННО грифера, а не случайного соседа.
#    Ближайший игрок к разрушенному блоку и есть тот, кто его сломал.
execute as @p[distance=..6] run function mosseater:safe/trap_kill
