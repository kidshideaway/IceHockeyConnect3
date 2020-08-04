extends Node

var path_SharedDBs = "res://Resources/SharedDB/"
var file_PlayerGameSkillTypesDB = path_SharedDBs + "icehockey_player_gameskilltypes_database.gd_csv" 
var PlayerGameSkillTypesDB 
var PlayerGameSkillTypesDB_matrix = [] 

# Called when the node enters the scene tree for the first time.
func _ready(): 
	var delim = ","
	var newLineDelim = "\n"
		
	## open and read files  
 
	print(file_PlayerGameSkillTypesDB)
	PlayerGameSkillTypesDB = loadDB_PlayerGameSkillTypesDB(file_PlayerGameSkillTypesDB)
	var PlayerGameSkillTypesDB_Lines = PlayerGameSkillTypesDB.split(newLineDelim, true, 0)
	var PlayerGameSkillTypesDB_LineEntryCount = PlayerGameSkillTypesDB_Lines.size()
	for l in range(PlayerGameSkillTypesDB_LineEntryCount):
		PlayerGameSkillTypesDB_matrix.append([])
		var PlayerGameSkillTypesDB_Array = PlayerGameSkillTypesDB_Lines[l].split(delim, true, 0)
		var PlayerGameSkillTypesDB_EntryCount = PlayerGameSkillTypesDB_Array.size()
		for n in range(PlayerGameSkillTypesDB_EntryCount):
			print(String(l) + ":" + String(n) + ":" + PlayerGameSkillTypesDB_Array[n]) # Prints n entry
			PlayerGameSkillTypesDB_matrix[l].append(PlayerGameSkillTypesDB_Array[n])
	saveDB_PlayerGameSkillTypesDB(PlayerGameSkillTypesDB, file_PlayerGameSkillTypesDB)
	 
 
func loadDB_PlayerGameSkillTypesDB( fileName):
	var content = loadFile( fileName) 
	return content
	

func saveDB_PlayerGameSkillTypesDB( content, fileName):
	saveFILE(content, fileName ) 
	 

func saveFILE(content, fileName ):
	var file = File.new()
	file.open(fileName, File.WRITE)
	file.store_string(content)
	file.close()


func loadFile( fileName):
	var file = File.new()
	file.open(fileName, File.READ)
	var content = file.get_as_text()
	file.close()
	return content

	 
#icehockey_player_gameskilltypes_database.gd_csv 
