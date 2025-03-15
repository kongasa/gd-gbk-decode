@tool
extends Node

var connected_joypad;

func _init() -> void:
	connected_joypad = Input.get_connected_joypads();
	print(connected_joypad);
	print(list_joys_info());

func get_joy_info(deviceId: int) -> Dictionary:
	var res = Input.get_joy_info(deviceId);
	res.name = Input.get_joy_name(deviceId);
	# class_name and static function
	res.nameD = GbkDecode.decode_string_as_gbk(res.name);
	# global autoload
	res.nameDP = GbkDecodePlugin.decode_string_as_gbk(res.name);
	return res;
	
func list_joys_info() -> Array:
	return Input.get_connected_joypads().map(get_joy_info);

func print_list_joys_info() -> void:
	print(list_joys_info());
	
@export_tool_button("Print all joypads' Infomation") var print_all_joys_info_button = print_list_joys_info;
