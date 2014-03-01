library ex08;

part 'variables.dart';

void main(){
  
  test(var firstName, var lastName, var members){
    for(var i in members){
      if(i['firstName'] == firstName && i['lastName'] == lastName)
        return true;}
    return false;
  }
 
  additions(var associationName, var firstName, var lastName, var email, var members){
  members.add({
    'associationName': associationName,
    'firstName': firstName,
    'lastName': lastName,
    'email': email});

  firstNameSorting(var members){
  members.sort((a, b) => a['lastName'].compareTo(b['firstName']));
  print("----------------------");  
  print("Additions of entities:");  
  print("----------------------"); 
  printRow(members); print(''); print('');}
  firstNameSorting(members);}

  additions('CS', 'Stanislav', 'Vavra', 'sv@gmail.com', members);
  assert(test('Stanislav', 'Vavra', members));

  
  removal(var firstName, var lastName, var email, var members){
    for(var i = 0; i < members.length; i++){
      if(members[i]['firstName'] == firstName && members[i]['lastName'] == lastName && members[i]['email'] == email){
        members.removeAt(i);}}
  firstNameSorting(var members){
  members.sort((a, b) => a['lastName'].compareTo(b['firstName']));
  print("--------------------");  
  print("Removal of entitity:");  
  print("--------------------"); 
  printRow(members); print(''); print('');}
  firstNameSorting(members);}
  assert(test('David', 'Curtis', members));
  removal('David', 'Curtis', 'dc@gmail.com', members);
  
  update(var associationName, var firstName, var lastName, var email, var members){
    for(var i = 0; i < members.length; i++){
      if(members[i]['firstName'] == firstName && members[i]['lastName'] == lastName){
        members[i]['associationName'] = associationName;
        members[i]['firstName'] = firstName;
        members[i]['lastName'] = lastName;
        members[i]['email'] = email; }}
    firstNameSorting(var members){
      members.sort((a, b) => a['lastName'].compareTo(b['firstName']));
      print("-------------------");  
      print("Update of entitity:");  
      print("-------------------"); 
      printRow(members);}
    firstNameSorting(members);}
  assert(test('Stanislav', 'Vavra', members));
  update(['CS', 'IS'], 'Stanislav', 'Vavra', 'sv@gmail.com', members);
   
}