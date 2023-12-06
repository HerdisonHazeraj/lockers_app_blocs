import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? picture;
  final String? phone;

  const MyUserEntity({
    required this.id,
    required this.email,
    required this.name,
    this.picture,
    this.phone,
  });

  Map<String, Object?> toDocument() => {
        'id': id,
        'email': email,
        'name': name,
        'picture': picture,
        'phone': phone,
      };

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      id: doc['id'] as String,
      email: doc['email'] as String,
      name: doc['name'] as String,
      picture: doc['picture'] as String?,
      phone: doc['phone'] as String?,
    );
  }

  @override
  String toString() {
    return '''MyUserEntity: {
      id: $id
      email: $email
      name: $name
      picture: $picture
      phone: $phone
    }''';
  }

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        picture,
        phone,
      ];
}
