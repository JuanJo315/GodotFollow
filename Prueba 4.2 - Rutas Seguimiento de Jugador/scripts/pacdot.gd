extends CharacterBody2D

const speed = 40 

@export var player: Node2D
@onready var nav_agent = $NavigationAgent2D as NavigationAgent2D

func _physics_process(_delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed 
	move_and_slide()

func makepath() -> void:
	nav_agent.target_position = player.global_position
	


# Every set time in the Wait Time does the code 
func _on_timer_timeout() -> void:
	# In this code we create a new path every half a second 
	makepath()
