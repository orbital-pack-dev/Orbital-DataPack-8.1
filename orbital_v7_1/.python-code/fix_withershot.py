import os, math

base_dir = r'c:\Users\1\AppData\Roaming\ModrinthApp\profiles\Cozy Modpack by remkkic\saves\Nuke-проверка\datapacks\orbital_v7_1\data\nuke\function\orbital_strike_cannon\wither_shot'

# We want 12 rings for Phase 1 and Phase 3.
# To prevent projectiles from colliding with each other when spawning on a circle,
# if radius is small (e.g. ring 1 radius 2.35), we stagger the Y altitude slightly per skull (+0.2/-0.2)
# and give both Motion and acceleration_power pointing downward.

def gen_phase_ring(phase_folder, ring_num, alt, radius, is_dangerous=False, tag="wither_norm"):
    os.makedirs(os.path.join(base_dir, phase_folder), exist_ok=True)
    file_path = os.path.join(base_dir, phase_folder, f'ring_{ring_num}.mcfunction')
    
    # 8 points around circle
    lines = [f'# Ring {ring_num}/12 — Altitude ~{alt:.1f}, Radius {radius:.1f}']
    for i in range(8):
        angle = 2 * math.pi * i / 8.0
        x = radius * math.cos(angle)
        z = radius * math.sin(angle)
        # stagger y by 0.3 * (i % 2 - 0.5) to avoid exact bounding box overlaps on spawn
        y = alt + (0.4 if i % 2 == 0 else -0.4)
        
        # calculate slight outward motion + downward fast motion
        mx = round(0.004 * x, 4)
        mz = round(0.004 * z, 4)
        my = -1.35
        
        ax = round(0.0004 * x, 5)
        az = round(0.0004 * z, 5)
        ay = -0.135
        
        dang_str = "1b" if is_dangerous else "0b"
        cmd = (f'summon wither_skull ~{x:.2f} ~{y:.2f} ~{z:.2f} '
               f'{{dangerous:{dang_str},Tags:["{tag}"],Motion:[{mx},{my},{mz}],acceleration_power:[{ax}d,{ay}d,{az}d],power:[{mx},{my},{mz}]}}')
        lines.append(cmd)
        
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write('\n'.join(lines) + '\n')

# Phase 1: 12 rings, altitude from 64 down to 28, radius alternating or expanding/contracting
for r in range(1, 13):
    alt = 64.0 - (r - 1) * 3.2
    # radius varies between 2.5 and 8.5
    rad = 2.5 + 6.0 * math.sin((r - 1) * math.pi / 5.0)
    gen_phase_ring('phase1', r, alt, rad, is_dangerous=False, tag="wither_norm")

# Phase 3: 12 rings of blue heads
for r in range(1, 13):
    alt = 64.0 - (r - 1) * 3.2
    rad = 2.5 + 6.0 * math.sin((r - 1) * math.pi / 5.0)
    gen_phase_ring('phase3', r, alt, rad, is_dangerous=True, tag="blue_bomb")

# Phase 2: 3 doubles (d1, d2, d3), each with 12 rings.
# In d1, we include both blue wither skulls AND powerful fireballs (large_fireball with ExplosionPower:6b)
# To avoid skull-fireball collisions on spawn, fireballs spawn at alt + 2.5 above the skulls!
for d in range(1, 4):
    folder = f'phase2'
    os.makedirs(os.path.join(base_dir, folder), exist_ok=True)
    for r in range(1, 13):
        file_path = os.path.join(base_dir, folder, f'd{d}_ring_{r}.mcfunction')
        alt = 64.0 - (r - 1) * 3.2
        rad = 3.0 + 7.0 * math.sin((r - 1) * math.pi / 5.0)
        
        lines = [f'# Double {d} Ring {r}/12 — Altitude ~{alt:.1f}, Radius {rad:.1f}']
        for i in range(8):
            angle = 2 * math.pi * i / 8.0
            x = rad * math.cos(angle)
            z = rad * math.sin(angle)
            y_skull = alt + (0.4 if i % 2 == 0 else -0.4)
            
            mx = round(0.005 * x, 4)
            mz = round(0.005 * z, 4)
            my = -1.35
            ax = round(0.0005 * x, 5)
            az = round(0.0005 * z, 5)
            ay = -0.135
            
            # Skull
            cmd_skull = (f'summon wither_skull ~{x:.2f} ~{y_skull:.2f} ~{z:.2f} '
                         f'{{dangerous:1b,Tags:["blue_bomb"],Motion:[{mx},{my},{mz}],acceleration_power:[{ax}d,{ay}d,{az}d],power:[{mx},{my},{mz}]}}')
            lines.append(cmd_skull)
            
            # If d == 1, also summon powerful piercing fireballs higher up (~3.5 blocks above skulls)
            if d == 1:
                y_fb = y_skull + 3.5
                cmd_fb = (f'summon fireball ~{x:.2f} ~{y_fb:.2f} ~{z:.2f} '
                          f'{{ExplosionPower:6b,Tags:["blue_fireball"],Motion:[{mx},{my},{mz}],acceleration_power:[{ax}d,{ay}d,{az}d],power:[{mx},{my},{mz}]}}')
                lines.append(cmd_fb)
                
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write('\n'.join(lines) + '\n')

print("All WitherShot rings generated cleanly without mid-air collision overlap and with proper acceleration_power!")
