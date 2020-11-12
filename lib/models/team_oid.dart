class TeamOid {
  String oid;

  TeamOid({this.oid});

  TeamOid.fromJson(Map<String, dynamic> json) {
    this.oid = json['_oid'];
  }
}
