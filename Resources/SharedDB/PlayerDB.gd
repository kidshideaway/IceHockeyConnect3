extends Node

var path_SharedDBs = "res://Resources/SharedDB/" 
var file_PlayerDB = path_SharedDBs + "icehockey_player_database.gd_csv" 
var PlayerDB = [];
var PlayerDB_matrix = [] ;
	
# Called when the node enters the scene tree for the first time.
func _ready(): 
	pass;
	
func start():
	
	var delim = ","
	var newLineDelim = "\n"
	## open and read files  
	
	print(file_PlayerDB)
	PlayerDB = loadDB_PlayerDB(file_PlayerDB)
	var PlayerDB_Lines = PlayerDB.split(newLineDelim, true, 0)
	var PlayerDB_LineEntryCount = PlayerDB_Lines.size()
	for l in range(PlayerDB_LineEntryCount):
		PlayerDB_matrix.append([])
		var PlayerDB_Array = PlayerDB_Lines[l].split(delim, true, 0)
		var PlayerDB_EntryCount = PlayerDB_Array.size()
		for n in range(PlayerDB_EntryCount): 
			print(String(l) + ":" + String(n) + ":" + PlayerDB_Array[n]) # Prints n entry
			PlayerDB_matrix[l].append(PlayerDB_Array[n])
	saveDB_PlayerDB(PlayerDB, file_PlayerDB)
	  
func get_PlayerDBMatrix():
	return(PlayerDB_matrix.duplicate())	;
	
func loadDB_PlayerDB(fileName):
	var content = loadFile( fileName) 
	return content
	
func saveDB_PlayerDB(content, fileName ):
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
	
#icehockey_player_database.gd_csv 
