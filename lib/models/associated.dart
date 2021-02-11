import 'package:hcslzapp/models/dependent.dart';
import 'package:hcslzapp/models/motorcycle.dart';

class Associated {
  final int id;
  String name;
  String email;
  String phone;
  String sponsor;
  String cnh;
  String cpf;
  String bloodType;
  String associatedType;
  String dateBirth;
  String dateShield;
  String status;
  List<Dependent> dependents;
  List<Motorcycle> motorcycles;

  Associated(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.sponsor,
      this.cnh,
      this.cpf,
      this.bloodType,
      this.associatedType,
      this.dateBirth,
      this.dateShield,
      this.status,
      this.dependents,
      this.motorcycles});

  Associated.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        phone = json['phone'],
        sponsor = json["sponsor"],
        cnh = json['cnh'],
        cpf = json['cpf'],
        bloodType = json['bloodType'],
        associatedType = json['associatedType'],
        dateBirth = json['dateBirth'],
        dateShield = json['dateShield'],
        status = json['status'],
        dependents = List.from((json['dependents'] as List)
            .map((dependents) => Dependent.fromJson(dependents))),
        motorcycles = List.from((json['motorcycles'] as List)
            .map((motorcycles) => Motorcycle.fromJson(motorcycles)));

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'sponsor': sponsor,
        'cnh': cnh,
        'cpf': cpf,
        'bloodType': bloodType,
        'associatedType': associatedType,
        'dateBirth': dateBirth,
        'dateShield': dateShield,
        'status': status,
        'dependents': List<dynamic>.from(
            dependents.map((dependents) => dependents.toJson())),
        'motorcycles': List<dynamic>.from(
            motorcycles.map((motorcycles) => motorcycles.toJson())),
      };

  @override
  String toString() {
    return 'Associated{id: $id, name: $name, email: $email, phone: $phone, '
        'cnh: $cnh, cpf: $cpf, '
        'bloodType: $bloodType, dateBirth: $dateBirth, '
        'dateShield: $dateShield, status: $status, '
        'dependents: $dependents, motorcycles: $motorcycles}';
  }
}
