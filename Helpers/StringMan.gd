extends Node

# amp, freq
func wavy(text: String, amp: float = 50.0, freq: float = 2.0) -> String:
	return "[wave amp=%s freq=%s]%s[/wave]" % [amp, freq, text]

# radius, freq
func tornado(text: String, radius: float = 5.0, freq: float = 2.0) -> String:
	return "[tornado radius=%s freq=%s]%s[/tornado]" % [radius, freq, text]

# rate, level
func shake(text: String, rate: float = 5.0, level: float = 10.0) -> String:
	return "[shake rate=%s level=%s]%s[/shake]" % [rate, level, text]
	
func fade(text: String, start: int = 0, length: int = 0) -> String:
	var computedLengh = text.length() if length == 0 else length
	return  "[fade start=%s length=%s]%s[/fade]" % [start, computedLengh, text]
