extends Node
 

#####
var path_SharedDBs = "res://Resources/SharedDB/" 
var file_LevelSpecs = path_SharedDBs + "levelspecs.gd_csv"
var LevelSpecs  
var LevelSpecs_matrix = [] 
#####

onready var Global = get_node("/root/Global");  
# Called when the node enters the scene tree for the first time.
func _ready(): 
	var delim = ","
	var newLineDelim = "\n"
	
	## open and read files  
	print(file_LevelSpecs)
	LevelSpecs  = loadDB_(file_LevelSpecs)
	var LevelSpecs_Lines  = LevelSpecs .split(newLineDelim, true, 0)
	var LevelSpecs_LineEntryCount = LevelSpecs_Lines.size()
	for l in range(LevelSpecs_LineEntryCount):
		LevelSpecs_matrix.append([])
		var LevelSpecs_Array = LevelSpecs_Lines[l].split(delim, true, 0)
		var LevelSpecs_EntryCount = LevelSpecs_Array.size()
		for n in range(LevelSpecs_EntryCount):
			#id,level,width,height,goal,points,minutes,turns,color,type,reward,amount
			#print(String(l) + ":" + String(n) + ":" + LevelSpecs_Array[n]) # Prints n entry		
			LevelSpecs_matrix[l].append(LevelSpecs_Array[n])
	saveDB_(LevelSpecs, file_LevelSpecs)
	
	
func loadDB_(fileName):
	var content = loadFile( fileName) 
	return content
	
func saveDB_(content, fileName ):
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
