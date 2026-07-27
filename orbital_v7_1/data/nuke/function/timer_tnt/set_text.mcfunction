# Макрос вызывается РАЗ В СЕКУНДУ на заряд — дешёво и надёжно.
# Контекст: as <text_display tt_text>.
# Причина макроса: компонент {score:{name:"@s"}} в text_display НЕ разрешается
# (у дисплея нет командного контекста) — именно поэтому число было пустым.
$data modify entity @s text set value [{text:"ТАЙМЕР-ТНТ: ",color:"red",bold:true},{text:"$(sec)",color:"yellow",bold:true},{text:" сек",color:"red",bold:true}]
