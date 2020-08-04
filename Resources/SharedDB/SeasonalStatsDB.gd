extends Node

var path_SharedDBs = "res://Resources/SharedDB/"
var file_SeasonalStatsDB = path_SharedDBs + "icehockey_seasonal_database.gd_csv" 
var SeasonalStatsDB
var SeasonalStatsDB_matrix = [] 

# Called when the node enters the scene tree for the first time.
func _ready(): 
	var delim = ","
	var newLineDelim = "\n"
		
	## open and read files 
 
	print(file_SeasonalStatsDB)
	SeasonalStatsDB = loadDB_SeasonalStatsDB(file_SeasonalStatsDB)
	var SeasonalStatsDB_Lines = SeasonalStatsDB.split(newLineDelim, true, 0)
	var SeasonalStatsDB_LineEntryCount = SeasonalStatsDB_Lines.size()
	for l in range(SeasonalStatsDB_LineEntryCount):
		SeasonalStatsDB_matrix.append([])
		var SeasonalStatsDB_Array = SeasonalStatsDB_Lines[l].split(delim, true, 0)
		var SeasonalStatsDB_EntryCount = SeasonalStatsDB_Array.size()
		for n in range(SeasonalStatsDB_EntryCount):
			print(String(l) + ":" + String(n) + ":" + SeasonalStatsDB_Array[n]) # Prints n entry
			SeasonalStatsDB_matrix[l].append(SeasonalStatsDB_Array[n])
	saveDB_SeasonalStatsDB(SeasonalStatsDB, file_SeasonalStatsDB)
	 
func loadDB_SeasonalStatsDB( fileName): 
	var content = loadFile( fileName) 
	return content
	
func saveDB_SeasonalStatsDB(content, fileName ):
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
	 
	
#icehockey_seasonal_database.gd_csv
