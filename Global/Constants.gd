extends Node

enum ResourceTypes {
	UKNOWNN,
	CHARACTER,
	VOICE
}

enum NavigatorLocations{
	HOMESTEAD,
	OUTSKIRTS,
	TOWN,
	TRAIL,
	FOREST,
	DUMP	,
	WETLANDS,
	SECLUDED_STEPPES,
	SECRET_PATH
}

enum Soundtrack {
	TITLE,
	CUTE,
	DOWN_IN_THE_DUMPS,
	AMBIENT,
	PAWS_FOR_EFFECT,
	VICTORY
}

enum DialogueTypes {
	# vocalized dialogues are like your standard rpg fair, meaning a sound plays every step of the timer
	VOCALIZED,
	# one_shots will play once at the beginning of a dialogue, and not repeat further.
	ONE_SHOT
}
