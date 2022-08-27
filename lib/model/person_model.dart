import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class PersonModel extends Equatable {
  PersonModel({
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

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        typename: json['typename'],
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
