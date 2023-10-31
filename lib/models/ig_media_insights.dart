class IgMediaInsights {
    List<Datum> data;

    IgMediaInsights({
        required this.data,
    });

    factory IgMediaInsights.fromJson(Map<String, dynamic> json) => IgMediaInsights(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String name;
    String period;
    List<Value> values;
    String title;
    String description;
    TotalValue totalValue;
    String id;

    Datum({
        required this.name,
        required this.period,
        required this.values,
        required this.title,
        required this.description,
        required this.totalValue,
        required this.id,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        period: json["period"],
        values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
        title: json["title"],
        description: json["description"],
        totalValue: TotalValue.fromJson(json["total_value"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "period": period,
        "values": List<dynamic>.from(values.map((x) => x.toJson())),
        "title": title,
        "description": description,
        "total_value": totalValue.toJson(),
        "id": id,
    };
}

class TotalValue {
    int value;
    List<Breakdown> breakdowns;

    TotalValue({
        required this.value,
        required this.breakdowns,
    });

    factory TotalValue.fromJson(Map<String, dynamic> json) => TotalValue(
        value: json["value"],
        breakdowns: List<Breakdown>.from(json["breakdowns"].map((x) => Breakdown.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "breakdowns": List<dynamic>.from(breakdowns.map((x) => x.toJson())),
    };
}

class Breakdown {
    List<String> dimensionKeys;
    List<Result> results;

    Breakdown({
        required this.dimensionKeys,
        required this.results,
    });

    factory Breakdown.fromJson(Map<String, dynamic> json) => Breakdown(
        dimensionKeys: List<String>.from(json["dimension_keys"].map((x) => x)),
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "dimension_keys": List<dynamic>.from(dimensionKeys.map((x) => x)),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    List<String> dimensionValues;
    int value;

    Result({
        required this.dimensionValues,
        required this.value,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        dimensionValues: List<String>.from(json["dimension_values"].map((x) => x)),
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "dimension_values": List<dynamic>.from(dimensionValues.map((x) => x)),
        "value": value,
    };
}

class Value {
    int value;

    Value({
        required this.value,
    });

    factory Value.fromJson(Map<String, dynamic> json) => Value(
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
    };
}
