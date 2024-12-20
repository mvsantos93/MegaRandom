extends Node

@onready var btns = $Buttons
@onready var database = $Database

@warning_ignore("unused_variable")
var current_anim = "app_start"
var next_anim

func _ready():
	sr_opponent_field()
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
	else:
		$AnimationPlayer.queue("sr_generate")
		current_anim = "sr_generate"

func _on_sr_regen_button_pressed():
	pass #gerar os resultados de novo

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
	var field_type = 'random'
	if btns.sr_field_type_btn2.button_pressed == true: field_type = 'single_class'
	elif btns.sr_field_type_btn3.button_pressed == true: field_type = 'multi2_class'
	elif btns.sr_field_type_btn4.button_pressed == true: field_type = 'multi3_class'
	elif btns.sr_field_type_btn5.button_pressed == true: field_type = 'multi4_class'
	elif btns.sr_field_type_btn6.button_pressed == true: field_type = 'multi5_class'
	else: field_type = 'random'

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
	
	return [field_type, classes_choosed]
	
func sr_race_length():
	var race_length = 'random'
	if btns.sr_race_length_btn2.button_pressed == true: race_length = 'minimum'
	elif btns.sr_race_length_btn3.button_pressed == true: race_length = 'short'
	elif btns.sr_race_length_btn4.button_pressed == true: race_length = 'medium'
	elif btns.sr_race_length_btn5.button_pressed == true: race_length = 'long'
	elif btns.sr_race_length_btn6.button_pressed == true: race_length = 'endurance random'
	elif btns.sr_race_length_btn7.button_pressed == true: race_length = 'endurance short'
	elif btns.sr_race_length_btn8.button_pressed == true: race_length = 'endurance medium'
	elif btns.sr_race_length_btn9.button_pressed == true: race_length = 'endurance long'
	elif btns.sr_race_length_btn10.button_pressed == true: race_length = 'are you crazy'
	else: race_length = 'random'
	
	return race_length

func sr_time_period_progression():
	var time_period = 'random'
	if btns.sr_time_period_btn2.button_pressed == true: time_period = 'day'
	elif btns.sr_time_period_btn3.button_pressed == true: time_period = 'night'
	else: time_period = 'random'
	
	var time_progression = 'random'
	if btns.sr_time_progression_btn2.button_pressed == true: time_progression = 'daylight only'
	elif btns.sr_time_progression_btn3.button_pressed == true: time_progression = 'nighttime only'
	elif btns.sr_time_progression_btn4.button_pressed == true: time_progression = '3h race'
	elif btns.sr_time_progression_btn5.button_pressed == true: time_progression = '6h race'
	elif btns.sr_time_progression_btn6.button_pressed == true: time_progression = '12h race'
	elif btns.sr_time_progression_btn7.button_pressed == true: time_progression = '24h race'
	elif btns.sr_time_progression_btn8.button_pressed == true: time_progression = '36h race'
	elif btns.sr_time_progression_btn9.button_pressed == true: time_progression = '48h race'
	else: time_progression = 'random'
	
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
