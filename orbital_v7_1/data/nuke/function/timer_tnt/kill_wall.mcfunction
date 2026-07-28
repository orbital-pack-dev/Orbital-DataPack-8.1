# БЕЗОПАСНОЕ УДАЛЕНИЕ МАГМА-КУБА.
# Магма-куб при смерти делится на мелкие кубы ПО СВОИМ КООРДИНАТАМ,
# поэтому сначала уводим его в void и только потом убиваем — осколки
# спавнятся на Y=-100 и мгновенно уничтожаются (тот же kill по тегу).
tp @e[type=minecraft:magma_cube,tag=display_solid_wall,distance=..2] ~ -100 ~
kill @e[type=minecraft:magma_cube,tag=display_solid_wall,distance=..2]
kill @e[type=minecraft:magma_cube,tag=display_solid_wall,y=-120,dy=40]
