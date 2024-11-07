class_name BoolResource
extends ValueResource

signal changed_true
signal changed_false

@export var value:bool : set = set_value
@export var default_value:bool

func set_value(_value:bool)->void:
	if value == _value:
		return
	value = _value
	if value:
		changed_true.emit()
	else:
		changed_false.emit()
	updated.emit()

## Override function for resetting to default values
func reset_resource()->void:
	value = default_value

## Override for creating data Resource that will be saved with the ResourceSaver
func prepare_save()->Resource:
	return self.duplicate()

## Override to ad logic for reading loaded data and applying to current instance of the Resource
func prepare_load(_data:Resource)->void:
	value = _data.value
