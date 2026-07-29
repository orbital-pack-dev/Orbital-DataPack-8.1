# Advancement оставлен только как совместимый detector/revoke.
# Фактическая обработка выполняется тиковым on_interact через execute on target,
# иначе advancement и NBT-handler могли обработать один клик дважды.
advancement revoke @s only mosseater:safe_interact
