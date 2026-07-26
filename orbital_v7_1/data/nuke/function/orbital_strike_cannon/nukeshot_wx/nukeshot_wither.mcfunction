# Опциональная добавка к NUKE — голубые черепа визера, способные пробивать обсидиан.
# Включается только через настройку nuke.cfg.wither = 1 (по умолчанию ВЫКЛЮЧЕНО).
# Спавним 6 черепов сверху с небольшим разлётом, fuse не нужен — explosion у wither_skull срабатывает при ударе.
summon wither_skull ~-0.4 ~50 ~-0.4 {power:1,Motion:[0.05,-0.6,0.05]}
summon wither_skull ~0.4 ~50 ~-0.4 {power:1,Motion:[-0.05,-0.6,0.05]}
summon wither_skull ~-0.4 ~50 ~0.4 {power:1,Motion:[0.05,-0.6,-0.05]}
summon wither_skull ~0.4 ~50 ~0.4 {power:1,Motion:[-0.05,-0.6,-0.05]}
summon wither_skull ~ ~52 ~ {power:1,Motion:[0.0,-0.6,0.0]}
summon wither_skull ~ ~54 ~ {power:1,Motion:[0.0,-0.6,0.0]}
