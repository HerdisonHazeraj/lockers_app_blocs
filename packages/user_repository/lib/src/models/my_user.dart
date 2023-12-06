import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entities/entities.dart';

class MyUser extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? picture;
  final String? phone;

  const MyUser({
    required this.id,
    required this.email,
    required this.name,
    this.picture,
    this.phone,
  });

  static const empty = MyUser(
    id: '',
    email: '',
    name: '',
    picture: '',
    phone: '',
  );

  MyUser copyWith({
    String? id,
    String? email,
    String? name,
    String? picture,
    String? phone,
  }) {
    return MyUser(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      picture: picture ?? this.picture,
      phone: phone ?? this.phone,
    );
  }

  MyUserEntity toEntity() {
    return MyUserEntity(
      id: id,
      email: email,
      name: name,
      picture: picture,
      phone: phone,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      picture: entity.picture,
      phone: entity.phone,
    );
  }

  bool get isEmpty => this == MyUser.empty;
  bool get isNotEmpty => this != MyUser.empty;

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        picture,
        phone,
      ];
}
