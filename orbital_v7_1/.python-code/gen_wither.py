import os, math

base_dir = r"c:\Users\1\AppData\Roaming\ModrinthApp\profiles\Cozy Modpack by remkkic\saves\Nuke-проверка\datapacks\orbital_v7_1\data\nuke\function\orbital_strike_cannon\wither_shot"

for p in ['phase1', 'phase2', 'phase3', 'phase4']:
    os.makedirs(os.path.join(base_dir, p), exist_ok=True)

R_sphere = 18.0
altitude = 45.0
speed = 1.35

def get_ring_commands(ring_idx, skull_type, add_fireballs=False):
    phi = math.pi * (ring_idx + 0.5) / 12.0
    Y_off = R_sphere * math.cos(phi)
    r_ring = R_sphere * math.sin(phi)
    Y_spawn = altitude + Y_off
    
    cmds = []
    cmds.append(f"# Ring {ring_idx + 1}/12 — Altitude ~{Y_spawn:.1f}, Radius {r_ring:.1f}")
    
    num_skulls = 8
    for j in range(num_skulls):
        alpha = 2.0 * math.pi * j / num_skulls
        X_spawn = r_ring * math.cos(alpha)
        Z_spawn = r_ring * math.sin(alpha)
        
        dx = -X_spawn
        dy = -Y_spawn
        dz = -Z_spawn
        dist = math.sqrt(dx*dx + dy*dy + dz*dz)
        
        mx = round(speed * (dx / dist), 3)
        my = round(speed * (dy / dist), 3)
        mz = round(speed * (dz / dist), 3)
        
        ax = round(0.1 * mx, 4)
        ay = round(0.1 * my, 4)
        az = round(0.1 * mz, 4)
        
        xs = round(X_spawn, 2)
        ys = round(Y_spawn, 2)
        zs = round(Z_spawn, 2)
        
        if skull_type == "normal":
            cmds.append(f'summon wither_skull ~{xs} ~{ys} ~{zs} {{dangerous:0b,Tags:["wither_norm"],Motion:[{mx},{my},{mz}],power:[{mx},{my},{mz}]}}')
        elif skull_type == "blue":
            cmds.append(f'summon wither_skull ~{xs} ~{ys} ~{zs} {{dangerous:1b,Tags:["blue_bomb"],Motion:[{mx},{my},{mz}],acceleration_power:[{ax}d,{ay}d,{az}d],power:[{mx},{my},{mz}]}}')
            if add_fireballs:
                cmds.append(f'summon small_fireball ~{xs} ~{ys} ~{zs} {{ExplosionPower:4b,Tags:["blue_fireball"],Motion:[{mx},{my},{mz}],power:[{mx},{my},{mz}]}}')
    return cmds

# Phase 1
for i in range(12):
    lines = get_ring_commands(i, 'normal', False)
    fp = os.path.join(base_dir, 'phase1', f'ring_{i+1}.mcfunction')
    with open(fp, 'w', encoding='utf-8', newline='\n') as f:
        f.write('\n'.join(lines) + '\n')

# Phase 2
for i in range(12):
    lines = get_ring_commands(i, 'blue', True)
    fp = os.path.join(base_dir, 'phase2', f'd1_ring_{i+1}.mcfunction')
    with open(fp, 'w', encoding='utf-8', newline='\n') as f:
        f.write('\n'.join(lines) + '\n')

for i in range(12):
    lines = get_ring_commands(i, 'blue', False)
    fp = os.path.join(base_dir, 'phase2', f'd2_ring_{i+1}.mcfunction')
    with open(fp, 'w', encoding='utf-8', newline='\n') as f:
        f.write('\n'.join(lines) + '\n')

for i in range(12):
    lines = get_ring_commands(i, 'blue', False)
    fp = os.path.join(base_dir, 'phase2', f'd3_ring_{i+1}.mcfunction')
    with open(fp, 'w', encoding='utf-8', newline='\n') as f:
        f.write('\n'.join(lines) + '\n')

# Phase 3
for i in range(12):
    lines = get_ring_commands(i, 'blue', False)
    fp = os.path.join(base_dir, 'phase3', f'ring_{i+1}.mcfunction')
    with open(fp, 'w', encoding='utf-8', newline='\n') as f:
        f.write('\n'.join(lines) + '\n')

print("All ring files generated successfully.")
