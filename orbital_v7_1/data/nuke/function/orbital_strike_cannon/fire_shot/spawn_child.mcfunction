# ORBITAL MORTAR - SPAWN CHILD ROCKETS (every 2s / ticks 40,80,120,160,200,240,280)
# Fixed: hardcoded world-space Motion instead of unreliable world-origin marker trick.
# 3 rockets fan out in East / West / North directions from the main rocket.

# Child 1 — East (+X)
execute at @s run summon firework_rocket ~1.5 ~ ~ {LifeTime:40,Motion:[0.5d,0.2d,0.0d],Tags:["orbital_child"],FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"small_ball",colors:[I;16755200,16711680],has_trail:1b,has_twinkle:1b}]}}}}
scoreboard players set @e[type=firework_rocket,tag=orbital_child,scores={orb_lifetime=..0}] orb_lifetime 0

# Child 2 — West (-X)
execute at @s run summon firework_rocket ~-1.5 ~ ~ {LifeTime:40,Motion:[-0.5d,0.2d,0.0d],Tags:["orbital_child"],FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"small_ball",colors:[I;16755200,16711680],has_trail:1b,has_twinkle:1b}]}}}}
scoreboard players set @e[type=firework_rocket,tag=orbital_child,scores={orb_lifetime=..0}] orb_lifetime 0

# Child 3 — North (-Z)
execute at @s run summon firework_rocket ~ ~ ~-1.5 {LifeTime:40,Motion:[0.0d,0.2d,-0.5d],Tags:["orbital_child"],FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"small_ball",colors:[I;16755200,16711680],has_trail:1b,has_twinkle:1b}]}}}}
scoreboard players set @e[type=firework_rocket,tag=orbital_child,scores={orb_lifetime=..0}] orb_lifetime 0
