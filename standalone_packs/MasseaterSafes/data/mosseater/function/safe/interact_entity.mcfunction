# Контекст: as <interaction>, at <interaction>.
execute if entity @s[tag=ms_safe_setup] run dialog show @a[tag=ms_safe_user,limit=1] mosseater:safe_setup
execute if entity @s[tag=ms_safe_setup] run data remove entity @s interaction
execute if entity @s[tag=ms_safe_setup] run return 0

# Перед ранним return очищаем interaction.player, чтобы неверная/неполная
# установка пароля не блокировала следующий ПКМ.
execute if entity @s[tag=ms_safe_awaiting_key] run data remove entity @s interaction
execute if entity @s[tag=ms_safe_awaiting_key] run return run function mosseater:safe/set_password

execute if entity @s[tag=ms_safe_guard] run function mosseater:safe/access_check
# При отказе guard остаётся существовать, поэтому его click state сбрасывается.
data remove entity @s interaction
