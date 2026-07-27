# Macro runs once per second and writes the number as literal text.
$data modify entity @s text set value {text:"ТАЙМЕР-ТНТ: $(sec) сек",color:"red",bold:true}
