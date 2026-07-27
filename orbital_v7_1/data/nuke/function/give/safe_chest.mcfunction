# СЕЙФ. Ключевое: компонент minecraft:lock переходит на блок ПРИ УСТАНОВКЕ,
# поэтому сейф заперт СРАЗУ и не зависит от того, создался ли маркер.
give @s minecraft:chest[custom_data={safe_box:true},item_name='{"text":"Сундук с Паролем","color":"gold","italic":false}',lore=['{"text":"Открывается только ключом","color":"gray","italic":false}'],lock={items:"minecraft:tripwire_hook",predicates:{"minecraft:custom_data":{nuke_key_active:true}}}] 1
