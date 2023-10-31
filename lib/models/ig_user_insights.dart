class IgUserInsights {
    List<Datum> data;
    Paging paging;

    IgUserInsights({
        required this.data,
        required this.paging,
    });

    factory IgUserInsights.fromJson(Map<String, dynamic> json) => IgUserInsights(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        paging: Paging.fromJson(json["paging"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "paging": paging.toJson(),
    };
}

class Datum {
    String name;
    String period;
    String title;
    String description;
    TotalValue totalValue;
    String id;

    Datum({
        required this.name,
        required this.period,
        required this.title,
        required this.description,
        required this.totalValue,
        required this.id,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        period: json["period"],
        title: json["title"],
        description: json["description"],
        totalValue: TotalValue.fromJson(json["total_value"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "period": period,
        "title": title,
        "description": description,
        "total_value": totalValue.toJson(),
        "id": id,
    };
}

class TotalValue {
    int value;

    TotalValue({
        required this.value,
    });

    factory TotalValue.fromJson(Map<String, dynamic> json) => TotalValue(
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
    };
}

class Paging {
    String previous;
    String next;

    Paging({
        required this.previous,
        required this.next,
    });

    factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        previous: json["previous"],
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "previous": previous,
        "next": next,
    };
}