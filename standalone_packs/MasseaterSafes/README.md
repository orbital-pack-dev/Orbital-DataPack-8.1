# MasseaterS — Standalone Password Safes

> Автономный дата-пак системы сейфов с паролем для сервера Masseater.
> Неймспейс: `mosseater`. Версия игры: **Minecraft 1.21.11** (`pack_format 75`).
> Полностью независим от основного пака `Orbital DataPack 8.1` — не использует ни одного его скорборда, тега, диалога или предмета.

## Установка

1. Скопируйте папку `MasseaterSafes` в `<мир>/datapacks/`.
2. Выполните `/reload`.
3. Рецепт «Сундук с Паролем» выдаётся игрокам автоматически при входе.

## Как это работает

| Шаг | Что происходит |
|---|---|
| 1 | Игрок крафтит **Сундук с Паролем** (8 железных самородков + сундук). |
| 2 | При установке срабатывает достижение `mosseater:safe_placed` → рейкаст находит сундук и открывает диалог `mosseater:safe_setup`. |
| 3 | Кнопка «Создать Ключ» выдаёт **Болванку Ключа** (tripwire hook). Её нужно переименовать в наковальне. |
| 4 | Клик болванкой по сундуку записывает пароль в `minecraft:lock`, болванка становится **активным ключом**. |
| 5 | Пока игрок ближе 4 блоков — хитбокс убирается, сундук открывается ключом. |
| 6 | Как только игрок отошёл дальше 4 блоков — `mosseater:safe/auto_lock` возвращает замок и заново ставит `interaction`. |

## Ключевые функции

| Функция | Назначение |
|---|---|
| `mosseater:load` | Создание скорбордов и дефолтов конфигурации. |
| `mosseater:tick` | Корневой тик пака. |
| `mosseater:safe/place` | Спавн `interaction` поверх сундука: `width 1.1f`, `height 1.4f`, смещение Y `-0.2` (двойной сундук — `width 2.2f`). |
| `mosseater:safe/auto_lock` | Автозапечатывание при отходе игрока дальше 4 блоков. |
| `mosseater:safe/tick` | Автономная тиковая проверка всех сейфов. |
| `mosseater:safe/ensure_interaction` | Восстановление и нормализация хитбокса. |
| `mosseater:safe/break_merge` | Запрет склейки сейфа в двойной сундук. |
| `mosseater:give/safe_chest` | Выдать Сундук с Паролем. |
| `mosseater:give/safe_key_blank` | Выдать Болванку Ключа. |

## Скорборды

| Объектив | Тип | Назначение |
|---|---|---|
| `mosseater.safe_config` | dummy | Глобальная конфигурация: `#lock_distance` (4), `#raycast_steps` (40), `#ready`. |
| `mosseater.safe_data` | dummy | Рабочие данные игрока (счётчик шагов рейкаста). |
| `mosseater.safe_key` | trigger | Кнопка диалога «Создать Ключ». |
| `mosseater.safe_cancel` | trigger | Кнопка диалога «Оставить открытым». |

> Объективы типа `trigger` не могут быть держателями внутри dummy-объектива — поэтому две кнопки диалога вынесены в отдельные триггеры того же неймспейса `mosseater.*`.

## Изоляция от основного пака

| Сущность | Orbital DataPack 8.1 | MasseaterS |
|---|---|---|
| Неймспейс | `nuke` | `mosseater` |
| Теги сущностей | `safe_box`, `safe_shield`, `safe_guard`, … | `ms_safe_box`, `ms_safe_shield`, `ms_safe_guard`, … |
| custom_data | `safe_box`, `nuke_key_blank`, `nuke_key_active` | `mosseater_safe`, `mosseater_key_blank`, `mosseater_key_active` |
| Storage | `nuke:safe` | `mosseater:safe` |
| Триггеры | `t_safe_key`, `t_safe_cancel` | `mosseater.safe_key`, `mosseater.safe_cancel` |

Благодаря разным тегам и custom_data оба пака могут стоять на одном мире одновременно и не конфликтовать (совпадёт только форма крафта — при одновременной установке оставьте один из рецептов).

## Поддержка

Телеграм-бот поддержки сервера: **[@mosseater_server_bot](https://t.me/mosseater_server_bot)**
