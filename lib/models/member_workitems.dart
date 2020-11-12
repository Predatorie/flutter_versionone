import 'dart:convert';
import 'dart:typed_data';

class MemberWorkItems {
  List<MemberWorkItem> membersItems;

  MemberWorkItems({this.membersItems});

  MemberWorkItems.fromJson(List<dynamic> json) {
    membersItems = List<MemberWorkItem>();
    json.forEach((f) => membersItems.add(MemberWorkItem.fromJson(f)));
  }
}

class MemberWorkItem {
  String oid;
  String name;
  Uint8List avatarContent;
  String username;
  String email;
  String phone;
  List<Actuals> actuals;

  MemberWorkItem(
      {this.oid,
      this.name,
      this.avatarContent,
      this.username,
      this.email,
      this.phone,
      this.actuals});

  MemberWorkItem.fromJson(Map<String, dynamic> json) {
    oid = json['_oid'];
    name = json['Name'];
    avatarContent = json['Avatar.Content'] == null
        ? 0
        : base64Decode(json['Avatar.Content']);
    username = json['Username'];
    email = json['Email'];
    phone = json['Phone'];
    if (json['Actuals'] != null) {
      actuals = new List<Actuals>();
      json['Actuals'].forEach((v) {
        actuals.add(new Actuals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_oid'] = this.oid;
    data['Name'] = this.name;
    data['Avatar.Content'] = this.avatarContent;
    data['Username'] = this.username;
    data['Email'] = this.email;
    data['Phone'] = this.phone;
    if (this.actuals != null) {
      data['Actuals'] = this.actuals.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Actuals {
  String oid;
  String workitemAssetType;
  String workitemName;
  String workitemDescription;
  String workitemDetailEstimate;
  String workitemToDo;
  String workitemAssetState;
  String timeboxName;

  Actuals(
      {this.oid,
      this.workitemAssetType,
      this.workitemName,
      this.workitemDescription,
      this.workitemDetailEstimate,
      this.workitemToDo,
      this.workitemAssetState,
      this.timeboxName});

  Actuals.fromJson(Map<String, dynamic> json) {
    oid = json['_oid'];
    workitemAssetType = json['Workitem.AssetType'];
    workitemName = json['Workitem.Name'];
    workitemDescription = json['Workitem.Description'];
    workitemDetailEstimate = json['Workitem.DetailEstimate'];
    workitemToDo = json['Workitem.ToDo'];
    workitemAssetState = json['Workitem.AssetState'];
    timeboxName = json['Timebox.Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_oid'] = this.oid;
    data['Workitem.AssetType'] = this.workitemAssetType;
    data['Workitem.Name'] = this.workitemName;
    data['Workitem.Description'] = this.workitemDescription;
    data['Workitem.DetailEstimate'] = this.workitemDetailEstimate;
    data['Workitem.ToDo'] = this.workitemToDo;
    data['Workitem.AssetState'] = this.workitemAssetState;
    data['Timebox.Name'] = this.timeboxName;
    return data;
  }
}
