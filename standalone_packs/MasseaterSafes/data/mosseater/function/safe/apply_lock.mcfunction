# Совместимый вход для legacy-вызовов. Требуется storage key.password.
execute unless data storage mosseater:safe key.password run return 0

execute align xyz run data merge block ~ ~ ~ {Lock:"SAFE_LOCKED"}
