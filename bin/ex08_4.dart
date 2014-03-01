library ex08;

part 'variables.dart';

void main(){
  
  boolMatrix(var a, var b, var ab){
  var bMatrix = new List<List<bool>>.generate(b, (_) => new List<bool>.filled(a, ab), growable: false);
  return bMatrix;
}
  searchingConnections(var a, var b, var matrix, var bMatrix, var islands){
    if(    0 <= a && a < matrix.length
        && 0 <= b && b < matrix[0].length){
      if(bMatrix[a][b] == false){
        bMatrix[a][b] = true;
        if(matrix[a][b] == '1'){
          matrix[a][b] = islands;
          searchingConnections(a-1, b-1, matrix, bMatrix, islands);
          searchingConnections(a-1, b,   matrix, bMatrix, islands);
          searchingConnections(a-1, b+1, matrix, bMatrix, islands);
          searchingConnections(a,   b-1, matrix, bMatrix, islands);
          searchingConnections(a,   b+1, matrix, bMatrix, islands);
          searchingConnections(a+1, b-1, matrix, bMatrix, islands);
          searchingConnections(a+1, b,   matrix, bMatrix, islands);
          searchingConnections(a+1, b+1, matrix, bMatrix, islands);}}}
  }

connections(var conMat){
  var island = 'abcdefghijklmnopqrstvuwxyz';
  var index = 0;
  var currentIsland = island[index];
  var boolMat = boolMatrix(conMat[0].length, conMat.length, false);
  print("-------------");  
  print("Given matrix:");  
  print("-------------"); 
  printRow(conMat); print(''); print('');

  for(var i = 0; i < conMat.length; i++){
    for(var j = 0; j < conMat[i].length; j++){
      if(conMat[i][j] == '1'){
        searchingConnections(i ,j, conMat, boolMat, currentIsland);
        index++;
        currentIsland = island[index];}}}
  print("-------------------------------------------------------------------");  
  print("Matrix with marked islands:"); 
  print("Each unique letter or groupe of same letters constitute one island.");
  print("-------------------------------------------------------------------"); 
  printRow(conMat);
}
connections(givenMatrix);
}

