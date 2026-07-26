import os
import math

base_dir = r"c:\Users\1\AppData\Roaming\ModrinthApp\profiles\Cozy Modpack by remkkic\saves\Nuke-проверка\datapacks\orbital_v7_1\data\nuke\function\orbital_strike_cannon\wither_shot"

os.makedirs(os.path.join(base_dir, "phase1"), exist_ok=True)
os.makedirs(os.path.join(base_dir, "phase2"), exist_ok=True)
os.makedirs(os.path.join(base_dir, "phase3"), exist_ok=True)
os.makedirs(os.path.join(base_dir, "phase4"), exist_ok=True)

# Phase 1: 12 rings of wither_norm (dangerous:0b)
for i in range(1, 13):
    radius = 2.0 + (i - 1) * 0.7
    lines = [f"# Phase 1 Ring {i}/12 — Radius {radius:.1f}"]
    for angle_deg in range(0, 360, 45):
        rad = math.radians(angle_deg)
        x = radius * math.cos(rad)
        z = radius * math.sin(rad)
        # Straight down fast so explosions don't scatter falling projectiles
        lines.append(
            f'summon wither_skull ~{x:.2f} ~64.0 ~{z:.2f} {{dangerous:0b,Tags:["wither_norm"],Motion:[0.0,-2.5,0.0],acceleration_power:[0.0d,-0.3d,0.0d],power:[0.0,-0.3,0.0]}}'
        )
    with open(os.path.join(base_dir, "phase1", f"ring_{i}.mcfunction"), "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")

# Phase 2: Double 1 (blue skulls + fireballs)
for i in range(1, 13):
    radius = 2.5 + (i - 1) * 0.8
    lines = [f"# Phase 2 Double 1 Ring {i}/12 — Radius {radius:.1f}"]
    for angle_deg in range(0, 360, 45):
        rad = math.radians(angle_deg)
        x = radius * math.cos(rad)
        z = radius * math.sin(rad)
        lines.append(
            f'summon wither_skull ~{x:.2f} ~64.0 ~{z:.2f} {{dangerous:1b,Tags:["blue_bomb"],Motion:[0.0,-2.5,0.0],acceleration_power:[0.0d,-0.3d,0.0d],power:[0.0,-0.3,0.0]}}'
        )
        lines.append(
            f'summon fireball ~{x:.2f} ~68.0 ~{z:.2f} {{ExplosionPower:4b,Tags:["blue_fireball"],Motion:[0.0,-2.5,0.0],acceleration_power:[0.0d,-0.3d,0.0d],power:[0.0,-0.3,0.0]}}'
        )
    with open(os.path.join(base_dir, "phase2", f"d1_ring_{i}.mcfunction"), "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")

# Phase 2: Double 2 & Double 3 (blue skulls)
for d in [2, 3]:
    for i in range(1, 13):
        radius = 2.5 + (i - 1) * 0.8
        lines = [f"# Phase 2 Double {d} Ring {i}/12 — Radius {radius:.1f}"]
        for angle_deg in range(0, 360, 45):
            rad = math.radians(angle_deg)
            x = radius * math.cos(rad)
            z = radius * math.sin(rad)
            lines.append(
                f'summon wither_skull ~{x:.2f} ~64.0 ~{z:.2f} {{dangerous:1b,Tags:["blue_bomb"],Motion:[0.0,-2.5,0.0],acceleration_power:[0.0d,-0.3d,0.0d],power:[0.0,-0.3,0.0]}}'
            )
        with open(os.path.join(base_dir, "phase2", f"d{d}_ring_{i}.mcfunction"), "w", encoding="utf-8") as f:
            f.write("\n".join(lines) + "\n")

# Phase 3: 12 rings of blue skulls
for i in range(1, 13):
    radius = 3.0 + (i - 1) * 0.9
    lines = [f"# Phase 3 Ring {i}/12 — Radius {radius:.1f}"]
    for angle_deg in range(0, 360, 45):
        rad = math.radians(angle_deg)
        x = radius * math.cos(rad)
        z = radius * math.sin(rad)
        lines.append(
            f'summon wither_skull ~{x:.2f} ~64.0 ~{z:.2f} {{dangerous:1b,Tags:["blue_bomb"],Motion:[0.0,-2.5,0.0],acceleration_power:[0.0d,-0.3d,0.0d],power:[0.0,-0.3,0.0]}}'
        )
    with open(os.path.join(base_dir, "phase3", f"ring_{i}.mcfunction"), "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")

# Phase 4: infect.mcfunction covering Y from -65 to +5 relative to @s
infect_content = """# WITHER SHOT - PHASE 4: AREA INFECTION (Заражение области)
# Полный охват кратера по всей глубине (от поверхности вниз на 65 блоков, радиус 22 блока)

playsound minecraft:entity.wither.spawn master @a[distance=..96] ~ ~ ~ 2.0 0.8
playsound minecraft:entity.wither.ambient master @a[distance=..96] ~ ~ ~ 2.0 0.5

# Визуальные эффекты токсичного облака по всей высоте кратера
particle minecraft:witch ~ ~-30 ~ 20 30 20 0.1 800 force
particle minecraft:dragon_breath ~ ~-30 ~ 20 30 20 0.05 600 force
particle minecraft:squid_ink ~ ~-30 ~ 20 30 20 0.05 500 force
particle minecraft:sculk_soul ~ ~-30 ~ 18 30 18 0.08 400 force
particle minecraft:large_smoke ~ ~-30 ~ 20 30 20 0.03 400 force

# Создание вертикальной колонны из облаков эффектов на разных глубинах (от дна кратера до поверхности)
summon area_effect_cloud ~ ~-60 ~ {duration:14400,radius:22.0f,particle:{type:"minecraft:dragon_breath"},Tags:["wither_infect_zone"],potion_contents:{custom_effects:[{id:"minecraft:wither",amplifier:1b,duration:400},{id:"minecraft:poison",amplifier:1b,duration:400}]}}
summon area_effect_cloud ~ ~-50 ~ {duration:14400,radius:22.0f,particle:{type:"minecraft:dragon_breath"},Tags:["wither_infect_zone"],potion_contents:{custom_effects:[{id:"minecraft:wither",amplifier:1b,duration:400},{id:"minecraft:poison",amplifier:1b,duration:400}]}}
summon area_effect_cloud ~ ~-40 ~ {duration:14400,radius:22.0f,particle:{type:"minecraft:dragon_breath"},Tags:["wither_infect_zone"],potion_contents:{custom_effects:[{id:"minecraft:wither",amplifier:1b,duration:400},{id:"minecraft:poison",amplifier:1b,duration:400}]}}
summon area_effect_cloud ~ ~-30 ~ {duration:14400,radius:22.0f,particle:{type:"minecraft:dragon_breath"},Tags:["wither_infect_zone"],potion_contents:{custom_effects:[{id:"minecraft:wither",amplifier:1b,duration:400},{id:"minecraft:poison",amplifier:1b,duration:400}]}}
summon area_effect_cloud ~ ~-20 ~ {duration:14400,radius:22.0f,particle:{type:"minecraft:dragon_breath"},Tags:["wither_infect_zone"],potion_contents:{custom_effects:[{id:"minecraft:wither",amplifier:1b,duration:400},{id:"minecraft:poison",amplifier:1b,duration:400}]}}
summon area_effect_cloud ~ ~-10 ~ {duration:14400,radius:22.0f,particle:{type:"minecraft:dragon_breath"},Tags:["wither_infect_zone"],potion_contents:{custom_effects:[{id:"minecraft:wither",amplifier:1b,duration:400},{id:"minecraft:poison",amplifier:1b,duration:400}]}}
summon area_effect_cloud ~ ~0 ~ {duration:14400,radius:22.0f,particle:{type:"minecraft:dragon_breath"},Tags:["wither_infect_zone"],potion_contents:{custom_effects:[{id:"minecraft:wither",amplifier:1b,duration:400},{id:"minecraft:poison",amplifier:1b,duration:400}]}}

# Мгновенное поражение всех существ в области
effect give @e[distance=..45,type=!item,type=!experience_orb,type=!block_display,type=!area_effect_cloud,type=!interaction,type=!text_display,type=!armor_stand] minecraft:wither 40 1 true
effect give @e[distance=..45,type=!item,type=!experience_orb,type=!block_display,type=!area_effect_cloud,type=!interaction,type=!text_display,type=!armor_stand] minecraft:poison 40 1 true
"""

with open(os.path.join(base_dir, "phase4", "infect.mcfunction"), "w", encoding="utf-8") as f:
    f.write(infect_content)

print("Successfully regenerated all Wither-Shot phase files!")
