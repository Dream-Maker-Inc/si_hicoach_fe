import 'name.dart';
import 'id.dart';

/// gender : "female"
/// name : {"title":"Ms","first":"Holly","last":"Bell"}
/// id : {"name":"PPS","value":"6975372T"}

class Results {
  Results({
    String? gender,
    Name? name,
    Id? id,
  }) {
    _gender = gender;
    _name = name;
    _id = id;
  }

  Results.fromJson(dynamic json) {
    _gender = json['gender'];
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
    _id = json['id'] != null ? Id.fromJson(json['id']) : null;
  }

  String? _gender;
  Name? _name;
  Id? _id;

  String? get gender => _gender;

  Name? get name => _name;

  Id? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gender'] = _gender;
    if (_name != null) {
      map['name'] = _name?.toJson();
    }
    if (_id != null) {
      map['id'] = _id?.toJson();
    }
    return map;
  }
}
