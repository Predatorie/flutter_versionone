import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_versionone/models/activity_stream.dart';
import 'package:flutter_versionone/models/member_workitems.dart';
import 'package:flutter_versionone/models/members.dart';
import 'package:flutter_versionone/models/team.dart';
import 'package:flutter_versionone/models/team_room.dart';
import 'package:flutter_versionone/secrets.dart';
import 'package:flutter_versionone/services/api_service.dart';
import 'package:get/get.dart';

class VersionOneService extends GetxService implements ApiService {
  final Dio dio;
  final FlutterSecureStorage storage;

  VersionOneService({
    @required this.dio,
    @required this.storage,
  }) : assert(dio != null || storage != null);

  @override
  Future<Member> login(String username, String password) async {
    var options = BaseOptions(
      baseUrl: Secrets.baseUrl,
      connectTimeout: 10000,
      receiveTimeout: 100000,
      headers: {
        'Basic': base64.encode(utf8.encode("$username:$password")),
        HttpHeaders.authorizationHeader: "${Secrets.versionOneApiKey}"
      },
      responseType: ResponseType.json,
    );

    var data = {
      'from': 'Member',
      'select': [
        'Name',
        'IsLoginDisabled',
        'Avatar.Content',
        'Username',
        'Email',
        'Phone'
      ],
      'where': {'Username': '$username'}
    };

    this.dio.options = options;

    try {
      var response = await dio.post('/${Secrets.queryEndpoint}', data: data);

      if (response.statusCode == 200) {
        // V1 returns a list of list.
        Map<String, dynamic> map = response.data[0][0];

        var member = Member.fromJson(map);

        await this.storeCurrentMember(member);

        return member;
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }

      throw (e);
    }

    return null;
  }

  @override
  Future<Member> currentMember() async {
    try {
      var map = await storage.readAll();
      var member = Member();

      member.oid = map['oid'];
      member.userName = map['userName'];
      member.avatar = base64.decode(map['avatar']);
      member.email = map['email'];
      member.name = map['name'];
      member.phone = map['phone'];
      member.isLoginEnabled = map['isLoginEnabled'];

      return member;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await storage.write(key: 'oid', value: '');
      await storage.write(key: 'avatar', value: '');
      await storage.write(key: 'email', value: '');
      await storage.write(key: 'name', value: '');
      await storage.write(key: 'userName', value: '');
      await storage.write(key: 'phone', value: '');
      await storage.write(key: 'isLoginEnabled', value: '');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> storeCurrentMember(Member member) async {
    try {
      await storage.write(key: 'oid', value: member.oid);
      await storage.write(
          key: 'avatar', value: base64.encode(member.avatar).toString());
      await storage.write(key: 'email', value: member.email);
      await storage.write(key: 'name', value: member.name);
      await storage.write(key: 'userName', value: member.userName);
      await storage.write(
          key: 'phone', value: member?.phone ?? 'no phone on record');
      await storage.write(key: 'isLoginEnabled', value: member.isLoginEnabled);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<TeamRoomContainer> allTeamWithMembers() async {
    var data = {
      "from": "TeamRoom",
      "select": [
        "Name",
        "Team",
        "Team.Name",
        "Mascot.Content",
        {
          "from": "Participants",
          "select": ["Name", "Phone", "Email", "Username", "Avatar.Content"]
        }
      ],
      "where": ["AssetState='Active'"]
    };

    this.dio.options = _baseOptions();

    try {
      var response = await dio.post('/${Secrets.queryEndpoint}', data: data);

      if (response.statusCode == 200) {
        var result = TeamRoomContainer.fromJson(response.data);
        return result;
      }
    } on DioError catch (_) {
      return null;
    }

    return null;
  }

  @override
  Future<MemberWorkItems> memberWorkItemsBySprint(String sprint) async {
    var data = {
      "from": "Member",
      "select": [
        "Name",
        "Avatar.Content",
        "Username",
        "Email",
        "Phone",
        {
          "from": "Actuals",
          "select": [
            "Workitem.AssetType",
            "Workitem.Name",
            "Workitem.Description",
            "Workitem.DetailEstimate",
            "Workitem.ToDo",
            "Workitem.AssetState",
            "Timebox.Name"
          ],
          "filter": "Timebox.Name='Sprint $sprint'"
        }
      ]
    };

    this.dio.options = _baseOptions();

    try {
      var response = await dio.post('/${Secrets.queryEndpoint}', data: data);

      if (response.statusCode == 200) {
        var memberWorkitems = MemberWorkItems.fromJson(response.data);
        return memberWorkitems;
      }
    } on DioError catch (_) {
      return null;
    }

    return null;
  }

  @override
  Future<ActivityStream> activityStreamMember(String oid) async {
    var url = '/${Secrets.activityStreamEndpoint}/Member:$oid';

    var options = BaseOptions(
      baseUrl: Secrets.baseUrl,
      connectTimeout: 10000,
      receiveTimeout: 100000,
      headers: {HttpHeaders.authorizationHeader: "${Secrets.versionOneApiKey}"},
      contentType: 'json',
      responseType: ResponseType.json,
    );

    this.dio.options = options;

    try {
      var response = await dio.post(url);

      if (response.statusCode == 200) {
        var activityStream = ActivityStream.fromJson(response.data);
        return activityStream;
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }

      return null;
    }

    return null;
  }

  @override
  Future<ActivityStream> activityStreamTeam(String oid) {
    // Team:10038
    // Team:
    var url = '/${Secrets.activityStreamEndpoint}/Team:$oid';
    return null;
  }

  /// Gets all team members for the given team
  @override
  Future<TeamMemberDetails> getTeamMembersInfo(String teamName) async {
    var query = {
      "filter": ["MemberLabel.Name='$teamName'"],
      "from": "MemberLabel",
      "select": [
        {
          "from": "Members",
          "select": [
            "Name",
            "Email",
            "Avatar.Content",
            "Phone",
            "Username",
            "LastAccessDate",
            "MemberLabels.Name"
          ],
          "filter": "IsInactive='False'"
        }
      ]
    };

    var data = {
      "filter": "Team.Name='$teamName'",
      "from": "TeamRoom",
      "select": [
        "Name",
        {
          "from": "Participants",
          "select": ["Name", "Phone", "Email", "Username", "Avatar.Content"]
        }
      ]
    };

    this.dio.options = _baseOptions();

    try {
      var response = await dio.post('/${Secrets.queryEndpoint}', data: query);

      if (response.statusCode == 200) {
        // V1 returns a list of list.
        Map<String, dynamic> map = response.data[0][0];
        var teamRoomMembers = TeamMemberDetails.fromJson(map['Members'][0]);
        return teamRoomMembers;
      }
    } on DioError catch (_) {
      return null;
    }

    return null;
  }

  /// gets all the team names
  @override
  Future<TeamRoomContainer> allTeamRooms() async {
    var data = {
      "from": "TeamRoom",
      "select": [
        "Name",
        "Team",
        "Team.Name",
        "Mascot.Content",
        {
          "from": "Participants",
          "select": [
            "Name",
          ]
        }
      ]
    };

    this.dio.options = _baseOptions();
    try {
      var response = await dio.post('/${Secrets.queryEndpoint}', data: data);

      if (response.statusCode == 200) {
        var teamNames = TeamRoomContainer.fromJson(response.data);
        return teamNames;
      }
    } on DioError catch (_) {
      return null;
    }

    return null;
  }

  BaseOptions _baseOptions() {
    return BaseOptions(
      baseUrl: Secrets.baseUrl,
      connectTimeout: 10000,
      receiveTimeout: 100000,
      headers: {HttpHeaders.authorizationHeader: "${Secrets.versionOneApiKey}"},
      responseType: ResponseType.json,
    );
  }

  Future<VersionOneService> init() async {
    print('$runtimeType ready!');
    return this;
  }
}
