extends Node

signal player_initialized

var player: Player

const InventoryFile = "user://PlayerInventory.tres"
const IdentityFile = "user://PlayerIdentity.tres"


const Components: Dictionary = {
	inventory = { file = InventoryFile },
	identity =  { file = IdentityFile }
}

func _process(delta):
	if not player:
		initializePlayer()

# connections callback functions to slices of component state
func registerComponentConnection(connectionKey: String):
	var connectionCallback = 	"_on_player_{key}_changed".format({ key = connectionKey})
	player[connectionKey].connect(
		"component_changed", 
		self, 
		connectionCallback
	)

#	setup each component of a player if its the start of the game
func initializeComponent(key: String):
#	determine if this is a new game somehow
#	eventually prompt player for some of this info
	match key:
		"identity":	
			initializeIdentity()
		"inventory":
			initializeInventory()

# will load currently save component files, or generate new ones.
func setComponents(key: String):
	var resource: Component = load(Components[key].file)
	if resource != null:
		player[key].setComponent(resource.getComponent())
	else:
		print("resource doesnt exist: ", key)
		initializeComponent(key)
	
func registerPlayerComponents():
	for key in Components:
		registerComponentConnection(key)
		setComponents(key)

func initializePlayer():
	player = get_tree().get_root().get_node("/root/World/Player")
	if player:
		print("initializing player")
		emit_signal("player_initialized", player)
		registerPlayerComponents()
	else: 
		printerr("GameManager.initialize_player(): no player found")

### Inventory
func _on_player_inventory_changed(inventory):
	ResourceSaver.save(InventoryFile, inventory)
func initializeInventory():
	player.inventory.addItem("motifs", "solemn")
	player.inventory.addItem("consumables", "rustytunacan")


func _on_player_identity_changed(identity: Identity):
	ResourceSaver.save(IdentityFile, identity)
func initializeIdentity():
	player.identity.setCharacter("Foley")


func _clear_player_state():
	printerr("DELETING PLAYER STATE")
	var dir = Directory.new()
	for key in Components:
		dir.remove(Components[key].file)

func _ready():
	_clear_player_state()
	initializePlayer()
