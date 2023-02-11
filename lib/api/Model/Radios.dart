/// id : 10
/// name : "إذاعة الزين محمد أحمد"
/// url : "https://Qurango.net/radio/alzain_mohammad_ahmad"

class Radios {
  Radios({
    this.id,
    this.name,
    this.url,
  });

  Radios.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  num? id;
  String? name;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['url'] = url;
    return map;
  }
}
