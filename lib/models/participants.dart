import 'dart:convert';
import 'dart:typed_data';

class Participants {
  List<Participant> list;

  Participants({this.list});

  Participants.fromJson(List<dynamic> json) {
    list = List<Participant>();
    json.forEach((f) => list.add(Participant.fromJson(f)));
  }
}

class Participant {
  String oid;
  String name;
  String phone;
  String email;
  String username;
  Uint8List avatarContent;

  Participant({
    this.oid,
    this.name,
    this.phone,
    this.email,
    this.username,
    this.avatarContent,
  });

  static Participant fromJson(Map<String, dynamic> json) {
    return Participant(
      oid: json['_oid'],
      name: json['Name'],
      phone: json['Phone'] ?? 'no phone on file.',
      email: json['Email'] ?? 'no email on file.',
      username: json['Username'],
      avatarContent: json['Avatar.Content'] == null
          ? Uint8List(0)
          : base64Decode(json['Avatar.Content']),
    );
  }

  Map<String, dynamic> toJson() => {
        '_oid': oid,
        'Name': name,
        'Phone': phone,
        'Email': email,
        'Username': username,
        'Avatar.Content': avatarContent,
      };
}
