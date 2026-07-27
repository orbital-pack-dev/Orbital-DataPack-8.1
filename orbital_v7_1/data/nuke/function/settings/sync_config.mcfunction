# ЗАДАЧА 1 — ЕДИНАЯ ПРИВЯЗКА НАСТРОЕК К ГЛОБАЛЬНЫМ ФЛАГАМ.
# Раньше значения из меню оставались только в nuke.settings и до логики
# не доходили. Теперь после каждой обработки триггеров все флаги
# зеркалируются в nuke.config (и в старые глобальные объективы).

# Тумблер Орбитального комплекса: значение по умолчанию — ВКЛ.
execute unless score #orbital_enabled nuke.config matches 0.. run scoreboard players set #orbital_enabled nuke.config 1

# Флаги-переключатели.
scoreboard players operation #block_protection nuke.config = block_protection nuke.settings
scoreboard players operation #orbital_nerf nuke.config = orbital_nerf nuke.settings
scoreboard players operation #personal_cd nuke.config = personal_cd nuke.settings
scoreboard players operation #vip nuke.config = nuke.cfg.vip nuke.settings
scoreboard players operation #wither_skulls nuke.config = nuke.cfg.wither nuke.settings

# Числовые настройки.
scoreboard players operation #stab_cd nuke.config = nuke.cfg.stab_cd nuke.settings
scoreboard players operation #nuke_cd nuke.config = nuke.cfg.nuke_cd nuke.settings
scoreboard players operation #wither_cd nuke.config = nuke.cfg.wither_cd nuke.settings
scoreboard players operation #mortar_cd nuke.config = nuke.cfg.mortar_cd nuke.settings
scoreboard players operation #archi_cd nuke.config = nuke.cfg.archi_cd nuke.settings
scoreboard players operation #bv_time nuke.config = nuke.cfg.bv_time nuke.settings
scoreboard players operation #tt_scale nuke.config = nuke.cfg.tt_scale nuke.settings

# Обратная совместимость: старые глобальные объективы, которые читают модули.
scoreboard players operation global block_protection = block_protection nuke.settings
scoreboard players operation global orbital_nerf = orbital_nerf nuke.settings
scoreboard players operation global personal_cd = personal_cd nuke.settings

# Масштаб времени Таймер-ТНТ теперь реально применяется при установке заряда.
execute if score nuke.cfg.tt_scale nuke.settings matches 1.. run scoreboard players operation #tt_scale nuke.settings = nuke.cfg.tt_scale nuke.settings
