part of ex08;

var adjectives = ['Big', 'Sunny', 'Quick', 'Smooth', 'Slow', 'Stupid', 'Smelly',];
var nouns = ['car', 'cat', 'bag', 'pen', 'notebook', 'watch', 'snow',];
var verbs = ['does', 'runs', 'executes', 'studies', 'falls', 'stops', 'snows',];
var adverbs = ['well', 'likely', 'badly', 'quickly', 'fiercely', 'nicely', 'expertly',];

var members = [
  {"associationName": "IS", "firstName": "Dzenan", "lastName": "Ridjanovic", "email": "dr@gmail.com"},
  {"associationName": "CS", "firstName": "David", "lastName": "Curtis", "email": "dc@gmail.com"},
  {"associationName": "IS", "firstName": "Robert", "lastName": "Nelson", "email": "rn@gmail.com"}];

var associations = [
  {"name": "IS", "description": "Information Systems"},
  {"name": "CS", "description": "Computer Science"}];

var givenMatrix = [
['1', '0', '0', '1'],
['0', '1', '1', '0'],
['0', '0', '1', '0'],
['1', '0', '1', '0'],
['1', '0', '1', '0'],
['1', '0', '0', '1']];


printRow(var row){
  for(var i in row){
print(i);}
}