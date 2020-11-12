abstract class Queries {
  static String member =
      "{ 'from': 'Member', 'select': ['Name','IsLoginDisabled','Avatar.Content',Username','Email','Phone'], 'where': "
      "{ 'Username': '{0}' } }";

  static String memberWorkItemsBySprint =
      "{ 'from': 'Member', 'select': [ 'Name', 'Avatar.Content', 'Username', 'Email', 'Phone', {"
      " 'from': 'Actuals', 'select': [ 'Workitem.AssetType', 'Workitem.Name', 'Workitem.Description', "
      " 'Workitem.DetailEstimate', 'Workitem.ToDo', 'Workitem.AssetState', 'Timebox.Name' ], "
      " 'filter': 'Timebox.Name='{0}' } ] }";
}
