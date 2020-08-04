extends Node

var path_SharedDBs = "res://Resources/SharedDB/" 
var file_TeamGameStatsDB = path_SharedDBs + "icehockey_team_gamestats_database.gd_csv"
var TeamGameStatsDB  
var TeamGameStatsDB_matrix = [] 

# Called when the node enters the scene tree for the first time.
func _ready(): 
	var delim = ","
	var newLineDelim = "\n"
		
	## open and read files  
	
	print(file_TeamGameStatsDB)
	TeamGameStatsDB = loadDB_TeamGameStatsDB(file_TeamGameStatsDB)
	var TeamGameStatsDB_Lines = TeamGameStatsDB.split(newLineDelim, true, 0)
	var TeamGameStatsDB_LineEntryCount = TeamGameStatsDB_Lines.size()
	for l in range(TeamGameStatsDB_LineEntryCount):
		TeamGameStatsDB_matrix.append([])
		var TeamGameStatsDB_Array = TeamGameStatsDB_Lines[l].split(delim, true, 0)
		var TeamGameStatsDB_EntryCount = TeamGameStatsDB_Array.size()
		for n in range(TeamGameStatsDB_EntryCount):
			print(String(l) + ":" + String(n) + ":" + TeamGameStatsDB_Array[n]) # Prints n entry
			TeamGameStatsDB_matrix[l].append(TeamGameStatsDB_Array[n])
	saveDB_TeamGameStatsDB(TeamGameStatsDB, file_TeamGameStatsDB)
	  
	
func loadDB_TeamGameStatsDB(fileName):
	var content = loadFile( fileName) 
	return content
	
func saveDB_TeamGameStatsDB(content, fileName ):
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
	
	 
#icehockey_team_gamestats_database.gd_csv
