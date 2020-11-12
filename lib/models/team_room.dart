import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_versionone/models/participants.dart';

class TeamRoomContainer {
  List<TeamRoomName> roomNames;

  TeamRoomContainer({this.roomNames});

  TeamRoomContainer.fromJson(List<dynamic> json) {
    roomNames = List<TeamRoomName>();
    json[0].forEach((f) => roomNames.add(TeamRoomName.fromJson(f)));
  }
}

class TeamRoomName {
  String teamRoomOid;
  String teamName;
  Uint8List mascotContent;
  Participants participant;

  TeamRoomName(
      {this.teamRoomOid, this.teamName, this.mascotContent, this.participant});

  TeamRoomName.fromJson(Map<String, dynamic> json) {
    teamRoomOid = json['_oid'] ?? '';

    teamName = json['Team.Name'] ?? '';
    mascotContent = json['Mascot.Content'] == null
        ? Uint8List(0)
        : base64Decode(json['Mascot.Content']);
    participant = Participants.fromJson(json['Participants']);
  }
}
