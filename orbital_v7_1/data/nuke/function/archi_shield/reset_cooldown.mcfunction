# ARCHI-SHIELD RESET COOLDOWN (No CD mechanic)
# Replace item in slot with itself to immediately clear the disabled/cooldown state.
# Called when player takes a hit.
execute if items entity @s weapon.offhand shield[custom_data~{archi_shield:1b}] run item replace entity @s weapon.offhand from entity @s weapon.offhand
execute if items entity @s weapon.offhand shield[custom_data~{archi_shield:1}] run item replace entity @s weapon.offhand from entity @s weapon.offhand
execute if items entity @s weapon.mainhand shield[custom_data~{archi_shield:1b}] run item replace entity @s weapon.mainhand from entity @s weapon.mainhand
execute if items entity @s weapon.mainhand shield[custom_data~{archi_shield:1}] run item replace entity @s weapon.mainhand from entity @s weapon.mainhand

