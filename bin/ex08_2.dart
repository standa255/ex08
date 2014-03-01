library ex08;

part 'variables.dart';

void main(){
 
  lastNameSorting(var members){
  members.sort((a, b) => a['lastName'].compareTo(b['lastName']));
  print("-----------------------------------");  
  print("List of members sorts by last name:"); 
  print("-----------------------------------"); 
  printRow(members); print(''); print('');}
  lastNameSorting(members);
  
  firstNameSorting(var members){
  members.sort((a, b) => a['lastName'].compareTo(b['firstName']));
  print("------------------------------------");  
  print("List of members sorts by first name:");  
  print("------------------------------------"); 
  printRow(members); print(''); print('');}
  firstNameSorting(members);
  
  lastNameStartsR(var members, var letter){
    print("------------------------------------------------------"); 
    print("Only members whose last name starts with a letter 'R':"); 
    print("------------------------------------------------------"); 
    for(var i in members){
      if(i['lastName'][0] == letter)
        print(i);}}
  lastNameStartsR(members, 'R');
  }