# Advancement используется только для немедленного revoke.
# Проверка клика выполняется через interaction.player в safe/tick, чтобы один
# ПКМ не обрабатывался одновременно двумя независимыми механизмами.
advancement revoke @s only mosseater:safe_interact
