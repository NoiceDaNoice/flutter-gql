const String getAllUsersQuery = r"""
query getAllUsersQuery{
  persons {
    id,
    name,
    lastName,
    age
  }
}
""";

String deletePersonQuery(String id) {
  return """ 
        mutation deletePerson{
          deletePerson(id:"$id") {
            id,
            name,
            lastName,
            age
          }
        }
        """;
}

String addPersonQuery(String id, String name, String lastName, int age) {
  return '''
            mutation addPersonQuery{
              addPerson(id:"$id",name:"$name",lastName:"$lastName",age:$age) {
                id,
                name,
                lastName,
                age
              }
              
            }
        ''';
}

String editPersonQuery(String id, String name, String lastName, int age) {
  return """
        mutation editPerson{
          editPerson(id:"$id",name:"$name",lastName:"$lastName",age:$age) {
            id,
            name,
            lastName,
            age
          }
          
        }
        """;
}
