# Обработка без промежуточных тегов: значение trigger сбрасывается и objective
# повторно enable ДО выполнения UX-функции игрока.
execute as @a[scores={mosseater.safe_key=1..}] at @s run function mosseater:safe/process_key_trigger
execute as @a[scores={mosseater.safe_cancel=1..}] at @s run function mosseater:safe/process_cancel_trigger
