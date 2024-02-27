extends Node2D


enum DAMAGE_TYPES { 
	NONE, 
	FIRE, 
	ICE 
}

class FireArrow:
	var damage_type: DAMAGE_TYPES = DAMAGE_TYPES.FIRE
