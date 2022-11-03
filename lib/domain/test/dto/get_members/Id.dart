/// name : "PPS"
/// value : "6975372T"

class Id {
  Id({
      String? name, 
      String? value,}){
    _name = name;
    _value = value;
}

  Id.fromJson(dynamic json) {
    _name = json['name'];
    _value = json['value'];
  }
  String? _name;
  String? _value;

  String? get name => _name;
  String? get value => _value;

  Map<String, dynamic>? toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['value'] = _value;
    return map;
  }

}