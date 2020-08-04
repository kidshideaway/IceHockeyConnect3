extends Node

var path_SharedDBs = "res://Resources/SharedDB/"
var file_CharacterSheetDB = path_SharedDBs + "icehockey_player_charactersheet_database.gd_csv"  
var CharacterSheetDB 
var CharacterSheetDB_matrix = [] 


# Called when the node enters the scene tree for the first time.
func _ready(): 
	var delim = ","
	var newLineDelim = "\n"
		
	## open and read files  
	
	print(file_CharacterSheetDB)
	CharacterSheetDB = loadDB_CharacterSheet(file_CharacterSheetDB)
	var CharacterSheetDB_Lines = CharacterSheetDB.split(newLineDelim, true, 0)
	var CharacterSheetDB_LineEntryCount = CharacterSheetDB_Lines.size()
	for l in range(CharacterSheetDB_LineEntryCount):
		CharacterSheetDB_matrix.append([])
		var CharacterSheetDB_Array = CharacterSheetDB_Lines[l].split(delim, true, 0)
		var CharacterSheetDB_EntryCount = CharacterSheetDB_Array.size()
		for n in range(CharacterSheetDB_EntryCount):
			print(String(l) + ":" + String(n) + ":" + CharacterSheetDB_Array[n]) # Prints n entry
			CharacterSheetDB_matrix[l].append(CharacterSheetDB_Array[n])
	saveDB_CharacterSheet(CharacterSheetDB, file_CharacterSheetDB)
 
func saveDB_CharacterSheet(content, fileName):
	saveFILE(content, fileName ) 

func loadDB_CharacterSheet(fileName):
	var content = loadFile( fileName) 
	return content
 

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
	
	
#icehockey_player_charactersheet_database.gd_csv 
