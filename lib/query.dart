const String getAllUsersQuery = """
query test{
  persons {
    id,
    name,
    lastName,
    age
  }
}
""";

const String deletePerson = """ 
mutation{
  deletePerson(id:\$id) {
    id,
    name,
    lastName,
    age
  }
}
""";


const String addPerson = """
mutation{
  addPerson(id:\$id,name:\$name,lastName:\$lastName,age:\$age) {
    id,
    name,
    lastName,
    age
  }
  
}
""";


const String editPerson = """
mutation{
  editPerson(id:\$id,name:\$name,lastName:\$lastName,age:\$age) {
    id,
    name,
    lastName,
    age
  }
  
}
""";
