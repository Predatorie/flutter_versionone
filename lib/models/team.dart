import 'dart:convert';
import 'dart:typed_data';

class Members {
  List<TeamMember> members;

  String oid;

  String userName;

  Uint8List avatar;

  String email;

  String name;

  String phone;

  String isLoginEnabled;

  Members({this.members});

  Members.fromJson(List<dynamic> data) {
    members = List<TeamMember>();
    data.forEach((f) => members.add(TeamMember.fromJson(f)));
  }
}

class TeamMember {
  TeamMemberDetails memberDetails;

  TeamMember({this.memberDetails});

  TeamMember.fromJson(List<dynamic> data) {
    try {
      // var map = data[0];

      // oid = map['_oid'];
      memberDetails = TeamMemberDetails.fromJson(data[0]);
    } catch (_) {}
  }
}

class TeamMemberDetails {
  String oid;
  String name;
  String isLoginEnabled;
  Uint8List avatar;
  String userName;
  String email;
  String phone;

  TeamMemberDetails(
      {this.oid,
      this.name,
      this.isLoginEnabled,
      this.avatar,
      this.userName,
      this.email,
      this.phone});

  TeamMemberDetails.fromJson(Map<String, dynamic> map) {
    oid = map['_oid'];
    name = map['Name'];
    isLoginEnabled = 'true';
    avatar = map['Avatar.Content'] == null
        ? Uint8List(0)
        : base64Decode(map['Avatar.Content']);
    userName = map['Username'];
    email = map['Email'] ?? 'no email on file.';
    phone = map['Phone'] ?? 'no phone on file.';
  }
}
