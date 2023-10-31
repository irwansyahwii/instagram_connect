class IgUser {
    String biography;
    String id;
    int igId;
    String username;
    String profilePictureUrl;

    int followersCount;
    int followsCount;
    int mediaCount;
    String name;
    String website;

    int impression;
    int reach;
    int profileViewed;
    int engagement;

    IgUser({
        required this.biography,
        required this.id,
        required this.igId,
        required this.username,
        required this.profilePictureUrl,
        required this.followersCount,
        required this.followsCount,
        required this.mediaCount,
        required this.name,
        required this.website,
        required this.impression,
        required this.reach,
        required this.profileViewed,
        required this.engagement  
    });

    factory IgUser.empty(){

      return IgUser(biography: "", id: "", igId: 0, username: "", profilePictureUrl: "", followersCount: 0,
      followsCount: 0, mediaCount: 0, name: "", website: "",
      impression: 0,
      engagement: 0,
      profileViewed: 0,
      reach: 0);
    }

    factory IgUser.fromJson(Map<String, dynamic> json) => IgUser(
        biography: json["biography"],
        id: json["id"],
        igId: json["ig_id"],
        username: json["username"],
        profilePictureUrl: json["profile_picture_url"],
        followersCount: json["followers_count"],
        followsCount: json["follows_count"],
        mediaCount: json["media_count"],
        name: json["name"],
        website: json["website"] ?? "",
        impression: json["impressions"],
        engagement: json["accounts_engaged"],
        profileViewed: json["profile_views"],
        reach: json["reach"],
        
    );

    Map<String, dynamic> toJson() => {
        "biography": biography,
        "id": id,
        "ig_id": igId,
        "username": username,
        "profile_picture_url": profilePictureUrl
        
    };
}