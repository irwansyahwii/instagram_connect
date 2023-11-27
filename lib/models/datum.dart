
import 'package:com.ice.instagramconnect/models/value.dart';

class Datum {
    String name;
    String period;
    List<Value> values;
    String title;
    String description;
    String id;

    Datum({
        required this.name,
        required this.period,
        required this.values,
        required this.title,
        required this.description,
        required this.id,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        period: json["period"],
        values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
        title: json["title"],
        description: json["description"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "period": period,
        "values": List<dynamic>.from(values.map((x) => x.toJson())),
        "title": title,
        "description": description,
        "id": id,
    };
}