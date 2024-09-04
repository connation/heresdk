_package_settings = {}
main_attribute_array = {}
voice_settings = {}

language = "Korean"
language_id = "43"
language_loc = "한국어"
main_attribute_array["LocalizedType"] = "음성 합성"
main_attribute_array["language_code"] = "ko-KR"
main_attribute_array["ngLangCode"] = "kor"
marc_code = "KOR"
speed_camera = "true"
speed_warner = "true"

config_file = "main.lua"
description = "voice package for "..language_loc
feature_list = { "metric", "imperial_uk", "imperial_us" }
id = language_id..marc_code
output_type = "tts"
voice_settings["nguidance"] = "true"
voice_settings["nguidance_junction"] = "true"
voice_settings["nguidance_stop_sign"] = "true"
voice_settings["nguidance_trafficlights"] = "true"
voice_settings["prompt_mode"] = "1"
