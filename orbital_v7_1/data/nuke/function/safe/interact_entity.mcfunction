execute if entity @s[tag=safe_awaiting_key] run function nuke:safe/set_password
execute if entity @s[tag=safe_locked] run function nuke:safe/try_open
