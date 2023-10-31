class DataIds {
    List<Datum> data;

    DataIds({
        required this.data,
    });

    factory DataIds.fromJson(Map<String, dynamic> json) => DataIds(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;

    Datum({
        required this.id,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}
