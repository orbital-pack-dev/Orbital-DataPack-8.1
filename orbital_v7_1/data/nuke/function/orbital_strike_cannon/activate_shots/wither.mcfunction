# activate_shots/wither — Новая Пушка из СИНИХ Голов Визера (4 Стадии)
scoreboard players add @s withershot_timer 1

# ═══ ФАЗА 1: Обычные Головы Визера (12 колец) ═══
execute if score @s withershot_timer matches 10 at @s run function nuke:orbital_strike_cannon/wither_shot/phase1/ring_1
execute if score @s withershot_timer matches 12 at @s run function nuke:orbital_strike_cannon/wither_shot/phase1/ring_2
execute if score @s withershot_timer matches 14 at @s run function nuke:orbital_strike_cannon/wither_shot/phase1/ring_3
execute if score @s withershot_timer matches 16 at @s run function nuke:orbital_strike_cannon/wither_shot/phase1/ring_4
execute if score @s withershot_timer matches 18 at @s run function nuke:orbital_strike_cannon/wither_shot/phase1/ring_5
execute if score @s withershot_timer matches 20 at @s run function nuke:orbital_strike_cannon/wither_shot/phase1/ring_6
execute if score @s withershot_timer matches 22 at @s run function nuke:orbital_strike_cannon/wither_shot/phase1/ring_7
execute if score @s withershot_timer matches 24 at @s run function nuke:orbital_strike_cannon/wither_shot/phase1/ring_8
execute if score @s withershot_timer matches 26 at @s run function nuke:orbital_strike_cannon/wither_shot/phase1/ring_9
execute if score @s withershot_timer matches 28 at @s run function nuke:orbital_strike_cannon/wither_shot/phase1/ring_10
execute if score @s withershot_timer matches 30 at @s run function nuke:orbital_strike_cannon/wither_shot/phase1/ring_11
execute if score @s withershot_timer matches 32 at @s run function nuke:orbital_strike_cannon/wither_shot/phase1/ring_12

# ═══ ФАЗА 2: Синие головы (3 дубля = 36 колец + фаерболы в 1-м дубле) ═══
# Дубль 1 (12 колец синих голов + 12 колец фаерболов)
execute if score @s withershot_timer matches 50 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d1_ring_1
execute if score @s withershot_timer matches 52 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d1_ring_2
execute if score @s withershot_timer matches 54 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d1_ring_3
execute if score @s withershot_timer matches 56 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d1_ring_4
execute if score @s withershot_timer matches 58 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d1_ring_5
execute if score @s withershot_timer matches 60 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d1_ring_6
execute if score @s withershot_timer matches 62 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d1_ring_7
execute if score @s withershot_timer matches 64 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d1_ring_8
execute if score @s withershot_timer matches 66 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d1_ring_9
execute if score @s withershot_timer matches 68 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d1_ring_10
execute if score @s withershot_timer matches 70 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d1_ring_11
execute if score @s withershot_timer matches 72 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d1_ring_12
# Дубль 2 (12 колец синих голов)
execute if score @s withershot_timer matches 80 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d2_ring_1
execute if score @s withershot_timer matches 82 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d2_ring_2
execute if score @s withershot_timer matches 84 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d2_ring_3
execute if score @s withershot_timer matches 86 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d2_ring_4
execute if score @s withershot_timer matches 88 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d2_ring_5
execute if score @s withershot_timer matches 90 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d2_ring_6
execute if score @s withershot_timer matches 92 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d2_ring_7
execute if score @s withershot_timer matches 94 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d2_ring_8
execute if score @s withershot_timer matches 96 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d2_ring_9
execute if score @s withershot_timer matches 98 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d2_ring_10
execute if score @s withershot_timer matches 100 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d2_ring_11
execute if score @s withershot_timer matches 102 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d2_ring_12
# Дубль 3 (12 колец синих голов)
execute if score @s withershot_timer matches 110 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d3_ring_1
execute if score @s withershot_timer matches 112 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d3_ring_2
execute if score @s withershot_timer matches 114 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d3_ring_3
execute if score @s withershot_timer matches 116 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d3_ring_4
execute if score @s withershot_timer matches 118 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d3_ring_5
execute if score @s withershot_timer matches 120 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d3_ring_6
execute if score @s withershot_timer matches 122 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d3_ring_7
execute if score @s withershot_timer matches 124 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d3_ring_8
execute if score @s withershot_timer matches 126 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d3_ring_9
execute if score @s withershot_timer matches 128 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d3_ring_10
execute if score @s withershot_timer matches 130 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d3_ring_11
execute if score @s withershot_timer matches 132 at @s run function nuke:orbital_strike_cannon/wither_shot/phase2/d3_ring_12

# ═══ ФАЗА 3: Повторный выброс Синих Голов (12 колец) ═══
execute if score @s withershot_timer matches 150 at @s run function nuke:orbital_strike_cannon/wither_shot/phase3/ring_1
execute if score @s withershot_timer matches 152 at @s run function nuke:orbital_strike_cannon/wither_shot/phase3/ring_2
execute if score @s withershot_timer matches 154 at @s run function nuke:orbital_strike_cannon/wither_shot/phase3/ring_3
execute if score @s withershot_timer matches 156 at @s run function nuke:orbital_strike_cannon/wither_shot/phase3/ring_4
execute if score @s withershot_timer matches 158 at @s run function nuke:orbital_strike_cannon/wither_shot/phase3/ring_5
execute if score @s withershot_timer matches 160 at @s run function nuke:orbital_strike_cannon/wither_shot/phase3/ring_6
execute if score @s withershot_timer matches 162 at @s run function nuke:orbital_strike_cannon/wither_shot/phase3/ring_7
execute if score @s withershot_timer matches 164 at @s run function nuke:orbital_strike_cannon/wither_shot/phase3/ring_8
execute if score @s withershot_timer matches 166 at @s run function nuke:orbital_strike_cannon/wither_shot/phase3/ring_9
execute if score @s withershot_timer matches 168 at @s run function nuke:orbital_strike_cannon/wither_shot/phase3/ring_10
execute if score @s withershot_timer matches 170 at @s run function nuke:orbital_strike_cannon/wither_shot/phase3/ring_11
execute if score @s withershot_timer matches 172 at @s run function nuke:orbital_strike_cannon/wither_shot/phase3/ring_12

# ═══ ФАЗА 4: Заражение области (Маркер + Иссушение & Отравление) ═══
execute if score @s withershot_timer matches 230 at @s run function nuke:orbital_strike_cannon/wither_shot/phase4/infect

# ═══ Завершение ═══
execute if score @s withershot_timer matches 300.. at @s run kill @e[type=area_effect_cloud,tag=withershot_owner,distance=..1]
execute if score @s withershot_timer matches 300.. run kill @s


# Visual Overhaul: Wither-Shot dark soul fire trails
particle soul_fire_flame ~ ~ ~ 0.4 0.4 0.4 0.03 3
particle smoke ~ ~ ~ 0.3 0.3 0.3 0.02 3
