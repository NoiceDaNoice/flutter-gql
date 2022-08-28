import 'package:equatable/equatable.dart';

class DataModel extends Equatable {
  DataModel({
    this.typename,
    this.persons,
  });

  String? typename;
  List<Person>? persons;

  factory DataModel.fromJson(Map<String, dynamic> json) {
    var list = json['persons'] as List;
    print(list.runtimeType);
    List<Person> personList = list.map((i) => Person.fromJson(i)).toList();
    return DataModel(
      typename: json['__typename'],
      persons: personList,
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [
        typename,
        persons,
      ];
}

class Person extends Equatable {
  Person({
    this.typename,
    this.id,
    this.name,
    this.lastName,
    this.age,
  });

  String? typename;
  String? id;
  String? name;
  String? lastName;
  int? age;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        typename: json['__typename'],
        id: json['id'],
        name: json['name'],
        lastName: json['lastName'],
        age: json['age'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        typename,
        id,
        name,
        lastName,
        age,
      ];
}
