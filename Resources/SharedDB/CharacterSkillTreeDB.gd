extends Node

var path_SharedDBs = "res://Resources/SharedDB/" 
var file_CharacterSkillTreeDB = path_SharedDBs + "icehockey_player_characterskilltree_database.gd_csv" 
var CharacterSkillTreeDB 
var CharacterSkillTreeDB_matrix = [] 

# Called when the node enters the scene tree for the first time.
func _ready(): 
	var delim = ","
	var newLineDelim = "\n"
		
	## open and read files  
	
	print(file_CharacterSkillTreeDB)
	CharacterSkillTreeDB = loadDB_CharacterSkillTreeDB(file_CharacterSkillTreeDB)
	var CharacterSkillTreeDB_Lines = CharacterSkillTreeDB.split(newLineDelim, true, 0)
	var CharacterSkillTreeDB_LineEntryCount = CharacterSkillTreeDB_Lines.size()
	for l in range(CharacterSkillTreeDB_LineEntryCount):
		CharacterSkillTreeDB_matrix.append([])
		var CharacterSkillTreeDB_Array = CharacterSkillTreeDB_Lines[l].split(delim, true, 0)
		var CharacterSkillTreeDB_EntryCount = CharacterSkillTreeDB_Array.size()
		for n in range(CharacterSkillTreeDB_EntryCount):
			print(String(l) + ":" + String(n) + ":" + CharacterSkillTreeDB_Array[n]) # Prints n entry
			CharacterSkillTreeDB_matrix[l].append(CharacterSkillTreeDB_Array[n])
	saveDB_CharacterSkillTreeDB(CharacterSkillTreeDB, file_CharacterSkillTreeDB)
	
 
func loadDB_CharacterSkillTreeDB(fileName):
	var content = loadFile( fileName) 
	return content
	
func saveDB_CharacterSkillTreeDB(content, fileName ):
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
	
	 
#icehockey_player_characterskilltree_database.gd_csv 
