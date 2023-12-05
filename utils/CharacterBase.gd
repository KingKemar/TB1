# CharacterBase.gd
extends Node
class_name CharacterBase
# Variables
var hp = 100
var hp_max = 100
var mana = 50
var energy = 50
var dead = false

# Functions
func _init(_hp_max: int, _mana: int, _energy: int):
	hp_max = _hp_max
	mana = _mana
	energy = _energy

func damage_received(damage: int):
	hp -= damage
	
	# Check for death, apply damage effects, etc.
	if hp <= 0 :
		hp = 0
		player_dies()
	print("Damage received: ", damage, " Remaining HP: ", hp)
	
func player_dies():
	dead = true
	print("Player is dead")

func healed(healing: int):
	if hp + healing > hp_max :
		hp = hp_max
	else :
		hp += healing
	# Ensure HP does not exceed max HP, etc.
	print("Healed: ", healing, " Current HP: ", hp)

func mana_spent(cost: int):
	mana -= cost
	# Handle cases where mana is insufficient, etc.
	print("Mana spent: ", cost, " Remaining Mana: ", mana)
