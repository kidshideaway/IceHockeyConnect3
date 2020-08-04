extends Node
 
var path_SharedDBs = "res://Resources/SharedDB/" 
var file_PlayerGameSkillTreeDB = path_SharedDBs + "icehockey_player_gameskilltree_database.gd_csv" 
var PlayerGameSkillTreeDB 
var PlayerGameSkillTreeDB_matrix = [] 

# Called when the node enters the scene tree for the first time.
func _ready(): 
	var delim = ","
	var newLineDelim = "\n"
		
	## open and read files  	 
	
	print(file_PlayerGameSkillTreeDB)
	PlayerGameSkillTreeDB = loadDB_PlayerGameSkillTreeDB(file_PlayerGameSkillTreeDB)
	var PlayerGameSkillTreeDB_Lines = PlayerGameSkillTreeDB.split(newLineDelim, true, 0)
	var PlayerGameSkillTreeDB_LineEntryCount = PlayerGameSkillTreeDB_Lines.size()
	for l in range(PlayerGameSkillTreeDB_LineEntryCount):
		PlayerGameSkillTreeDB_matrix.append([])
		var PlayerGameSkillTreeDB_Array = PlayerGameSkillTreeDB_Lines[l].split(delim, true, 0)
		var PlayerGameSkillTreeDB_EntryCount = PlayerGameSkillTreeDB_Array.size()
		for n in range(PlayerGameSkillTreeDB_EntryCount):
			print(String(l) + ":" + String(n) + ":" + PlayerGameSkillTreeDB_Array[n]) # Prints n entry
			PlayerGameSkillTreeDB_matrix[l].append(PlayerGameSkillTreeDB_Array[n])
	saveDB_PlayerGameSkillTreeDB(PlayerGameSkillTreeDB, file_PlayerGameSkillTreeDB)
	 
	
func loadDB_PlayerGameSkillTreeDB(fileName):
	var content = loadFile( fileName) 
	return content
	
func saveDB_PlayerGameSkillTreeDB(content, fileName ):
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
	
	 
#icehockey_player_gameskilltree_database.gd_csv 
