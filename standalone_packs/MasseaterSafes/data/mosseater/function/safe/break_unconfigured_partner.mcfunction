# МОДУЛЬ 3 — попытка пристроить сундук к сейфу без пароля.
# Контекст: as <маркер-донор>, positioned <центр пристроенной половины>.
title @a[distance=..8,limit=1,sort=nearest] actionbar {text:"Нельзя объединять сундуки, пока пароль не будет поставлен!",color:"red",bold:true}
function mosseater:safe/break_partner_block
