$execute if entity @p[distance=..6] if items entity @p weapon.mainhand tripwire_hook[custom_name='$(password)'] run data modify entity @s width set value 0.0f
$execute if entity @p[distance=..6] if items entity @p weapon.mainhand tripwire_hook[custom_name='$(password)'] run data modify entity @s height set value 0.0f

$execute unless entity @a[distance=..6,nbt={Inventory:[{id:"minecraft:tripwire_hook",tag:{display:{Name:'$(password)'}}}]}] run data modify entity @s width set value 1.05f
$execute unless entity @a[distance=..6,nbt={Inventory:[{id:"minecraft:tripwire_hook",tag:{display:{Name:'$(password)'}}}]}] run data modify entity @s height set value 1.1f
