extends Node

@onready var btns = $Buttons
@onready var database = $Database

var current_anim = "app_start"
var next_anim

func _ready():
	$AnimationPlayer.play(current_anim)

#SINGLE RACE BUTTONS AND ANIMATIONS
func _on_singlerace_button_pressed():
	if current_anim == "singlerace_start": pass
	elif current_anim != "app_start":
		$AnimationPlayer.play_backwards(current_anim)
		$AnimationPlayer.queue("singlerace_start")
		current_anim = "singlerace_start"
	else:
		$AnimationPlayer.queue("singlerace_start")
		current_anim = "singlerace_start"

func _on_dlc_button_pressed():
	if current_anim == "dlc_config": pass
	elif current_anim != "app_start":
		$AnimationPlayer.play_backwards(current_anim)
		$AnimationPlayer.queue("dlc_config")
		current_anim = "dlc_config"
	else:
		$AnimationPlayer.queue("dlc_config")
		current_anim = "dlc_config"

func _on_mods_button_pressed():
	if current_anim == "mods": pass
	elif current_anim != "app_start":
		$AnimationPlayer.play_backwards(current_anim)
		$AnimationPlayer.queue("mods")
		current_anim = "mods"
	else:
		$AnimationPlayer.queue("mods")
		current_anim = "mods"

func _on_support_pressed():
	if current_anim == "support": pass
	elif current_anim != "app_start":
		$AnimationPlayer.play_backwards(current_anim)
		$AnimationPlayer.queue("support")
		current_anim = "support"
	else:
		$AnimationPlayer.queue("support")
		current_anim = "support"



func _on_srgenerate_button_pressed():
	if current_anim != "app_start":
		$AnimationPlayer.play_backwards(current_anim)
		$AnimationPlayer.queue("sr_generate")
		current_anim = "sr_generate"
		sr_confirm()
	else:
		$AnimationPlayer.queue("sr_generate")
		current_anim = "sr_generate"
		sr_confirm()

func _on_sr_regen_button_pressed(): sr_confirm()

func _on_sr_back_button_pressed(): _on_singlerace_button_pressed()



func _on_dlc_confirm_button_pressed(): $dlc_config_screen/dlc_panel/dlc_settings/dlc_confirmed.visible = true

func _on_mod_1_button_pressed(): OS.shell_open("https://www.overtake.gg/downloads/for-the-win-career-mode-for-ams-2.63157/")

func _on_mod_2_button_pressed(): OS.shell_open("https://www.overtake.gg/downloads/fantasy-f1-2026-skinpack.65829/")

func _on_mod_3_button_pressed(): OS.shell_open("https://www.paypal.com/donate/?hosted_button_id=TCR5PPH765UNN")

func _on_donate_button_pressed(): OS.shell_open("https://www.paypal.com/donate/?hosted_button_id=TCR5PPH765UNN")



func _on_sr_opponentfield_button_pressed():
	if current_anim == "sr_opponent_field":
		$AnimationPlayer.play_backwards(current_anim)
		current_anim = "singlerace_start"
		$single_race_screen/Control/singlerace_panel1/change_button/change_label.text = "CHANGE"
	elif current_anim != "singlerace_start":
		$AnimationPlayer.play_backwards(current_anim)
		$AnimationPlayer.queue("sr_opponent_field")
		current_anim = "sr_opponent_field"
		$single_race_screen/Control/singlerace_panel1/change_button/change_label.text = "CONFIRM"
	else:
		$AnimationPlayer.queue("sr_opponent_field")
		current_anim = "sr_opponent_field"
		$single_race_screen/Control/singlerace_panel1/change_button/change_label.text = "CONFIRM"

func _on_sr_racelength_button_pressed():
	if current_anim == "sr_race_length":
		$AnimationPlayer.play_backwards(current_anim)
		current_anim = "singlerace_start"
		$single_race_screen/Control/singlerace_panel2/change_button/change_label.text = "CHANGE"
	elif current_anim != "singlerace_start":
		$AnimationPlayer.play_backwards(current_anim)
		$AnimationPlayer.queue("sr_race_length")
		current_anim = "sr_race_length"
		$single_race_screen/Control/singlerace_panel2/change_button/change_label.text = "CONFIRM"
	else:
		$AnimationPlayer.queue("sr_race_length")
		current_anim = "sr_race_length"
		$single_race_screen/Control/singlerace_panel2/change_button/change_label.text = "CONFIRM"

func _on_sr_timeperiod_button_pressed():
	if current_anim == "sr_time_period":
		$AnimationPlayer.play_backwards(current_anim)
		current_anim = "singlerace_start"
		$single_race_screen/Control/singlerace_panel3/change_button/change_label.text = "CHANGE"
	elif current_anim != "singlerace_start":
		$AnimationPlayer.play_backwards(current_anim)
		$AnimationPlayer.queue("sr_time_period")
		current_anim = "sr_time_period"
		$single_race_screen/Control/singlerace_panel3/change_button/change_label.text = "CONFIRM"
	else:
		$AnimationPlayer.queue("sr_time_period")
		current_anim = "sr_time_period"
		$single_race_screen/Control/singlerace_panel3/change_button/change_label.text = "CONFIRM"

func _on_sr_weather_button_pressed():
	if current_anim == "sr_weather":
		$AnimationPlayer.play_backwards(current_anim)
		current_anim = "singlerace_start"
		$single_race_screen/Control/singlerace_panel4/change_button/change_label.text = "CHANGE"
	elif current_anim != "singlerace_start":
		$AnimationPlayer.play_backwards(current_anim)
		$AnimationPlayer.queue("sr_weather")
		current_anim = "sr_weather"
		$single_race_screen/Control/singlerace_panel4/change_button/change_label.text = "CONFIRM"
	else:
		$AnimationPlayer.queue("sr_weather")
		current_anim = "sr_weather"
		$single_race_screen/Control/singlerace_panel4/change_button/change_label.text = "CONFIRM"

func _on_sr_starttype_button_pressed():
	if current_anim == "sr_start_type":
		$AnimationPlayer.play_backwards(current_anim)
		current_anim = "singlerace_start"
		$single_race_screen/Control/singlerace_panel5/change_button/change_label.text = "CHANGE"
	elif current_anim != "singlerace_start":
		$AnimationPlayer.play_backwards(current_anim)
		$AnimationPlayer.queue("sr_start_type")
		current_anim = "sr_start_type"
		$single_race_screen/Control/singlerace_panel5/change_button/change_label.text = "CONFIRM"
	else:
		$AnimationPlayer.queue("sr_start_type")
		current_anim = "sr_start_type"
		$single_race_screen/Control/singlerace_panel5/change_button/change_label.text = "CONFIRM"

func _on_sr_pitstop_button_pressed():
	if current_anim == "sr_mandatory_pitstop":
		$AnimationPlayer.play_backwards(current_anim)
		current_anim = "singlerace_start"
		$single_race_screen/Control/singlerace_panel6/change_button/change_label.text = "CHANGE"
	elif current_anim != "singlerace_start":
		$AnimationPlayer.play_backwards(current_anim)
		$AnimationPlayer.queue("sr_mandatory_pitstop")
		current_anim = "sr_mandatory_pitstop"
		$single_race_screen/Control/singlerace_panel6/change_button/change_label.text = "CONFIRM"
	else:
		$AnimationPlayer.queue("sr_mandatory_pitstop")
		current_anim = "sr_mandatory_pitstop"
		$single_race_screen/Control/singlerace_panel6/change_button/change_label.text = "CONFIRM"

func _on_sr_tirefuel_button_pressed():
	if current_anim == "sr_tire_fuel":
		$AnimationPlayer.play_backwards(current_anim)
		current_anim = "singlerace_start"
		$single_race_screen/Control/singlerace_panel7/change_button/change_label.text = "CHANGE"
	elif current_anim != "singlerace_start":
		$AnimationPlayer.play_backwards(current_anim)
		$AnimationPlayer.queue("sr_tire_fuel")
		current_anim = "sr_tire_fuel"
		$single_race_screen/Control/singlerace_panel7/change_button/change_label.text = "CONFIRM"
	else:
		$AnimationPlayer.queue("sr_tire_fuel")
		current_anim = "sr_tire_fuel"
		$single_race_screen/Control/singlerace_panel7/change_button/change_label.text = "CONFIRM"

func _on_sr_fcy_button_pressed():
	if current_anim == "sr_fcy":
		$AnimationPlayer.play_backwards(current_anim)
		current_anim = "singlerace_start"
		$single_race_screen/Control/singlerace_panel8/change_button/change_label.text = "CHANGE"
	elif current_anim != "singlerace_start":
		$AnimationPlayer.play_backwards(current_anim)
		$AnimationPlayer.queue("sr_fcy")
		current_anim = "sr_fcy"
		$single_race_screen/Control/singlerace_panel8/change_button/change_label.text = "CONFIRM"
	else:
		$AnimationPlayer.queue("sr_fcy")
		current_anim = "sr_fcy"
		$single_race_screen/Control/singlerace_panel8/change_button/change_label.text = "CONFIRM"

func _on_sr_sfcy_button_pressed():
	if current_anim == "sr_sfcy":
		$AnimationPlayer.play_backwards(current_anim)
		current_anim = "singlerace_start"
		$single_race_screen/Control/singlerace_panel9/change_button/change_label.text = "CHANGE"
	elif current_anim != "singlerace_start":
		$AnimationPlayer.play_backwards(current_anim)
		$AnimationPlayer.queue("sr_sfcy")
		current_anim = "sr_sfcy"
		$single_race_screen/Control/singlerace_panel9/change_button/change_label.text = "CONFIRM"
	else:
		$AnimationPlayer.queue("sr_sfcy")
		current_anim = "sr_sfcy"
		$single_race_screen/Control/singlerace_panel9/change_button/change_label.text = "CONFIRM"


#SINGLE RACE LOGIC
func sr_opponent_field():
	var field_type = 'single_class'
	if btns.sr_field_type_btn2.button_pressed == true: field_type = 'single_class'
	elif btns.sr_field_type_btn3.button_pressed == true: field_type = 'multi2_class'
	elif btns.sr_field_type_btn4.button_pressed == true: field_type = 'multi3_class'
	elif btns.sr_field_type_btn5.button_pressed == true: field_type = 'multi4_class'
	elif btns.sr_field_type_btn6.button_pressed == true: field_type = 'multi5_class'
	else:
		#Não esquecer de mudar o nome da opção para 'random'
		field_type = ['single_class', 'multi2_class', 'multi3_class', 'multi4_class', 'multi5_class'].pick_random()
		

	var classes_choosed = []
	if btns.sr_field_type_check1.button_pressed == true: for x in database.caterhams: classes_choosed.append(x)
	if btns.sr_field_type_check2.button_pressed == true: for x in database.fclassic: classes_choosed.append(x)
	if btns.sr_field_type_check3.button_pressed == true: for x in database.fmodern: classes_choosed.append(x)
	if btns.sr_field_type_check4.button_pressed == true: for x in database.fretro: classes_choosed.append(x)
	if btns.sr_field_type_check5.button_pressed == true: for x in database.fv10: classes_choosed.append(x)
	if btns.sr_field_type_check6.button_pressed == true: for x in database.fvintage: classes_choosed.append(x)
	if btns.sr_field_type_check7.button_pressed == true: for x in database.gthistorical: classes_choosed.append(x)
	if btns.sr_field_type_check8.button_pressed == true: for x in database.gtmodern: classes_choosed.append(x)
	if btns.sr_field_type_check9.button_pressed == true: for x in database.kart: classes_choosed.append(x)
	if btns.sr_field_type_check10.button_pressed == true: for x in database.prototypes: classes_choosed.append(x)
	if btns.sr_field_type_check11.button_pressed == true: for x in database.rally: classes_choosed.append(x)
	if btns.sr_field_type_check12.button_pressed == true: for x in database.stockhistorical: classes_choosed.append(x)
	if btns.sr_field_type_check13.button_pressed == true: for x in database.stockmodern: classes_choosed.append(x)
	if btns.sr_field_type_check14.button_pressed == true: for x in database.street: classes_choosed.append(x)
	if btns.sr_field_type_check15.button_pressed == true: for x in database.touringhistoric: classes_choosed.append(x)
	if btns.sr_field_type_check16.button_pressed == true: for x in database.touringmodern: classes_choosed.append(x)
	if not classes_choosed:
		for x in database.caterhams: classes_choosed.append(x)
		for x in database.fclassic: classes_choosed.append(x)
		for x in database.fmodern: classes_choosed.append(x)
		for x in database.fretro: classes_choosed.append(x)
		for x in database.fv10: classes_choosed.append(x)
		for x in database.fvintage: classes_choosed.append(x)
		for x in database.gthistorical: classes_choosed.append(x)
		for x in database.gtmodern: classes_choosed.append(x)
		for x in database.kart: classes_choosed.append(x)
		for x in database.prototypes: classes_choosed.append(x)
		for x in database.rally: classes_choosed.append(x)
		for x in database.stockhistorical: classes_choosed.append(x)
		for x in database.stockmodern: classes_choosed.append(x)
		for x in database.street: classes_choosed.append(x)
		for x in database.touringhistoric: classes_choosed.append(x)
		for x in database.touringmodern: classes_choosed.append(x)
	classes_choosed.shuffle()
	
	return [field_type, classes_choosed]
	
func sr_race_length():
	var race_length = 'random'
	#Não esquecer de mudar os textos com as opções
	if btns.sr_race_length_btn2.button_pressed == true: race_length = 'minimum'
	elif btns.sr_race_length_btn3.button_pressed == true: race_length = 'short'
	elif btns.sr_race_length_btn4.button_pressed == true: race_length = 'medium'
	elif btns.sr_race_length_btn5.button_pressed == true: race_length = 'long'
	elif btns.sr_race_length_btn6.button_pressed == true:
		#não esquecer de mudar o texto para 'ENDURANCE RANDOM'
		race_length = ['endurance short', 'endurance medium', 'endurance long'].pick_random()
	elif btns.sr_race_length_btn7.button_pressed == true: race_length = 'endurance short'
	elif btns.sr_race_length_btn8.button_pressed == true: race_length = 'endurance medium'
	elif btns.sr_race_length_btn9.button_pressed == true: race_length = 'endurance long'
	elif btns.sr_race_length_btn10.button_pressed == true: race_length = 'are you crazy'
	else:
		#não esquecer de mudar o testo para RANDOM
		race_length = ['minimum', 'short', 'medium', 'long', 'endurance short', 'endurance medium', 'endurance long', 'are you crazy'].pick_random()
	
	return race_length

func sr_time_period_progression():
	var time_period = 'random'
	#Não esquecer de mudar o texto
	if btns.sr_time_period_btn2.button_pressed == true: time_period = 'day'
	elif btns.sr_time_period_btn3.button_pressed == true: time_period = 'night'
	else: time_period = ['day', 'night'].pick_random()
	
	#Não esquecer de mudar o texto
	var time_progression = 'random'
	if btns.sr_time_progression_btn2.button_pressed == true: time_progression = 'daylight only'
	elif btns.sr_time_progression_btn3.button_pressed == true: time_progression = 'nighttime only'
	elif btns.sr_time_progression_btn4.button_pressed == true: time_progression = '3h race'
	elif btns.sr_time_progression_btn5.button_pressed == true: time_progression = '6h race'
	elif btns.sr_time_progression_btn6.button_pressed == true: time_progression = '12h race'
	elif btns.sr_time_progression_btn7.button_pressed == true: time_progression = '24h race'
	elif btns.sr_time_progression_btn8.button_pressed == true: time_progression = '36h race'
	elif btns.sr_time_progression_btn9.button_pressed == true: time_progression = '48h race'
	else: time_progression = ['daylight only', 'nighttime only', '3h race', '6h race', '12h race', '24h race', '36h race', '48h race'].pick_random()
	
	return [time_period, time_progression]

func sr_weather():
	var weather_conditions = 'random'
	if btns.sr_weather_btn2.button_pressed == true: weather_conditions = 'allow rain'
	elif btns.sr_weather_btn3.button_pressed == true: weather_conditions = 'no rain'
	elif btns.sr_weather_btn4.button_pressed == true: weather_conditions = 'only rain'
	else: weather_conditions = 'random'
	
	var weather_slots = 'random'
	if btns.sr_weather_slot_btn2.button_pressed == true: weather_conditions = '1x slot'
	elif btns.sr_weather_slot_btn3.button_pressed == true: weather_conditions = '2x slots'
	elif btns.sr_weather_slot_btn4.button_pressed == true: weather_conditions = '3x slots'
	elif btns.sr_weather_slot_btn5.button_pressed == true: weather_conditions = '4x slots'
	else: weather_slots = 'random'
	
	return [weather_conditions, weather_slots]

func sr_start_type():
	var start_type = 'random'
	if btns.sr_start_type_btn2.button_pressed == true: start_type = 'standing'
	elif btns.sr_start_type_btn3.button_pressed == true: start_type = 'rolling'
	else: start_type = 'random'
	
	return start_type 

func sr_mandatory_pitstop():
	var mandatory_pitstop = 'random'
	if btns.sr_mandatory_pitstop_btn2.button_pressed == true: mandatory_pitstop = 'no pitstop'
	elif btns.sr_mandatory_pitstop_btn3.button_pressed == true: mandatory_pitstop = 'pitstop no tires'
	elif btns.sr_mandatory_pitstop_btn4.button_pressed == true: mandatory_pitstop = 'pitstop 2 tires'
	elif btns.sr_mandatory_pitstop_btn5.button_pressed == true: mandatory_pitstop = 'pitstop 4 tires'
	else: mandatory_pitstop = 'random'
	
	return mandatory_pitstop

func sr_tire_fuel():
	var tire_wear = 'random'
	if btns.sr_tire_btn2.button_pressed == true: tire_wear = 'authentic'
	elif btns.sr_tire_btn3.button_pressed == true: tire_wear = 'no tire wear'
	elif btns.sr_tire_btn4.button_pressed == true: tire_wear = '2x tire wear'
	elif btns.sr_tire_btn5.button_pressed == true: tire_wear = '3x tire wear'
	elif btns.sr_tire_btn6.button_pressed == true: tire_wear = '4x tire wear'
	elif btns.sr_tire_btn7.button_pressed == true: tire_wear = '5x tire wear'
	else: tire_wear = 'random'
	
	var fuel_usage = 'random'
	if btns.sr_fuel_btn2.button_pressed == true: fuel_usage = 'real usage'
	elif btns.sr_fuel_btn3.button_pressed == true: fuel_usage = 'real usage'
	elif btns.sr_fuel_btn4.button_pressed == true: fuel_usage = 'real usage'
	elif btns.sr_fuel_btn5.button_pressed == true: fuel_usage = 'real usage'
	elif btns.sr_fuel_btn6.button_pressed == true: fuel_usage = 'real usage'
	elif btns.sr_fuel_btn7.button_pressed == true: fuel_usage = 'real usage'
	else: fuel_usage = 'random'
	
	return [tire_wear, fuel_usage]

func sr_fcy():
	var fcy = 'random'
	if btns.sr_fcy_btn2.button_pressed == true: fcy = 'no fcy'
	elif btns.sr_fcy_btn2.button_pressed == true: fcy = 'with fcy'
	else: fcy = 'random'
	
	return fcy

func sr_sfcy():
	var sfcy = 'random'
	if btns.sr_sfcy_btn2.button_pressed == true: sfcy = 'no sfcy'
	elif btns.sr_sfcy_btn3.button_pressed == true: sfcy = '75% sfcy'
	elif btns.sr_sfcy_btn4.button_pressed == true: sfcy = '50% sfcy'
	elif btns.sr_sfcy_btn5.button_pressed == true: sfcy = '25% sfcy'
	else: sfcy = 'random'
	
	return sfcy

func sr_confirm():
	class_check(sr_opponent_field())
	var race_length = sr_race_length()
	progression_check(sr_time_period_progression(), race_length)
	#var weather = sr_weather()
	#var start_type = sr_start_type()
	#var pitstop = sr_mandatory_pitstop()
	#var tire_fuel = sr_tire_fuel()
	#var fcy = sr_fcy()
	#var sfcy = sr_sfcy()



func class_check(opponent_field):
	randomize()
	var class_null = database.class_null
	var field_type = opponent_field[0]
	var classes = opponent_field[1]
	
	#decide how many classes are available to choose
	var class_count = 0
	for x in classes:
		class_count +=1
		if field_type == 'single_class': break
		elif field_type == 'multi2_class' and class_count >= 2: break
		elif field_type == 'multi3_class' and class_count >= 3: break
		elif field_type == 'multi4_class' and class_count >= 4: break
		elif field_type == 'multi5_class' and class_count >= 5: break
		else: continue
	
	#decide NORMAL, KART or RALLY
	var motorsport = randi_range(1,10)
	if motorsport <= 8: motorsport = 'normal'
	else:
		for x in classes:
			if x in database.kart:
				motorsport = 'kart'
				break
			elif x in database.rally:
				motorsport = 'rally'
				break
			else: motorsport = 'normal'
	
	#Choose all the classes
	var classes_choosed = [class_null, class_null, class_null, class_null, class_null]
	while class_count > 0:
		var current_class = classes.pick_random()
		if current_class in classes_choosed: continue
		else:
			classes_choosed[class_count-1] = current_class
			class_count -= 1
	
	#Apply the results
	$single_race_screen/Control/srgen_panel/srgen_settings/class_img1.texture = load(classes_choosed[0])
	$single_race_screen/Control/srgen_panel/srgen_settings/class_img2.texture = load(classes_choosed[1])
	$single_race_screen/Control/srgen_panel/srgen_settings/class_img3.texture = load(classes_choosed[2])
	$single_race_screen/Control/srgen_panel/srgen_settings/class_img4.texture = load(classes_choosed[3])
	$single_race_screen/Control/srgen_panel/srgen_settings/class_img5.texture = load(classes_choosed[4])

func progression_check(time_period, race_length):
	var race_length_text = $single_race_screen/Control/srgen_panel/srgen_settings/srgen_racelength
	if race_length == 'minimum': race_length_text.text = '-  5 minutes race length'
	elif race_length == 'short': race_length_text.text = '-  ' + database.short_length.pick_random() + ' race length'
	elif race_length == 'medium': race_length_text.text = '-  ' + database.medium_length.pick_random() + ' race length'
	elif race_length == 'long': race_length_text.text = '-  ' + database.long_length.pick_random() + ' race length'
	elif race_length == 'endurance short': race_length_text.text = '-  ' + database.short_enduro.pick_random() + ' race length'
	elif race_length == 'endurance medium': race_length_text.text = '-  ' + database.medium_enduro.pick_random() + ' race length'
	elif race_length == 'endurance long': race_length_text.text = '-  ' + database.long_enduro.pick_random() + ' race length'
	elif race_length == 'are you crazy': race_length_text.text = '-  ' + database.crazy_length.pick_random() + ' race length'

	var start_time_text = $single_race_screen/Control/srgen_panel/srgen_settings/srgen_starttime
	var time_progression_text = $single_race_screen/Control/srgen_panel/srgen_settings/srgen_timeprogress
	if time_period[1] == 'daylight only': time_period[0] = 'day'
	elif time_period[1] == 'nighttime only': time_period[0] = 'night'
	elif time_period[1] == '3h race': pass
	elif time_period[1] == '6h race': pass
	elif time_period[1] == '12h race': pass
	elif time_period[1] == '24h race': pass
	elif time_period[1] == '36h race': pass
	elif time_period[1] == '48h race': pass
