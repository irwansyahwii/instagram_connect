class Value {
    int value;
    String endTime;

    Value({
        required this.value,
        required this.endTime,
    });

    factory Value.fromJson(Map<String, dynamic> json) => Value(
        value: json["value"],
        endTime: json["end_time"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "end_time": endTime,
    };
}