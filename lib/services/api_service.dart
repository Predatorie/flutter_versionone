import 'package:flutter_versionone/models/activity_stream.dart';
import 'package:flutter_versionone/models/member_workitems.dart';
import 'package:flutter_versionone/models/members.dart';
import 'package:flutter_versionone/models/team.dart';
import 'package:flutter_versionone/models/team_room.dart';

abstract class ApiService {
  Future<Member> login(String username, String password);
  Future<Member> currentMember();

  Future<void> logout();

  Future<TeamRoomContainer> allTeamWithMembers();
  Future<TeamRoomContainer> allTeamRooms();
  Future<TeamMemberDetails> getTeamMembersInfo(String teamName);

  Future<MemberWorkItems> memberWorkItemsBySprint(String sprint);

  Future<ActivityStream> activityStreamTeam(String oid);
  Future<ActivityStream> activityStreamMember(String oid);
}
