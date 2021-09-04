// To parse this JSON data, do
//
//     final employee = employeeFromJson(jsonString);

import 'dart:convert';

List<Employee> employeeFromJson(String str) =>
    List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

class EmployeeModel {
  EmployeeModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.profileImage,
    this.address,
    this.phone,
    this.website,
    this.company,
  });
  int id;
  String name;
  String username;
  String email;
  String profileImage;
  Address address;
  String phone;
  String website;
  Company company;
}

class Employee {
  Employee({
    this.id,
    this.name,
    this.username,
    this.email,
    this.profileImage,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  int id;
  String name;
  String username;
  String email;
  String profileImage;
  Address address;
  String phone;
  String website;
  Company company;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        profileImage:
            json["profile_image"] == null ? null : json["profile_image"],
        address: Address.fromJson(json["address"]),
        phone: json["phone"] == null ? null : json["phone"],
        website: json["website"] == null ? null : json["website"],
        company:
            json["company"] == null ? null : Company.fromJson(json["company"]),
      );
}

class Address {
  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromJson(json["geo"]),
      );
}

class Geo {
  Geo({
    this.lat,
    this.lng,
  });

  String lat;
  String lng;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );
}

class Company {
  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  String name;
  String catchPhrase;
  String bs;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"] ?? '',
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );
}
