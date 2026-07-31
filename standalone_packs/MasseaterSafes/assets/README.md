# MasseaterSafes — ресурспак для ключей сейфов

Папка `assets` копируется ЦЕЛИКОМ в корень вашего ресурспака, рядом с `pack.mcmeta`.
Если у вас уже есть свой `assets`, просто добавьте внутрь подпапку `mosseater` —
конфликтов с ванильными файлами нет, всё лежит в собственном namespace.

## Структура

```
assets/
└── mosseater/
    ├── items/
    │   ├── safe_key.json            ← определение модели предмета (1.21.4+)
    │   └── safe_key_active.json
    ├── models/item/
    │   ├── safe_key.json            ← модель, ссылается на текстуру
    │   └── safe_key_active.json
    └── textures/item/
        ├── safe_key.png             ← ВАША ТЕКСТУРА (создать самому)
        └── safe_key_active.png      ← ВАША ТЕКСТУРА (создать самому)
```

## Куда класть текстуры

```
assets/mosseater/textures/item/safe_key.png
assets/mosseater/textures/item/safe_key_active.png
```

Размер 16x16 PNG с прозрачным фоном. Больше ничего править не нужно:
JSON-файлы уже ссылаются на эти имена.

## pack.mcmeta ресурспака для 1.21.11

Если делаете отдельный ресурспак, рядом с `assets` положите файл `pack.mcmeta`:

```json
{
  "pack": {
    "description": "MasseaterSafes Keys",
    "pack_format": 75
  }
}
```

## Как это работает

Ключи сейфов выдаются с компонентом `minecraft:item_model`:

| Предмет | Компонент | Модель |
|---------|-----------|--------|
| Болванка Ключа | `minecraft:item_model="mosseater:safe_key"` | `items/safe_key.json` |
| Активный ключ | `minecraft:item_model="mosseater:safe_key_active"` | `items/safe_key_active.json` |

Обычный `minecraft:tripwire_hook` этого компонента не имеет и выглядит ванильно.
Числовой `custom_model_data` с предикатами в модели сундука в 1.21.11 НЕ используется:
механизм `overrides` удалён, вместо него модель адресуется напрямую по id.

## Важно

Ресурспак влияет только на внешний вид. Логика замка сравнивает тип предмета,
`minecraft:custom_data` и `minecraft:custom_name`, поэтому игроки без ресурспака
пользуются сейфами абсолютно так же, просто видят обычный крюк.
