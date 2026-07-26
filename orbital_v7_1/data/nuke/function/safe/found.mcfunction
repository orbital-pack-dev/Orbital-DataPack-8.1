# Контекст: as <игрок>, positioned <точка попадания луча в сундук>.
# align xyz -> угол блока, затем центр по X/Z и низ блока по Y,
# чтобы ~ ~ ~ в init_shield указывал ровно на блок сундука.
execute align xyz positioned ~0.5 ~ ~0.5 run function nuke:safe/init_shield
