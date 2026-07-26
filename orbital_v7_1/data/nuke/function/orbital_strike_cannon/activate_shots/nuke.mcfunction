# activate_shots/nuke вЂ” РџРћР›РќР«Р™ СЂРµС„РµСЂРµРЅСЃРЅС‹Р№ Р“Р РР‘ (cinematic_nuke, 5875 РўРќРў)
# + РљР РђРўР•Р  (nuke_power_3, 1956 РўРќРў, fuse РёСЃРїСЂР°РІР»РµРЅ 60->200 РґР»СЏ РіР°СЂР°РЅС‚РёРё РїСЂРёР·РµРјР»РµРЅРёСЏ).
# РРЅС‚РµСЂР»РёРІРёРЅРі 3:1 вЂ” РїРѕСЃР»Рµ РєР°Р¶РґС‹С… 3 РІРѕР»РЅ РіСЂРёР±Р° РёРґС‘С‚ 1 РІРѕР»РЅР° РєСЂР°С‚РµСЂР°, С‡С‚РѕР±С‹ РѕР±Р° СЌС„С„РµРєС‚Р°
# РїСЂРѕРёСЃС…РѕРґРёР»Рё РїР°СЂР°Р»Р»РµР»СЊРЅРѕ РїРѕ РІСЃРµРјСѓ С€РѕСѓ, Р±РµР· СЂР°Р·СЂС‹РІР° РјРµР¶РґСѓ 'РіСЂРёР± Р·Р°РєРѕРЅС‡РёР»СЃСЏ, РєСЂР°С‚РµСЂ РµС‰С‘ РЅРµ РЅР°С‡Р°Р»СЃСЏ'.
# 160 РІРѕР»РЅ РїРѕ ~49 РўРќРў, СЃРїР°РІРЅ СЂР°СЃС‚СЏРЅСѓС‚ РЅР° 318 С‚РёРєРѕРІ (~16 СЃРµРє), С€Р°Рі 2 С‚РёРєР° РјРµР¶РґСѓ РІРѕР»РЅР°РјРё.
scoreboard players add @s nukeshot_timer 1

# Blast (СѓСЂРѕРЅ РїРѕ РёРіСЂРѕРєР°Рј) вЂ” РѕРґРёРЅ СЂР°Р· РЅР° С‚РёРєРµ 20
execute if score @s nukeshot_timer matches 20 at @s run function nuke:orbital_strike_cannon/nukeshot_wx/blast_nuke_core

# РћРїС†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡РµСЂРµРїР° РІРёР·РµСЂР° РґР»СЏ РїСЂРѕР±РёС‚РёСЏ РѕР±СЃРёРґРёР°РЅР° (РІС‹РєР». РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ)
execute if score @s nukeshot_timer matches 20 if score nuke.cfg.wither nuke.settings matches 1 at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_wither

execute if score @s nukeshot_timer matches 20 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w0
execute if score @s nukeshot_timer matches 22 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w1
execute if score @s nukeshot_timer matches 24 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w2
execute if score @s nukeshot_timer matches 26 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w3
execute if score @s nukeshot_timer matches 28 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w4
execute if score @s nukeshot_timer matches 30 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w5
execute if score @s nukeshot_timer matches 32 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w6
execute if score @s nukeshot_timer matches 34 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w7
execute if score @s nukeshot_timer matches 36 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w8
execute if score @s nukeshot_timer matches 38 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w9
execute if score @s nukeshot_timer matches 40 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w10
execute if score @s nukeshot_timer matches 42 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w11
execute if score @s nukeshot_timer matches 44 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w12
execute if score @s nukeshot_timer matches 46 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w13
execute if score @s nukeshot_timer matches 48 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w14
execute if score @s nukeshot_timer matches 50 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w15
execute if score @s nukeshot_timer matches 52 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w16
execute if score @s nukeshot_timer matches 54 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w17
execute if score @s nukeshot_timer matches 56 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w18
execute if score @s nukeshot_timer matches 58 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w19
execute if score @s nukeshot_timer matches 60 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w20
execute if score @s nukeshot_timer matches 62 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w21
execute if score @s nukeshot_timer matches 64 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w22
execute if score @s nukeshot_timer matches 66 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w23
execute if score @s nukeshot_timer matches 68 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w24
execute if score @s nukeshot_timer matches 70 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w25
execute if score @s nukeshot_timer matches 72 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w26
execute if score @s nukeshot_timer matches 74 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w27
execute if score @s nukeshot_timer matches 76 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w28
execute if score @s nukeshot_timer matches 78 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w29
execute if score @s nukeshot_timer matches 80 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w30
execute if score @s nukeshot_timer matches 82 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w31
execute if score @s nukeshot_timer matches 84 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w32
execute if score @s nukeshot_timer matches 86 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w33
execute if score @s nukeshot_timer matches 88 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w34
execute if score @s nukeshot_timer matches 90 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w35
execute if score @s nukeshot_timer matches 92 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w36
execute if score @s nukeshot_timer matches 94 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w37
execute if score @s nukeshot_timer matches 96 if score @s nuke.power matches 1.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w38
execute if score @s nukeshot_timer matches 98 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w39
execute if score @s nukeshot_timer matches 100 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w40
execute if score @s nukeshot_timer matches 102 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w41
execute if score @s nukeshot_timer matches 104 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w42
execute if score @s nukeshot_timer matches 106 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w43
execute if score @s nukeshot_timer matches 108 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w44
execute if score @s nukeshot_timer matches 110 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w45
execute if score @s nukeshot_timer matches 112 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w46
execute if score @s nukeshot_timer matches 114 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w47
execute if score @s nukeshot_timer matches 116 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w48
execute if score @s nukeshot_timer matches 118 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w49
execute if score @s nukeshot_timer matches 120 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w50
execute if score @s nukeshot_timer matches 122 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w51
execute if score @s nukeshot_timer matches 124 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w52
execute if score @s nukeshot_timer matches 126 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w53
execute if score @s nukeshot_timer matches 128 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w54
execute if score @s nukeshot_timer matches 130 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w55
execute if score @s nukeshot_timer matches 132 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w56
execute if score @s nukeshot_timer matches 134 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w57
execute if score @s nukeshot_timer matches 136 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w58
execute if score @s nukeshot_timer matches 138 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w59
execute if score @s nukeshot_timer matches 140 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w60
execute if score @s nukeshot_timer matches 142 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w61
execute if score @s nukeshot_timer matches 144 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w62
execute if score @s nukeshot_timer matches 146 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w63
execute if score @s nukeshot_timer matches 148 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w64
execute if score @s nukeshot_timer matches 150 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w65
execute if score @s nukeshot_timer matches 152 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w66
execute if score @s nukeshot_timer matches 154 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w67
execute if score @s nukeshot_timer matches 156 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w68
execute if score @s nukeshot_timer matches 158 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w69
execute if score @s nukeshot_timer matches 160 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w70
execute if score @s nukeshot_timer matches 162 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w71
execute if score @s nukeshot_timer matches 164 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w72
execute if score @s nukeshot_timer matches 166 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w73
execute if score @s nukeshot_timer matches 168 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w74
execute if score @s nukeshot_timer matches 170 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w75
execute if score @s nukeshot_timer matches 172 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w76
execute if score @s nukeshot_timer matches 174 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w77
execute if score @s nukeshot_timer matches 176 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w78
execute if score @s nukeshot_timer matches 178 if score @s nuke.power matches 2.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w79
execute if score @s nukeshot_timer matches 180 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w80
execute if score @s nukeshot_timer matches 182 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w81
execute if score @s nukeshot_timer matches 184 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w82
execute if score @s nukeshot_timer matches 186 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w83
execute if score @s nukeshot_timer matches 188 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w84
execute if score @s nukeshot_timer matches 190 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w85
execute if score @s nukeshot_timer matches 192 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w86
execute if score @s nukeshot_timer matches 194 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w87
execute if score @s nukeshot_timer matches 196 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w88
execute if score @s nukeshot_timer matches 198 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w89
execute if score @s nukeshot_timer matches 200 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w90
execute if score @s nukeshot_timer matches 202 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w91
execute if score @s nukeshot_timer matches 204 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w92
execute if score @s nukeshot_timer matches 206 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w93
execute if score @s nukeshot_timer matches 208 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w94
execute if score @s nukeshot_timer matches 210 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w95
execute if score @s nukeshot_timer matches 212 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w96
execute if score @s nukeshot_timer matches 214 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w97
execute if score @s nukeshot_timer matches 216 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w98
execute if score @s nukeshot_timer matches 218 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w99
execute if score @s nukeshot_timer matches 220 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w100
execute if score @s nukeshot_timer matches 222 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w101
execute if score @s nukeshot_timer matches 224 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w102
execute if score @s nukeshot_timer matches 226 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w103
execute if score @s nukeshot_timer matches 228 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w104
execute if score @s nukeshot_timer matches 230 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w105
execute if score @s nukeshot_timer matches 232 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w106
execute if score @s nukeshot_timer matches 234 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w107
execute if score @s nukeshot_timer matches 236 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w108
execute if score @s nukeshot_timer matches 238 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w109
execute if score @s nukeshot_timer matches 240 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w110
execute if score @s nukeshot_timer matches 242 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w111
execute if score @s nukeshot_timer matches 244 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w112
execute if score @s nukeshot_timer matches 246 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w113
execute if score @s nukeshot_timer matches 248 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w114
execute if score @s nukeshot_timer matches 250 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w115
execute if score @s nukeshot_timer matches 252 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w116
execute if score @s nukeshot_timer matches 254 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w117
execute if score @s nukeshot_timer matches 256 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w118
execute if score @s nukeshot_timer matches 258 if score @s nuke.power matches 3.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w119
execute if score @s nukeshot_timer matches 260 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w120
execute if score @s nukeshot_timer matches 262 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w121
execute if score @s nukeshot_timer matches 264 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w122
execute if score @s nukeshot_timer matches 266 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w123
execute if score @s nukeshot_timer matches 268 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w124
execute if score @s nukeshot_timer matches 270 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w125
execute if score @s nukeshot_timer matches 272 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w126
execute if score @s nukeshot_timer matches 274 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w127
execute if score @s nukeshot_timer matches 276 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w128
execute if score @s nukeshot_timer matches 278 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w129
execute if score @s nukeshot_timer matches 280 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w130
execute if score @s nukeshot_timer matches 282 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w131
execute if score @s nukeshot_timer matches 284 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w132
execute if score @s nukeshot_timer matches 286 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w133
execute if score @s nukeshot_timer matches 288 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w134
execute if score @s nukeshot_timer matches 290 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w135
execute if score @s nukeshot_timer matches 292 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w136
execute if score @s nukeshot_timer matches 294 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w137
execute if score @s nukeshot_timer matches 296 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w138
execute if score @s nukeshot_timer matches 298 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w139
execute if score @s nukeshot_timer matches 300 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w140
execute if score @s nukeshot_timer matches 302 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w141
execute if score @s nukeshot_timer matches 304 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w142
execute if score @s nukeshot_timer matches 306 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w143
execute if score @s nukeshot_timer matches 308 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w144
execute if score @s nukeshot_timer matches 310 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w145
execute if score @s nukeshot_timer matches 312 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w146
execute if score @s nukeshot_timer matches 314 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w147
execute if score @s nukeshot_timer matches 316 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w148
execute if score @s nukeshot_timer matches 318 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w149
execute if score @s nukeshot_timer matches 320 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w150
execute if score @s nukeshot_timer matches 322 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w151
execute if score @s nukeshot_timer matches 324 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w152
execute if score @s nukeshot_timer matches 326 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w153
execute if score @s nukeshot_timer matches 328 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w154
execute if score @s nukeshot_timer matches 330 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w155
execute if score @s nukeshot_timer matches 332 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w156
execute if score @s nukeshot_timer matches 334 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w157
execute if score @s nukeshot_timer matches 336 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w158
execute if score @s nukeshot_timer matches 338 if score @s nuke.power matches 4.. at @s run function nuke:orbital_strike_cannon/nukeshot_wx/nukeshot_w159

# РџРѕСЃР»РµРґРЅСЏСЏ РІРѕР»РЅР° СЃРїР°РІРЅРёС‚СЃСЏ РЅР° С‚РёРєРµ 338. РЎР°РјС‹Р№ РґРѕР»РіРёР№ fuse вЂ” 200 (РєСЂР°С‚РµСЂ).
# Р”РµСЂР¶РёРј block_display (Р·Р°С‰РёС‚Р° РѕС‚ РїРѕРІС‚РѕСЂРЅРѕРіРѕ РІС‹СЃС‚СЂРµР»Р°) Р¶РёРІС‹Рј РґРѕ С‚РёРєР° 548.
execute if score @s nuke.power matches 1 if score @s nukeshot_timer matches 300.. at @s run kill @e[type=area_effect_cloud,tag=nukeshot_owner,distance=..1]
execute if score @s nuke.power matches 2 if score @s nukeshot_timer matches 420.. at @s run kill @e[type=area_effect_cloud,tag=nukeshot_owner,distance=..1]
execute if score @s nuke.power matches 3 if score @s nukeshot_timer matches 500.. at @s run kill @e[type=area_effect_cloud,tag=nukeshot_owner,distance=..1]
execute if score @s nuke.power matches 4 if score @s nukeshot_timer matches 548.. at @s run kill @e[type=area_effect_cloud,tag=nukeshot_owner,distance=..1]
execute if score @s nuke.power matches 1 if score @s nukeshot_timer matches 300.. run kill @s
execute if score @s nuke.power matches 2 if score @s nukeshot_timer matches 420.. run kill @s
execute if score @s nuke.power matches 3 if score @s nukeshot_timer matches 500.. run kill @s
execute if score @s nuke.power matches 4 if score @s nukeshot_timer matches 548.. run kill @s

# Visual Overhaul: NukeShot power aura & blast ring
execute if score @s nuke.power matches 1.. at @s run particle flame ~ ~ ~ 0.6 0.6 0.6 0.05 4
execute if score @s nukeshot_timer matches 19 at @s run particle sonic_boom ~ ~ ~ 1 0 1 0 1
