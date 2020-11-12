import 'dart:convert';
import 'dart:typed_data';

class MembersCollection {
  List<Member> members;

  MembersCollection({this.members});

  MembersCollection.fromJson(Map<String, dynamic> json) {
    members = List<Member>();

    var result = json['Members'];
    result.forEach((m) => members.add(Member.fromJson(m)));
  }
}

class Member {
  String oid;
  String userName;
  Uint8List avatar;
  String email;
  String name;
  String phone;
  String isLoginEnabled;
  String password;

  Member(
      {this.oid,
      this.userName,
      this.avatar,
      this.email,
      this.name,
      this.phone,
      this.isLoginEnabled,
      this.password});

  Member.fromJson(Map<String, dynamic> map) {
    oid = map['_oid'];
    name = map['Name'];
    isLoginEnabled = map['IsLoginDisabled'];
    avatar = map['Avatar.Content'] == null
        ? Uint8List(0)
        : base64Decode(map['Avatar.Content']);
    userName = map['Username'];
    email = map['Email'] ?? 'no email on file.';
    phone = map['Phone'] ?? 'no phone on file.';
  }

  Member.fromDevice(Map<String, dynamic> json)
      : oid = json['_oid'] ?? '',
        name = json['Name'] ?? '',
        isLoginEnabled = json['IsLoginDisabled'] ?? '',
        avatar = json['Avatar.Content'] ?? Uint8List(0),
        userName = json['Username'],
        email = json['Email'],
        phone = json['Phone'],
        password = json['Password'];

  Map<String, dynamic> toDevice() => {
        '_oid': oid,
        'Name': name,
        'IsLoginDisabled': isLoginEnabled,
        'Avatar.Content': avatar,
        'Username': userName,
        'Email': email,
        'Phone': phone,
        'Password': password
      };
}
