class FacebookUser {
  String _name;
  String _firstName;
  String _lastName;
  String _email;
  String _id;

  String get name => _name;

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get email => _email;

  String get id => _id;

  FacebookUser(
      {String name,
      String firstName,
      String lastName,
      String email,
      String id}) {
    _name = name;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _id = id;
  }

  FacebookUser.fromJson(dynamic json) {
    _name = json["name"];
    _firstName = json["firstName"];
    _lastName = json["lastName"];
    _email = json["email"];
    _id = json["id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["firstName"] = _firstName;
    map["lastName"] = _lastName;
    map["email"] = _email;
    map["id"] = _id;
    return map;
  }
}
