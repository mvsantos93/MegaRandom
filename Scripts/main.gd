extends Node

@onready var btns = $Buttons
@onready var database = $Database
@onready var tracksdb = $"Tracks Database"

var current_anim = "app_start"
var next_anim

func _ready():
	$AnimationPlayer.play(current_anim)

#SINGLE RACE BUTTONS AND ANIMATIONS
func _on_singlerace_button_pressed():
	#desativar Rally se não houver a DLC
	if $dlc_config_screen/dlc_panel/dlc_settings/dlc10.button_pressed == false:
		$single_race_screen/Control/singlerace_panel1/fieldtype_settings/ftsettings_label2/ftsettings1_radio11.set_disabled(true)
		$single_race_screen/Control/singlerace_panel1/fieldtype_settings/ftsettings_label2/ftsettings1_radio11.button_pressed = false
	else:
		$single_race_screen/Control/singlerace_panel1/fieldtype_settings/ftsettings_label2/ftsettings1_radio11.set_disabled(false)
		$single_race_screen/Control/singlerace_panel1/fieldtype_settings/ftsettings_label2/ftsettings1_radio11.button_pressed = true

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

func _on_mod_3_button_pressed(): OS.shell_open("https://www.overtake.gg/downloads/f1-mega-skinpack-20-new-brands.74612/")

func _on_donate_button_pressed(): OS.shell_open("https://www.paypal.com/donate/?hosted_button_id=TCR5PPH765UNN")



func _on_sr_opponentfield_button_pressed():
	if current_anim == "sr_opponent_field":
		$AnimationPlayer.play_backwards(current_anim)
		current_anim = "singlerace_start"
		$single_race_screen/Control/singlerace_panel1/change_button/change_label.text = "CHANGE"
		var option_text = $single_race_screen/Control/singlerace_panel1/fieldtypeoption_label
		var options = sr_opponent_field()
		if $single_race_screen/Control/singlerace_panel1/fieldtype_settings/ftsettings_label1/ftsettings1_radio1.button_pressed == true:
			option_text.text = 'RANDOM CLASSES'
		elif options[0] == 'single_class': option_text.text = 'SINGLE CLASS'
		elif options[0] == 'multi2_class': option_text.text = '2x MULTICLASS'
		elif options[0] == 'multi3_class': option_text.text = '3x MULTICLASS'
		elif options[0] == 'multi4_class': option_text.text = '4x MULTICLASS'
		elif options[0] == 'multi5_class': option_text.text = '5x MULTICLASS'
		
		var classes_choosed = []
		var option2_text = ''
		if btns.sr_field_type_check1.button_pressed == true:
			option2_text = option_text.text + '  -  CATERHAMS ONLY'
			classes_choosed.append('caterhams')
		if btns.sr_field_type_check2.button_pressed == true:
			option2_text = option_text.text + '  -  F.CLASSICS ONLY'
			classes_choosed.append('fclassics')
		if btns.sr_field_type_check3.button_pressed == true:
			option2_text = option_text.text + '  -  F.MODERN ONLY'
			classes_choosed.append('fmodern')
		if btns.sr_field_type_check4.button_pressed == true:
			option2_text = option_text.text + '  -  F.RETROS ONLY'
			classes_choosed.append('fretro')
		if btns.sr_field_type_check5.button_pressed == true:
			option2_text = option_text.text + '  -  F.V10s ONLY'
			classes_choosed.append('fv10')
		if btns.sr_field_type_check6.button_pressed == true:
			option2_text = option_text.text + '  -  F.VINTAGES ONLY'
			classes_choosed.append('fvintage')
		if btns.sr_field_type_check7.button_pressed == true:
			option2_text = option_text.text + '  -  HISTORICAL GT ONLY'
			classes_choosed.append('hgt')
		if btns.sr_field_type_check8.button_pressed == true:
			option2_text = option_text.text + '  -  MODERN GT ONLY'
			classes_choosed.append('mgt')
		if btns.sr_field_type_check9.button_pressed == true:
			option2_text = option_text.text + '  -  KARTS ONLY'
			classes_choosed.append('karts')
		if btns.sr_field_type_check10.button_pressed == true:
			option2_text = option_text.text + '  -  PROTOTYPES ONLY'
			classes_choosed.append('prototypes')
		if btns.sr_field_type_check11.button_pressed == true:
			option2_text = option_text.text + '  -  RALLY ONLY'
			classes_choosed.append('rally')
		if btns.sr_field_type_check12.button_pressed == true:
			option2_text = option_text.text + '  -  HISTORICAL STOCK CARS ONLY'
			classes_choosed.append('hstock')
		if btns.sr_field_type_check13.button_pressed == true:
			option2_text = option_text.text + '  -  MODERN STOCK CARS ONLY'
			classes_choosed.append('mstock')
		if btns.sr_field_type_check14.button_pressed == true:
			option2_text = option_text.text + '  -  STREET-SUPER-HYPER CARS ONLY'
			classes_choosed.append('ssh')
		if btns.sr_field_type_check15.button_pressed == true:
			option2_text = option_text.text + '  -  HISTORICAL TOURING ONLY'
			classes_choosed.append('htouring')
		if btns.sr_field_type_check16.button_pressed == true:
			option2_text = option_text.text + '  -  MODERN TOURING ONLY'
			classes_choosed.append('mtouring')
		
		var classes_choosed_count = 0
		for x in classes_choosed:
			classes_choosed_count +=1
		if classes_choosed_count == 16 or classes_choosed_count <=0: option_text.text += '  -  ALL OPTIONS'
		elif classes_choosed_count >= 2: option_text.text += '  -  MULTIPLE OPTIONS'
		else: option_text.text = option2_text
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
		var options_text = $single_race_screen/Control/singlerace_panel2/racelengthoption_label
		var options = sr_race_length()
		if $single_race_screen/Control/singlerace_panel2/racelength_settings/rlsettings_label1/rlsettings1_radio1.button_pressed == true:
			options_text.text = 'RANDOM DURATION'
		elif options == 'minimum': options_text.text = 'MINIMUM (5 MINUTES)'
		elif options == 'short': options_text.text = 'SHORT (10 TO 20 MINUTES)'
		elif options == 'medium': options_text.text = 'MEDIUM (25 TO 40 MINUTES)'
		elif options == 'long': options_text.text = 'LONG (45 MINUTES TO 1H)'
		elif $single_race_screen/Control/singlerace_panel2/racelength_settings/rlsettings_label1/rlsettings1_radio6.button_pressed == true:
			options_text.text = 'ENDURANCE RANDOM (1h15 TO 5H20)'
		elif options == 'endurance short': options_text.text = 'ENDURANCE SHORT (1H TO 1H35)'
		elif options == 'endurance medium': options_text.text = 'ENDURANCE MEDIUM (1H40 TO 2H50)'
		elif options == 'endurance long': options_text.text = 'ENDURANCE LONG (3H TO 5H20)'
		elif options == 'are you crazy': options_text.text = 'ARE YOU CRAZY? (5H25 TO 7H)'
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
		var option_text = $single_race_screen/Control/singlerace_panel3/timeperiodoption_label
		var options = sr_time_period_progression()
		var option1_text= ""
		var option2_text= ""
		
		if $single_race_screen/Control/singlerace_panel3/timeperiod_settings/tpsettings_label1/rlsettings1_radio1.button_pressed == true:
			option1_text = "RANDOM PERIOD  -"
		elif options[0] == 'day': option1_text = 'DAYTIME START  -'
		elif options[0] == 'night': option1_text = 'NIGHTTIME START  -'
		
		if $single_race_screen/Control/singlerace_panel3/timeperiod_settings/tpsettings_label2/tpsettings1_radio1.button_pressed == true:
			option2_text = "  RANDOM PROGRESSION"
		elif options[1] == 'daylight only': option2_text = "  RACE ONLY AT DAYLIGHT"
		elif options[1] == 'nighttime only': option2_text = "  RACE ONLY AT NIGHTTIME"
		elif options[1] == '3h race': option2_text = "  SIMULATE A 3 HOURS RACE"
		elif options[1] == '6h race': option2_text = "  SIMULATE A 6 HOURS RACE"
		elif options[1] == '12h race': option2_text = "  SIMULATE A 12 HOURS RACE"
		elif options[1] == '24h race': option2_text = "  SIMULATE A 24 HOURS RACE"
		elif options[1] == '36h race': option2_text = "  SIMULATE A 36 HOURS RACE"
		elif options[1] == '48h race': option2_text = "  SIMULATE A 48 HOURS RACE"
		option_text.text = option1_text + option2_text
		
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
		
		var option_text = $single_race_screen/Control/singlerace_panel4/weatheroption_label
		var options = sr_weather()
		var option1_text= ""
		var option2_text= ""
		
		if $single_race_screen/Control/singlerace_panel4/weather_settings/wsettings_label1/wsettings1_radio1.button_pressed == true:
			option1_text = "RANDOM WEATHER  -"
		elif options[0] == 'allow rain': option1_text = "ALLOW RAINING WEATHERS  -"
		elif options[0] == 'no rain': option1_text = "REMOVE RAINING WEATHERS  -"
		elif options[0] == 'only rain': option1_text = "ONLY RAINING WEATHERS  -"
		
		if $single_race_screen/Control/singlerace_panel4/weather_settings/wsettings_label2/wsettings1_radio1.button_pressed == true:
			option2_text = "  RANDOM SLOTS"
		elif options[1] == '1x slot': option2_text = "  1x SLOT"
		elif options[1] == '2x slots': option2_text = "  2x SLOTS"
		elif options[1] == '3x slots': option2_text = "  3x SLOTS"
		elif options[1] == '4x slots': option2_text = "  4x SLOTS"

		option_text.text = option1_text + option2_text
		
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
		
		var option_text = $single_race_screen/Control/singlerace_panel5/starttypeoption_label
		var options = sr_start_type()
		if $single_race_screen/Control/singlerace_panel5/starttype_settings/wsettings_label1/stsettings1_radio1.button_pressed == true:
			option_text.text = "RANDOM START"
		elif options == 'standing': option_text.text = "STANDING START"
		elif options == 'rolling': option_text.text = "ROLLING START"
		
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
		
		var option_text = $single_race_screen/Control/singlerace_panel6/pitstopoption_label
		var options = sr_mandatory_pitstop()
		
		if $single_race_screen/Control/singlerace_panel6/pitstop_settings/pssettings_label1/pssettings1_radio1.button_pressed == true:
			option_text.text = "RANDOM PITSTOP"
		elif options == 'no pitstop': option_text.text = "NO MANDATORY PITSTOP"
		elif options == 'pitstop no tires': option_text.text = "MANDATORY PITSTOP  -  NO TIRES CHANGE"
		elif options == 'pitstop 2 tires': option_text.text = "MANDATORY PITSTOP  -  2 TIRES CHANGE"
		elif options == 'pitstop 4 tires': option_text.text = "MANDATORY PITSTOP  -  4 TIRES CHANGE"
		
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
		
		var options_text = $single_race_screen/Control/singlerace_panel7/tirewearoption_label
		var options = sr_tire_fuel()
		var option1_text = ""
		var option2_text = ""
		
		if $single_race_screen/Control/singlerace_panel7/tirefuel_settings/tfsettings_label1/tfsettings1_radio1.button_pressed == true:
			option1_text = "RANDOM TIRE WEAR  -"
		elif options[0] == 'authentic': option1_text = "AUTHENTIC TIRE WEAR  -"
		elif options[0] == 'no tire wear': option1_text = "NO TIRE WEAR  -"
		elif options[0] == '2x tire wear': option1_text = "2X TIRE WEAR  -"
		elif options[0] == '3x tire wear': option1_text = "3X TIRE WEAR  -"
		elif options[0] == '4x tire wear': option1_text = "4X TIRE WEAR  -"
		elif options[0] == '5x tire wear': option1_text = "5X TIRE WEAR  -"
		
		if $single_race_screen/Control/singlerace_panel7/tirefuel_settings/tfsettings_label2/tfsettings2_radio1.button_pressed == true:
			option2_text = "  RANDOM FUEL USAGE"
		elif options[1] == 'real fuel usage': option2_text = "  REAL FUEL USAGE"
		elif options[1] == 'no usage': option2_text = "  NO FUEL USAGE"
		elif options[1] == '2x fuel usage': option2_text = "  2X FUEL USAGE"
		elif options[1] == '3x fuel usage': option2_text = "  3X FUEL USAGE"
		elif options[1] == '4x fuel usage': option2_text = "  4X FUEL USAGE"
		elif options[1] == '5x fuel usage': option2_text = "  5X FUEL USAGE"
		
		options_text.text = option1_text + option2_text
		
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
		
		var options_text = $single_race_screen/Control/singlerace_panel8/fcyoption_label
		var options = sr_fcy()
		
		if $single_race_screen/Control/singlerace_panel8/fcy_settings/fcysettings_label1/fcysettings1_radio1.button_pressed == true:
			options_text.text = "RANDOM"
		elif options == "no fcy": options_text.text = "NO FULL COURSE YELLOWS"
		elif options == "with fcy": options_text.text = "ALLOW FULL COURSE YELLOWS"
		
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
		
		var options_text = $single_race_screen/Control/singlerace_panel9/sfcyoption_label
		var options = sr_sfcy()
		
		if $single_race_screen/Control/singlerace_panel9/sfcy_settings/sfcysettings_label1/sfcysettings1_radio1.button_pressed == true:
			options_text.text = "RANDOM"
		elif options == 'no sfcy': options_text.text = "NO SCHEDULED FCY"
		elif options == '75% sfcy': options_text.text = "AT 75% OF THE RACE"
		elif options == '50% sfcy': options_text.text = "AT 50% OF THE RACE"
		elif options == '25% sfcy': options_text.text = "AT 25% OF THE RACE"
		
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
		field_type = ['single_class', 'multi2_class', 'multi3_class', 'multi4_class', 'multi5_class'].pick_random()
	
	
	var classes_choosed = []
	if btns.sr_field_type_check1.button_pressed == true: for x in database.caterhams: classes_choosed.append(x)
	if btns.sr_field_type_check2.button_pressed == true:
		for x in database.fclassic:
			if 'class29' in x or 'class30' in x or 'class31' in x:
				if $dlc_config_screen/dlc_panel/dlc_settings/dlc4.button_pressed == false: continue
				else: classes_choosed.append(x)
			if 'class12' in x or 'class13' in x:
				if $dlc_config_screen/dlc_panel/dlc_settings/dlc14.button_pressed == false: continue
				else: classes_choosed.append(x)
			else: classes_choosed.append(x)
	if btns.sr_field_type_check3.button_pressed == true:
		for x in database.fmodern:
			if 'class28' in x:
				if $dlc_config_screen/dlc_panel/dlc_settings/dlc6.button_pressed == false: continue
				else: classes_choosed.append(x)
			else: classes_choosed.append(x)
	if btns.sr_field_type_check4.button_pressed == true: for x in database.fretro: classes_choosed.append(x)
	if btns.sr_field_type_check5.button_pressed == true: for x in database.fv10: classes_choosed.append(x)
	if btns.sr_field_type_check6.button_pressed == true: for x in database.fvintage: classes_choosed.append(x)
	if btns.sr_field_type_check7.button_pressed == true: for x in database.gthistorical: classes_choosed.append(x)
	if btns.sr_field_type_check8.button_pressed == true:
		for x in database.gtmodern:
			if 'class49' in x:
				if $dlc_config_screen/dlc_panel/dlc_settings/dlc2.button_pressed == true: classes_choosed.append(x)
				elif $dlc_config_screen/dlc_panel/dlc_settings/dlc20.button_pressed == true: classes_choosed.append(x)
				else: continue
			if 'class46' in x:
				if $dlc_config_screen/dlc_panel/dlc_settings/dlc16.button_pressed == true: classes_choosed.append(x)
				elif $dlc_config_screen/dlc_panel/dlc_settings/dlc18.button_pressed == true: classes_choosed.append(x)
				elif $dlc_config_screen/dlc_panel/dlc_settings/dlc20.button_pressed == true: classes_choosed.append(x)
				elif $dlc_config_screen/dlc_panel/dlc_settings/dlc22.button_pressed == true: classes_choosed.append(x)
				else: continue
			if 'class84' in x:
				if $dlc_config_screen/dlc_panel/dlc_settings/dlc22.button_pressed == false: continue
				else: classes_choosed.append(x)
			if 'class91' in x or '':
				if $dlc_config_screen/dlc_panel/dlc_settings/dlc20.button_pressed == false: continue
				else: classes_choosed.append(x)
			else: classes_choosed.append(x)
	if btns.sr_field_type_check9.button_pressed == true: for x in database.kart: classes_choosed.append(x)
	if btns.sr_field_type_check10.button_pressed == true:
		for x in database.prototypes:
			if 'class11' in x:
				if $dlc_config_screen/dlc_panel/dlc_settings/dlc2.button_pressed == false: continue
				else: classes_choosed.append(x)
			if 'class59' in x:
				if $dlc_config_screen/dlc_panel/dlc_settings/dlc16.button_pressed == true: classes_choosed.append(x)
				elif $dlc_config_screen/dlc_panel/dlc_settings/dlc18.button_pressed == true: classes_choosed.append(x)
				elif $dlc_config_screen/dlc_panel/dlc_settings/dlc20.button_pressed == true: classes_choosed.append(x)
				elif $dlc_config_screen/dlc_panel/dlc_settings/dlc22.button_pressed == true: classes_choosed.append(x)
				else: continue
			if 'class60' in x or 'class61' in x:
				if $dlc_config_screen/dlc_panel/dlc_settings/dlc18.button_pressed == false: continue
				else: classes_choosed.append(x)
			else: classes_choosed.append(x)
	if btns.sr_field_type_check11.button_pressed == true: for x in database.rally: classes_choosed.append(x)
	if btns.sr_field_type_check12.button_pressed == true: for x in database.stockhistorical: classes_choosed.append(x)
	if btns.sr_field_type_check13.button_pressed == true: for x in database.stockmodern: classes_choosed.append(x)
	if btns.sr_field_type_check14.button_pressed == true:
		for x in database.street:
			if 'class53' in x:
				if $dlc_config_screen/dlc_panel/dlc_settings/dlc8.button_pressed == true: classes_choosed.append(x)
				elif $dlc_config_screen/dlc_panel/dlc_settings/dlc20.button_pressed == true: classes_choosed.append(x)
				else: continue
			else: continue
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
		#for x in database.kart: classes_choosed.append(x)
		for x in database.prototypes: classes_choosed.append(x)
		#for x in database.rally: classes_choosed.append(x)
		for x in database.stockhistorical: classes_choosed.append(x)
		for x in database.stockmodern: classes_choosed.append(x)
		for x in database.street: classes_choosed.append(x)
		for x in database.touringhistoric: classes_choosed.append(x)
		for x in database.touringmodern: classes_choosed.append(x)
	classes_choosed.shuffle()
	
	return [field_type, classes_choosed]
	
func sr_race_length():
	var race_length = 'random'
	if btns.sr_race_length_btn2.button_pressed == true: race_length = 'minimum'
	elif btns.sr_race_length_btn3.button_pressed == true: race_length = 'short'
	elif btns.sr_race_length_btn4.button_pressed == true: race_length = 'medium'
	elif btns.sr_race_length_btn5.button_pressed == true: race_length = 'long'
	elif btns.sr_race_length_btn6.button_pressed == true:
		race_length = ['endurance short', 'endurance medium', 'endurance long'].pick_random()
	elif btns.sr_race_length_btn7.button_pressed == true: race_length = 'endurance short'
	elif btns.sr_race_length_btn8.button_pressed == true: race_length = 'endurance medium'
	elif btns.sr_race_length_btn9.button_pressed == true: race_length = 'endurance long'
	elif btns.sr_race_length_btn10.button_pressed == true: race_length = 'are you crazy'
	else:
		race_length = ['minimum', 'short', 'medium', 'long', 'endurance short', 'endurance medium', 'endurance long', 'are you crazy'].pick_random()
	
	return race_length

func sr_time_period_progression():
	var time_period = 'random'
	if btns.sr_time_period_btn2.button_pressed == true: time_period = 'day'
	elif btns.sr_time_period_btn3.button_pressed == true: time_period = 'night'
	else: time_period = ['day', 'night'].pick_random()
	
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
	if btns.sr_weather_slot_btn2.button_pressed == true: weather_slots = '1x slot'
	elif btns.sr_weather_slot_btn3.button_pressed == true: weather_slots = '2x slots'
	elif btns.sr_weather_slot_btn4.button_pressed == true: weather_slots = '3x slots'
	elif btns.sr_weather_slot_btn5.button_pressed == true: weather_slots = '4x slots'
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
	if btns.sr_fuel_btn2.button_pressed == true: fuel_usage = 'real fuel usage'
	elif btns.sr_fuel_btn3.button_pressed == true: fuel_usage = 'no usage'
	elif btns.sr_fuel_btn4.button_pressed == true: fuel_usage = '2x fuel usage'
	elif btns.sr_fuel_btn5.button_pressed == true: fuel_usage = '3x fuel usage'
	elif btns.sr_fuel_btn6.button_pressed == true: fuel_usage = '4x fuel usage'
	elif btns.sr_fuel_btn7.button_pressed == true: fuel_usage = '5x fuel usage'
	else: fuel_usage = 'random'
	
	return [tire_wear, fuel_usage]

func sr_fcy():
	var fcy = 'random'
	if btns.sr_fcy_btn2.button_pressed == true: fcy = 'no fcy'
	elif btns.sr_fcy_btn3.button_pressed == true: fcy = 'with fcy'
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
	randomize()
	class_check(sr_opponent_field())
	progression_check(sr_time_period_progression(), sr_race_length())
	weather_check(sr_weather())
	starttype_check(sr_start_type())
	pitstop_check(sr_mandatory_pitstop())
	tire_fuel_check(sr_tire_fuel())
	fcy_check(sr_fcy())
	sfcy_check(sr_sfcy())
	race_title()

#SINGLE RACE CONFIRM LOGICS
func class_check(opponent_field):
	var class_null = database.class_null
	var field_type = opponent_field[0]
	var classes = opponent_field[1]
	
	#Decide how many classes are available to choose
	var class_count = 0
	for x in classes:
		class_count +=1
		if field_type == 'single_class': break
		elif field_type == 'multi2_class' and class_count >= 2: break
		elif field_type == 'multi3_class' and class_count >= 3: break
		elif field_type == 'multi4_class' and class_count >= 4: break
		elif field_type == 'multi5_class' and class_count >= 5: break
		else: continue
	
	#Decide NORMAL, KART or RALLY
	var motorsport = 'normal'
	var option_text = $single_race_screen/Control/singlerace_panel1/fieldtypeoption_label
	if 'KARTS ONLY' in option_text.text: motorsport = 'kart'
	elif 'RALLY ONLY' in option_text.text: motorsport = 'rally'
	
	#Choose all the classes
	var classes_choosed = [class_null, class_null, class_null, class_null, class_null]
	while class_count > 0:
		var current_class = classes.pick_random()
		if current_class in classes_choosed: continue
		elif motorsport == 'kart' and current_class not in database.kart: continue
		elif motorsport == 'rally' and current_class not in database.rally: continue
		else:
			classes_choosed[class_count-1] = current_class
			class_count -= 1
	
	#Apply the results
	$single_race_screen/Control/srgen_panel/srgen_settings/class_img1.texture = load(classes_choosed[0])
	$single_race_screen/Control/srgen_panel/srgen_settings/class_img2.texture = load(classes_choosed[1])
	$single_race_screen/Control/srgen_panel/srgen_settings/class_img3.texture = load(classes_choosed[2])
	$single_race_screen/Control/srgen_panel/srgen_settings/class_img4.texture = load(classes_choosed[3])
	$single_race_screen/Control/srgen_panel/srgen_settings/class_img5.texture = load(classes_choosed[4])
	
	#Decide the track
	var track_text = $single_race_screen/Control/srgen_panel/srgen_settings/srgen_track
	if motorsport == 'kart': track_text.text = tracksdb.kart_tracks.pick_random()
	elif motorsport == 'rally': track_text.text = tracksdb.rx_tracks.pick_random()
	else: track_text.text = choose_track()

func choose_track():
	var tracks = tracksdb.normal_tracks
	var track_choosed = 'A TRACK OF YOUR CHOICE !'

	if $dlc_config_screen/dlc_panel/dlc_settings/dlc1.button_pressed == false:
		for x in tracks:
			if 'Hockenheim' in x: tracks.erase(x)
	if $dlc_config_screen/dlc_panel/dlc_settings/dlc2.button_pressed == false:
		for x in tracks:
			if 'Daytona' in x: tracks.erase(x)
			elif 'Laguna' in x: tracks.erase(x)
			elif 'Long Beach' in x: tracks.erase(x)
	if $dlc_config_screen/dlc_panel/dlc_settings/dlc3.button_pressed == false:
		for x in tracks:
			if 'Silverstone' in x: tracks.erase(x)
	if $dlc_config_screen/dlc_panel/dlc_settings/dlc4.button_pressed == false:
		for x in tracks:
			if 'Cleveland' in x: tracks.erase(x)
			elif 'Watkins' in x: tracks.erase(x)
			elif 'Road America' in x: tracks.erase(x)
	if $dlc_config_screen/dlc_panel/dlc_settings/dlc5.button_pressed == false:
		for x in tracks:
			if 'Nordschleife' in x: tracks.erase(x)
			elif 'Nurburgring' in x: tracks.erase(x)
			elif 'Gesamtstrecke' in x: tracks.erase(x)
			elif 'Betonschleife' in x: tracks.erase(x)
			elif 'Sudschleife' in x: tracks.erase(x)
	if $dlc_config_screen/dlc_panel/dlc_settings/dlc6.button_pressed == false:
		for x in tracks:
			if 'Indianapolis' in x: tracks.erase(x)
			elif 'Fontana' in x: tracks.erase(x)
			elif 'Gateway' in x: tracks.erase(x)
	if $dlc_config_screen/dlc_panel/dlc_settings/dlc7.button_pressed == false:
		for x in tracks:
			if 'Spa-' in x: tracks.erase(x)
	if $dlc_config_screen/dlc_panel/dlc_settings/dlc9.button_pressed == false:
		for x in tracks:
			if 'Monza' in x: tracks.erase(x)
	if $dlc_config_screen/dlc_panel/dlc_settings/dlc11.button_pressed == false:
		for x in tracks:
			if 'Barcelona' in x: tracks.erase(x)
	if $dlc_config_screen/dlc_panel/dlc_settings/dlc13.button_pressed == false:
		for x in tracks:
			if 'Cascais 1988' in x: tracks.erase(x)
			elif 'Jerez 1988' in x: tracks.erase(x)
			elif 'Bathurst 1983' in x: tracks.erase(x)
	if $dlc_config_screen/dlc_panel/dlc_settings/dlc15.button_pressed == false:
		for x in tracks:
			if 'Barcelona 1991' in x: tracks.erase(x)
			elif 'Interlagos 1991' in x: tracks.erase(x)
			elif 'Interlagos 1993' in x: tracks.erase(x)
			elif 'Montreal 1991' in x: tracks.erase(x)
	if $dlc_config_screen/dlc_panel/dlc_settings/dlc17.button_pressed == false:
		for x in tracks:
			if 'Le Mans' in x: tracks.erase(x)
	if $dlc_config_screen/dlc_panel/dlc_settings/dlc19.button_pressed == false:
		for x in tracks:
			if 'Canadian' in x: tracks.erase(x)
			elif 'Atlanta' in x: tracks.erase(x)
			elif 'Sebring' in x: tracks.erase(x)
	if $dlc_config_screen/dlc_panel/dlc_settings/dlc21.button_pressed == false:
		for x in tracks:
			if 'Nordschleife 2025' in x: tracks.erase(x)
	tracks.shuffle()
	track_choosed = tracks.pick_random()
	return track_choosed

func progression_check(time_period, race_length):
	var race_length_text = $single_race_screen/Control/srgen_panel/srgen_settings/srgen_racelength
	var short = database.short_length.pick_random()
	var medium = database.medium_length.pick_random()
	var long = database.long_length.pick_random()
	var endu_short = database.short_enduro.pick_random()
	var endu_medium = database.medium_enduro.pick_random()
	var endu_long = database.long_enduro.pick_random()
	var crazy = database.crazy_length.pick_random()
	if race_length == 'minimum': race_length_text.text = '-  5 minutes race length'
	elif race_length == 'short': race_length_text.text = '-  ' + short + ' race length'
	elif race_length == 'medium': race_length_text.text = '-  ' + medium + ' race length'
	elif race_length == 'long': race_length_text.text = '-  ' + long + ' race length'
	elif race_length == 'endurance short': race_length_text.text = '-  ' + endu_short + ' race length'
	elif race_length == 'endurance medium': race_length_text.text = '-  ' + endu_medium + ' race length'
	elif race_length == 'endurance long': race_length_text.text = '-  ' + endu_long + ' race length'
	elif race_length == 'are you crazy': race_length_text.text = '-  ' + crazy + ' race length'

	var start_time_text = $single_race_screen/Control/srgen_panel/srgen_settings/srgen_starttime
	var time_progression_text = $single_race_screen/Control/srgen_panel/srgen_settings/srgen_timeprogress
	if time_period[1] == 'daylight only':
		time_period[0] = 'day'
		time_progression_text.text = '-  Set time progression to OFF'
	elif time_period[1] == 'nighttime only':
		time_period[0] = 'night'
		time_progression_text.text = '-  Set time progression to OFF'
	elif time_period[0] == 'day': start_time_text.text = '-  Race starts at ' + database.day_times.pick_random()
	elif time_period[0] == 'night': start_time_text.text = '-  Race starts at ' + database.night_times.pick_random()
	if race_length == 'short':
		if time_period[1] == '3h race': time_progression_text.text = '-  10x time progression'
		elif time_period[1] == '6h race': time_progression_text.text = '-  20x time progression'
		elif time_period[1] == '12h race': time_progression_text.text = '-  35x time progression'
		elif time_period[1] == '24h race': time_progression_text.text = '-  60x time progression'
		elif time_period[1] == '36h race': time_progression_text.text = '-  60x time progression'
		else: time_progression_text.text = '-  60x time progression'
	elif race_length == 'medium':
		if time_period[1] == '3h race': time_progression_text.text = '-  5x time progression'
		elif time_period[1] == '6h race': time_progression_text.text = '-  10x time progression'
		elif time_period[1] == '12h race': time_progression_text.text = '-  20x time progression'
		elif time_period[1] == '24h race': time_progression_text.text = '-  40x time progression'
		elif time_period[1] == '36h race': time_progression_text.text = '-  60x time progression'
		else: time_progression_text.text = '-  60x time progression'
	elif race_length == 'long':
		if time_period[1] == '3h race': time_progression_text.text = '-  2x time progression'
		elif time_period[1] == '6h race': time_progression_text.text = '-  5x time progression'
		elif time_period[1] == '12h race': time_progression_text.text = '-  15x time progression'
		elif time_period[1] == '24h race': time_progression_text.text = '-  25x time progression'
		elif time_period[1] == '36h race': time_progression_text.text = '-  40x time progression'
		else: time_progression_text.text = '-  50x time progression'
	elif race_length == 'endurance short':
		if time_period[1] == '3h race': time_progression_text.text = '-  2x time progression'
		elif time_period[1] == '6h race': time_progression_text.text = '-  5x time progression'
		elif time_period[1] == '12h race': time_progression_text.text = '-  10x time progression'
		elif time_period[1] == '24h race': time_progression_text.text = '-  15x time progression'
		elif time_period[1] == '36h race': time_progression_text.text = '-  25x time progression'
		else: time_progression_text.text = '-  30x time progression'
	elif race_length == 'endurance medium':
		if time_period[1] == '3h race': time_progression_text.text = '-  Real Time progression'
		elif time_period[1] == '6h race': time_progression_text.text = '-  2x time progression'
		elif time_period[1] == '12h race': time_progression_text.text = '-  5x time progression'
		elif time_period[1] == '24h race': time_progression_text.text = '-  10x time progression'
		elif time_period[1] == '36h race': time_progression_text.text = '-  20x time progression'
		else: time_progression_text.text = '-  25x time progression'
	elif race_length == 'endurance long':
		if time_period[1] == '3h race': time_progression_text.text = '-  Real Time progression'
		elif time_period[1] == '6h race': time_progression_text.text = '-  Real Time progression'
		elif time_period[1] == '12h race': time_progression_text.text = '-  2x time progression'
		elif time_period[1] == '24h race': time_progression_text.text = '-  5x time progression'
		elif time_period[1] == '36h race': time_progression_text.text = '-  10x time progression'
		else: time_progression_text.text = '-  15x time progression'
	elif race_length == 'are you crazy':
		if time_period[1] == '3h race': time_progression_text.text = '-  Real Time progression'
		elif time_period[1] == '6h race': time_progression_text.text = '-  Real Time progression'
		elif time_period[1] == '12h race': time_progression_text.text = '-  Real Time progression'
		elif time_period[1] == '24h race': time_progression_text.text = '-  5x time progression'
		elif time_period[1] == '36h race': time_progression_text.text = '-  10x time progression'
		else: time_progression_text.text = '-  10x time progression'

func weather_check(weather):
	var weather_null = database.weather_null
	var weathers_choosed = []
	
	#decide how many slots
	var weather_slots = 1
	if weather[1] == '1x slot': weather_slots = 1
	elif weather[1] == '2x slots': weather_slots = 2
	elif weather[1] == '3x slots': weather_slots = 3
	elif weather[1] == '4x slots': weather_slots = 4
	else: weather_slots = randi_range(1,4)
	
	#apply which type of weather to add
	var weathers = [weather_null, weather_null, weather_null, weather_null]
	if weather[0] == 'allow rain':
		for x in database.clean_weathers: weathers_choosed.append(x)
		for y in database.rain_weathers: weathers_choosed.append(y)
		weathers_choosed.shuffle()
		if weather_slots == 1: weathers[0] = weathers_choosed.pick_random()
		elif weather_slots == 2:
			weathers[0] = weathers_choosed.pick_random()
			weathers[1] = weathers_choosed.pick_random()
		elif weather_slots == 3:
			weathers[0] = weathers_choosed.pick_random()
			weathers[1] = weathers_choosed.pick_random()
			weathers[2] = weathers_choosed.pick_random()
		else:
			weathers[0] = weathers_choosed.pick_random()
			weathers[1] = weathers_choosed.pick_random()
			weathers[2] = weathers_choosed.pick_random()
			weathers[3] = weathers_choosed.pick_random()
	elif weather[0] == 'no rain':
		for x in database.clean_weathers: weathers_choosed.append(x)
		weathers_choosed.shuffle()
		if weather_slots == 1: weathers[0] = weathers_choosed.pick_random()
		elif weather_slots == 2:
			weathers[0] = weathers_choosed.pick_random()
			weathers[1] = weathers_choosed.pick_random()
		elif weather_slots == 3:
			weathers[0] = weathers_choosed.pick_random()
			weathers[1] = weathers_choosed.pick_random()
			weathers[2] = weathers_choosed.pick_random()
		else:
			weathers[0] = weathers_choosed.pick_random()
			weathers[1] = weathers_choosed.pick_random()
			weathers[2] = weathers_choosed.pick_random()
			weathers[3] = weathers_choosed.pick_random()
	elif weather[0] == 'only rain':
		for x in database.rain_weathers:
			if x == "res://Images/Weathers/weather14.png": continue
			else: weathers_choosed.append(x)
		weathers_choosed.shuffle()
		if weather_slots == 1: weathers[0] = weathers_choosed.pick_random()
		elif weather_slots == 2:
			weathers[0] = weathers_choosed.pick_random()
			weathers[1] = weathers_choosed.pick_random()
		elif weather_slots == 3:
			weathers[0] = weathers_choosed.pick_random()
			weathers[1] = weathers_choosed.pick_random()
			weathers[2] = weathers_choosed.pick_random()
		else:
			weathers[0] = weathers_choosed.pick_random()
			weathers[1] = weathers_choosed.pick_random()
			weathers[2] = weathers_choosed.pick_random()
			weathers[3] = weathers_choosed.pick_random()
	else:
		if weather_slots == 1 : weathers[0] = database.random_weather
		elif weather_slots == 2 :
			weathers[0] = database.random_weather
			weathers[1] = database.random_weather
		elif weather_slots == 3 :
			weathers[0] = database.random_weather
			weathers[1] = database.random_weather
			weathers[2] = database.random_weather
		else:
			weathers[0] = database.random_weather
			weathers[1] = database.random_weather
			weathers[2] = database.random_weather
			weathers[3] = database.random_weather
	
	#apply the results
	$single_race_screen/Control/srgen_panel/srgen_settings/weather_img1.texture = load(weathers[0])
	$single_race_screen/Control/srgen_panel/srgen_settings/weather_img2.texture = load(weathers[1])
	$single_race_screen/Control/srgen_panel/srgen_settings/weather_img3.texture = load(weathers[2])
	$single_race_screen/Control/srgen_panel/srgen_settings/weather_img4.texture = load(weathers[3])

func starttype_check(start):
	var start_text = $single_race_screen/Control/srgen_panel/srgen_settings/srgen_starttype
	if start == 'standing': start_text.text = '-  Standing start'
	elif start == 'rolling': start_text.text = '-  Rolling start'
	else:
		var start_choosed = ['standing', 'rolling'].pick_random()
		if start_choosed == 'standing': start_text.text = '-  Standing start'
		else: start_text.text = '-  Rolling start'

func pitstop_check(pitstop):
	var pitstop_text = $single_race_screen/Control/srgen_panel/srgen_settings/srgen_pitstop
	if pitstop == 'no pitstop': pitstop_text.text = '-  No mandatory pitstop'
	elif pitstop == 'pitstop no tires': pitstop_text.text = '-  Mandatory pitstop with no tire change'
	elif pitstop == 'pitstop 2 tires': pitstop_text.text = '-  Mandatory pitstop with 2x tires change'
	elif pitstop == 'pitstop 4 tires': pitstop_text.text = '-  Mandatory pitstop with 4x tires change'
	else:
		var pitstop_options = ['no pitstop', 'no tires', '2 tires', '4 tires'].pick_random()
		if pitstop_options == 'no pitstop': pitstop_text.text = '-  No mandatory pitstop'
		elif pitstop_options == 'no tires': pitstop_text.text = '-  Mandatory pitstop with no tire change'
		elif pitstop_options == '2 tires': pitstop_text.text = '-  Mandatory pitstop with 2x tires change'
		else: pitstop_text.text = '-  Mandatory pitstop with 4x tires change'

func tire_fuel_check(tire_fuel):
	var tire = tire_fuel[0]
	var fuel = tire_fuel[1]
	var tire_fuel_text = $single_race_screen/Control/srgen_panel/srgen_settings/srgen_tirefuel
	
	#decide tire wear conditions
	if tire == 'authentic': tire_fuel_text.text = '-  Authentic Tire wear'
	elif tire == 'no tire wear': tire_fuel_text.text = '-  No Tire wear'
	elif tire == '2x tire wear': tire_fuel_text.text = '-  2x Tire wear'
	elif tire == '3x tire wear': tire_fuel_text.text = '-  3x Tire wear'
	elif tire == '4x tire wear': tire_fuel_text.text = '-  4x Tire wear'
	elif tire == '5x tire wear': tire_fuel_text.text = '-  5x Tire wear'
	else:
		var tire_choosed = ['authentic', 'no tire wear', '2x tire wear', '3x tire wear', '4x tire wear', '5x tire wear'].pick_random()
		if tire_choosed == 'authentic': tire_fuel_text.text = '-  Authentic Tire wear'
		elif tire_choosed == 'no tire wear': tire_fuel_text.text = '-  No Tire wear'
		elif tire_choosed == '2x tire wear': tire_fuel_text.text = '-  2x Tire wear'
		elif tire_choosed == '3x tire wear': tire_fuel_text.text = '-  3x Tire wear'
		elif tire_choosed == '4x tire wear': tire_fuel_text.text = '-  4x Tire wear'
		else: tire_fuel_text.text = '-  5x Tire wear'

	#decide fuel usage conditions
	if fuel == 'real fuel usage': tire_fuel_text.text += '  -  Real Fuel usage'
	elif fuel == 'no fuel usage': tire_fuel_text.text += '  -  No Fuel usage'
	elif fuel == '2x fuel usage': tire_fuel_text.text += '  -  2x Fuel usage'
	elif fuel == '3x fuel usage': tire_fuel_text.text += '  -  3x Fuel usage'
	elif fuel == '4x fuel usage': tire_fuel_text.text += '  -  4x Fuel usage'
	elif fuel == '5x fuel usage': tire_fuel_text.text += '  -  5x Fuel usage'
	else:
		var fuel_choosed = ['real fuel', 'no fuel', '2x fuel', '3x fuel', '4x fuel', '5x fuel'].pick_random()
		if fuel_choosed == 'real fuel': tire_fuel_text.text += '  -  Real Fuel usage'
		elif fuel_choosed == 'no fuel': tire_fuel_text.text += '  -  No Fuel usage'
		elif fuel_choosed == '2x fuel': tire_fuel_text.text += '  -  2x Fuel usage'
		elif fuel_choosed == '3x fuel': tire_fuel_text.text += '  -  3x Fuel usage'
		elif fuel_choosed == '4x fuel': tire_fuel_text.text += '  -  4x Fuel usage'
		else: tire_fuel_text.text += '  -  5x Fuel usage'

func fcy_check(fcy):
	var fcy_text = $single_race_screen/Control/srgen_panel/srgen_settings/srgen_fcy
	if fcy == 'no fcy': fcy_text.text = '-  NO Full Course Yellows'
	elif fcy == 'with fcy': fcy_text.text = '-  Allow Full Course Yellows'
	else:
		var fcy_choosed = ['no fcy', 'with fcy'].pick_random()
		if fcy_choosed == 'no fcy': fcy_text.text = '-  NO Full Course Yellows'
		else: fcy_text.text = '-  Allow Full Course Yellows'

func sfcy_check(sfcy):
	var sfcy_text = $single_race_screen/Control/srgen_panel/srgen_settings/srgen_sfcy
	if sfcy == 'no sfcy': sfcy_text.text = '-  NO Scheduled Full Course Yellow'
	elif sfcy == '75% sfcy': sfcy_text.text = '-  75% race Scheduled Full Course Yellow'
	elif sfcy == '50% sfcy': sfcy_text.text = '-  50% race Scheduled Full Course Yellow'
	elif sfcy == '25% sfcy': sfcy_text.text = '-  25% race Scheduled Full Course Yellow'
	else:
		var sfcy_choosed = ['no sfcy', '75% sfcy', '50% sfcy', '25% sfcy'].pick_random()
		if sfcy_choosed == 'no sfcy': sfcy_text.text = '-  NO Scheduled Full Course Yellow'
		elif sfcy_choosed == '75% sfcy': sfcy_text.text = '-  75% race Scheduled Full Course Yellow'
		elif sfcy_choosed == '50% sfcy': sfcy_text.text = '-  50% race Scheduled Full Course Yellow'
		elif sfcy_choosed == '25% sfcy': sfcy_text.text = '-  25% race Scheduled Full Course Yellow'

func race_title():
	randomize()
	var title_race = $single_race_screen/Control/srgen_panel/srgen_settings/srgen_title
	var opponent_option_text = $single_race_screen/Control/singlerace_panel1/fieldtypeoption_label
	var progression_option_text = $single_race_screen/Control/singlerace_panel3/timeperiodoption_label
	var weather_option_text = $single_race_screen/Control/singlerace_panel4/weatheroption_label
	var starttime_text = $single_race_screen/Control/srgen_panel/srgen_settings/srgen_starttime
	var class_amount_text = $single_race_screen/Control/singlerace_panel1/fieldtypeoption_label
	var titles_options = []
	if 'CATERHAMS ONLY' in opponent_option_text.text: titles_options.append(database.class_titles[0])
	elif 'F.CLASSICS ONLY' in opponent_option_text.text  or 'F.V10s ONLY' in opponent_option_text.text:
		titles_options.append(database.class_titles[1])
	elif 'F.RETROS ONLY' in opponent_option_text.text or 'F.VINTAGES' in opponent_option_text.text:
		titles_options.append(database.class_titles[1])
	elif 'F.MODERN ONLY' in opponent_option_text.text: titles_options.append(database.class_titles[2])
	elif 'HISTORICAL GT ONLY' in opponent_option_text.text: titles_options.append(database.class_titles[3])
	elif 'MODERN GT ONLY' in opponent_option_text.text: titles_options.append(database.class_titles[4])
	elif 'KARTS ONLY' in opponent_option_text.text: titles_options.append(database.class_titles[5])
	elif 'PROTOTYPES ONLY' in opponent_option_text.text: titles_options.append(database.class_titles[6])
	elif 'RALLY ONLY' in opponent_option_text.text: titles_options.append(database.class_titles[7])
	elif 'HISTORICAL STOCK CARS ONLY' in opponent_option_text.text: titles_options.append(database.class_titles[8])
	elif 'MODERN STOCK CARS ONLY' in opponent_option_text.text: titles_options.append(database.class_titles[9])
	elif 'STREET-SUPER-HYPER CARS ONLY' in opponent_option_text.text: titles_options.append(database.class_titles[10])
	elif 'MODERN TOURING ONLY' in opponent_option_text.text: titles_options.append(database.class_titles[10])
	elif 'HISTORICAL TOURING ONLY' in opponent_option_text.text: titles_options.append(database.class_titles[11])
	elif 'RANDOM CLASSES' in class_amount_text.text or 'SINGLE CLASS' in class_amount_text.text: pass
	else: titles_options.append(database.class_titles[12])
	
	if 'RACE ONLY AT DAYLIGHT' in progression_option_text.text: titles_options.append(database.weather_titles[6])
	elif 'RACE ONLY AT NIGHTTIME' in progression_option_text.text: titles_options.append(database.weather_titles[7])
	
	if 'SIMULATE A 3 HOURS RACE' in progression_option_text.text: titles_options.append(database.progression_titles[0])
	elif 'SIMULATE A 6 HOURS RACE' in progression_option_text.text: titles_options.append(database.progression_titles[1])
	elif 'SIMULATE A 12 HOURS RACE' in progression_option_text.text:
		titles_options.append(database.progression_titles[2])
		titles_options.append(database.progression_titles[3])
	elif 'SIMULATE A 24 HOURS RACE' in progression_option_text.text: titles_options.append(database.progression_titles[4])
	elif 'SIMULATE A 36 HOURS RACE' in progression_option_text.text: titles_options.append(database.progression_titles[5])
	elif 'SIMULATE A 48 HOURS RACE' in progression_option_text.text:
		titles_options.append(database.progression_titles[6])
		titles_options.append(database.progression_titles[7])
	
	if 'REMOVE RAINING WEATHERS' in weather_option_text.text:
		titles_options.append(database.weather_titles[8])
		if starttime_text.text in database.day_times: titles_options.append(database.weather_titles[0])
		elif starttime_text.text in database.night_times: titles_options.append(database.weather_titles[1])
	elif 'ONLY RAINING WEATHERS' in weather_option_text.text:
		titles_options.append(database.weather_titles[2])
		titles_options.append(database.weather_titles[4])
		titles_options.append(database.weather_titles[9])
		if starttime_text.text in database.night_times: titles_options.append(database.weather_titles[3])
	
	for x in database.day_times:
		if x in starttime_text.text:
			titles_options.append(database.daytime_titles[0])
			titles_options.append(database.daytime_titles[2])
			titles_options.append(database.daytime_titles[8])
			titles_options.append(database.daytime_titles[9])
	for x in database.night_times:
		if x in starttime_text.text:
			titles_options.append(database.daytime_titles[1])
			titles_options.append(database.daytime_titles[3])
			titles_options.append(database.daytime_titles[8])
			titles_options.append(database.daytime_titles[10])
	if database.day_times[4] in starttime_text.text: titles_options.append(database.daytime_titles[4])
	elif database.night_times[0] in starttime_text.text: titles_options.append(database.daytime_titles[5])
	if database.day_times[0] in starttime_text.text or database.day_times[1] in starttime_text.text:
		titles_options.append(database.daytime_titles[6])
		titles_options.append(database.daytime_titles[7])
	
	if not titles_options:
		title_race.text = 'The  ' + database.complement_titles.pick_random() + '  at'
	else:
		var random_title = randi_range(0,3)
		if random_title == 0: title_race.text = 'The  ' + database.complement_titles.pick_random() + '  at'
		else:
			titles_options.shuffle()
			title_race.text = 'The  ' + titles_options.pick_random() + ' ' + database.complement_titles.pick_random() + '  at'
