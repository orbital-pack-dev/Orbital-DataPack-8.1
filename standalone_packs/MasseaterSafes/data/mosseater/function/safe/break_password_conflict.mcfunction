# МОДУЛЬ 3 — попытка объединить два сейфа с разными паролями.
# Контекст: as <маркер-донор>, positioned <центр второй половины>.
title @a[distance=..8,limit=1,sort=nearest] actionbar {text:"Нельзя объединять сундуки с разными паролями!",color:"red",bold:true}
function mosseater:safe/break_partner_block
