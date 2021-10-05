import 'dart:convert';

class User {
  final String id;
  String username;
  String token;
  String phone;
  String image;
  User({
    this.id,
    this.username,
    this.token,
    this.phone,
    this.image,
  });
  factory User.fromLogin(Map<String, dynamic> data) {
    return User(
      token: data['token'],
      // role: data['role'],
    );
  }
  User copyWith({
    String id,
    String username,
    String token,
    String phone,
    String image,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      token: token ?? this.token,
      phone: phone ?? this.phone,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'username': username,
      'token': token,
      'phone': phone,
      'image': image,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'],
      username: map['username'],
      token: map['token'],
      phone: map['phone'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, username: $username, token: $token, phone: $phone, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.username == username &&
        other.token == token &&
        other.phone == phone &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        token.hashCode ^
        phone.hashCode ^
        image.hashCode;
  }
}
