extends Resource
class_name StateMutator

signal state_changed

var state = null setget setState, getState

func getState():
    return state

func setState(updatedState):
    state = updatedState
    if state != null:
        emit_signal("state_changed", self)
    