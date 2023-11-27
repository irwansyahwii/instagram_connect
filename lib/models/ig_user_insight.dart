
import 'package:com.ice.instagramconnect/models/datum.dart';

class IgUserInsights {
    List<Datum> data;

    IgUserInsights({
        required this.data,
    });

    factory IgUserInsights.fromJson(Map<String, dynamic> json) => IgUserInsights(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}