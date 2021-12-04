import 'dart:convert';

import 'package:flutter/foundation.dart';

class RoomModel {
  String idRoom;
  String name;
  List<String> seenByUser;
  String message;
  RoomModel({
    this.idRoom,
    this.name,
    this.seenByUser,
    this.message,
  });

  RoomModel copyWith({
    String idRoom,
    String name,
    List<String> seenByUser,
    String message,
  }) {
    return RoomModel(
      idRoom: idRoom ?? this.idRoom,
      name: name ?? this.name,
      seenByUser: seenByUser ?? this.seenByUser,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idRoom': idRoom,
      'name': name,
      'seenByUser': seenByUser,
      'message': message,
    };
  }

  factory RoomModel.fromMap(Map<String, dynamic> map) {
    return RoomModel(
      idRoom: map['idRoom'],
      name: map['name'],
      seenByUser: List<String>.from(map['seenByUser']),
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RoomModel.fromJson(String source) =>
      RoomModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RoomModel(idRoom: $idRoom, name: $name, seenByUser: $seenByUser, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RoomModel &&
        other.idRoom == idRoom &&
        other.name == name &&
        listEquals(other.seenByUser, seenByUser) &&
        other.message == message;
  }

  @override
  int get hashCode {
    return idRoom.hashCode ^
        name.hashCode ^
        seenByUser.hashCode ^
        message.hashCode;
  }
}
