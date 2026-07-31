# МАСТЕР-КЛЮЧ — админское открытие любого сейфа.
# Контекст: as/at кликнутый guard interaction, набор ms_safe_pair уже собран.
#
# Отдельный вход нужен ради заметного UX и отдельного звука: админ должен
# видеть, что сейф открыт именно мастер-ключом, а не родным паролем.
title @a[tag=ms_safe_user,limit=1] actionbar {text:"Мастер-ключ: замок снят",color:"light_purple",bold:true}
playsound minecraft:block.beacon.activate master @a[tag=ms_safe_user,limit=1] ~ ~ ~ 0.5 1.8

function mosseater:safe/access_granted
