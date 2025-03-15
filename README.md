# gd-gbk-decode

Godot Engine Plugin gbk_decode

Decode a `String` who has a GBK binary data.

Only tested in Windows 10, Godot 4.4.


## Usage

Add "gbk_decode_util.gd" to your resource library (Adding this plugin will do this automatically). Then use class `GbkDecode`'s static functions.

```gdscript
a_string_with_utf8_binary_data = GbkDecode.decode_string_as_gbk(a_string_with_GBK_binary_data)
```

Or enable this plugin to use its autoload name `GbkDecodePlugin`.

```gdscript
a_string_with_utf8_binary_data = GbkDecodePlugin.decode_string_as_gbk(a_string_with_GBK_binary_data)
```

## Reason

The Windows API may return a GBK encoded string buffer. But Godot does not check it. When using `String.to_utf8_buffer`, it treats the buffer as an Unicode encoded buffer which may cause problems.

The GBK encoded "蓝牙 XINPUT 兼容的输入设备" will be decoded as "À¶ÑÀ XINPUT ¼æÈÝµÄÊäÈëÉè±¸".

This plugin uses `String.to_wchar_buffer` to get origin GBK data, and transform it to an utf-8 `String`.
