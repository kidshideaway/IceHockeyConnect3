extends Node

var path_SharedDBs = "res://Resources/SharedDB/" 
var file_TeamDB = path_SharedDBs + "icehockey_team_database.gd_csv"
var TeamDB  
var TeamDB_matrix = [] 

# Called when the node enters the scene tree for the first time.
func _ready(): 
	var delim = ","
	var newLineDelim = "\n"
		
	## open and read files  
	
	print(file_TeamDB)
	TeamDB = loadDB_TeamDB(file_TeamDB)
	var TeamDB_Lines = TeamDB.split(newLineDelim, true, 0)
	var TeamDB_LineEntryCount = TeamDB_Lines.size()
	for l in range(TeamDB_LineEntryCount):
		TeamDB_matrix.append([])
		var TeamDB_Array = TeamDB_Lines[l].split(delim, true, 0)
		var TeamDB_EntryCount = TeamDB_Array.size()
		for n in range(TeamDB_EntryCount):
			print(String(l) + ":" + String(n) + ":" + TeamDB_Array[n]) # Prints n entry
			TeamDB_matrix[l].append(TeamDB_Array[n])
	saveDB_TeamDB(TeamDB, file_TeamDB)
	  
	
func loadDB_TeamDB(fileName):
	var content = loadFile( fileName) 
	return content
	
func saveDB_TeamDB(content, fileName ):
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
	
	 
#icehockey_team_database.gd_csv
