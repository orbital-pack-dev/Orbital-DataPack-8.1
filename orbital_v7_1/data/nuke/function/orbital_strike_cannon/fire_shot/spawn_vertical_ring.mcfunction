# ORBITAL MORTAR - VERTICAL RING / HALO (Phase 12s / 240 ticks)
# Fixed: 8 rockets directly spawned with world-space Motion — no spinner recursion, no world-origin trick.
# Vertical circle in the Y-Z plane, radius = 1.5 blocks.

# Top
execute at @s run summon firework_rocket ~0 ~1.5 ~0 {LifeTime:35,Motion:[0.0d,0.5d,0.0d],Tags:["orbital_child"],FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;16711680,16755200],has_trail:1b,has_twinkle:1b}]}}}}
# Top-North (45°)
execute at @s run summon firework_rocket ~0 ~1.061 ~-1.061 {LifeTime:35,Motion:[0.0d,0.354d,-0.354d],Tags:["orbital_child"],FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;16711680,16755200],has_trail:1b,has_twinkle:1b}]}}}}
# North (90°)
execute at @s run summon firework_rocket ~0 ~0 ~-1.5 {LifeTime:35,Motion:[0.0d,0.0d,-0.5d],Tags:["orbital_child"],FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;16711680,16755200],has_trail:1b,has_twinkle:1b}]}}}}
# Bottom-North (135°)
execute at @s run summon firework_rocket ~0 ~-1.061 ~-1.061 {LifeTime:35,Motion:[0.0d,-0.354d,-0.354d],Tags:["orbital_child"],FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;16711680,16755200],has_trail:1b,has_twinkle:1b}]}}}}
# Bottom (180°)
execute at @s run summon firework_rocket ~0 ~-1.5 ~0 {LifeTime:35,Motion:[0.0d,-0.5d,0.0d],Tags:["orbital_child"],FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;16711680,16755200],has_trail:1b,has_twinkle:1b}]}}}}
# Bottom-South (225°)
execute at @s run summon firework_rocket ~0 ~-1.061 ~1.061 {LifeTime:35,Motion:[0.0d,-0.354d,0.354d],Tags:["orbital_child"],FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;16711680,16755200],has_trail:1b,has_twinkle:1b}]}}}}
# South (270°)
execute at @s run summon firework_rocket ~0 ~0 ~1.5 {LifeTime:35,Motion:[0.0d,0.0d,0.5d],Tags:["orbital_child"],FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;16711680,16755200],has_trail:1b,has_twinkle:1b}]}}}}
# Top-South (315°)
execute at @s run summon firework_rocket ~0 ~1.061 ~1.061 {LifeTime:35,Motion:[0.0d,0.354d,0.354d],Tags:["orbital_child"],FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;16711680,16755200],has_trail:1b,has_twinkle:1b}]}}}}
