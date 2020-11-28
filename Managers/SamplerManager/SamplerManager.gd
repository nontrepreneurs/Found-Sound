extends Node2D

var current_sample: Sample = null setget set_sample, get_sample

const SAMPLE_CHANGED_SIGNAL = "sample_changed"
signal sample_changed(sample)

func set_sample(new_sample: Sample) -> void:
	current_sample = new_sample
	emit_signal(SAMPLE_CHANGED_SIGNAL, current_sample)

func get_sample() -> Sample:
	return current_sample
