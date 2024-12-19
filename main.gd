extends Node

var current_anim = "app_start"
var next_anim

func _ready(): $AnimationPlayer.play(current_anim)



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
