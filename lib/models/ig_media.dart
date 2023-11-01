import 'dart:convert';

class IgMedia {
    String id;
    String mediaType;
    String mediaUrl;
    Owner owner;
    String timestamp;
    String caption;
    int commentsCount;
    int likeCount;
    String permalink;
    String shortcode;
    String thumbnailUrl;
    int engagement;
    int exits;
    int shares;
    int saved;
    int replies;
    int reach;
    int tapsForward;
    int tapsBackward;
    int impressions;
    String mediaProductType;

    IgMedia({
        required this.id,
        required this.mediaType,
        required this.mediaUrl,
        required this.owner,
        required this.timestamp,
        required this.caption,
        required this.commentsCount,
        required this.likeCount,
        required this.permalink,
        required this.shortcode,
        required this.thumbnailUrl,
        required this.engagement,
        required this.exits,
        required this.shares,
        required this.saved,
        required this.replies,
        required this.reach,
        required this.tapsForward,
        required this.tapsBackward,
        required this.impressions,
        required this.mediaProductType
    });

    factory IgMedia.placeholderOnly({required id}){
      return IgMedia(
        id: id, 
        mediaType: "", 
        mediaUrl: "", owner: Owner(id: ""), 
        timestamp: "", 
        caption: "", 
        commentsCount: 0, 
        likeCount: 0, 
        permalink: "", 
        shortcode: "", 
        thumbnailUrl: "", 
        engagement: 0, 
        exits: 0, 
        shares: 0, 
        saved: 0, 
        replies: 0, 
        reach: 0, 
        tapsForward: 0, 
        tapsBackward: 0, 
        impressions: 0, 
        mediaProductType: "");
    }

    factory IgMedia.fromJson(Map<String, dynamic> json) => IgMedia(
        id: json["id"] ?? "",
        mediaType: json["media_type"] ?? "",
        mediaUrl: json["media_url"] ?? "",
        owner: Owner.fromJson(json["owner"] ??  jsonDecode('{"id": ""}')),
        timestamp: json["timestamp"] ?? "",
        caption: json["caption"] ?? "",
        commentsCount: json["comments_count"]?? 0,
        likeCount: json["like_count"]?? 0,
        permalink: json["permalink"]?? "",
        shortcode: json["shortcode"]?? "",
        thumbnailUrl: json["thumbnail_url"]?? "",
        engagement: json["engagement"]?? 0,
        exits: json["exits"]?? 0,
        shares: json["shares"]?? 0,
        saved: json["saved"]?? 0,
        replies: json["replies"]?? 0,
        reach: json["reach"]?? 0,
        tapsForward: json["taps_forward"]?? 0,
        tapsBackward: json["taps_backward"]?? 0,
        impressions: json["impressions"]?? 0,
        mediaProductType: json["media_product_type"]?? ""
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "media_type": mediaType,
        "media_url": mediaUrl,
        "owner": owner.toJson(),
        "timestamp": timestamp,
        "caption": caption,
        "comments_count": commentsCount,
        "like_count": likeCount,
        "permalink": permalink,
        "shortcode": shortcode,
        "thumbnail_url": thumbnailUrl,
        "engagement": engagement,
        "exits": exits,
        "shares": shares,
        "saved": saved,
        "replies": replies,
        "reach": reach,
        "taps_forward": tapsForward,
        "taps_backward": tapsBackward,
        "impressions": impressions,
    };
}

class Owner {
    String id;

    Owner({
        required this.id,
    });

    factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}