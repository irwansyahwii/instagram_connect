class IgUser {
    String biography;
    String id;
    String username;

    IgUser({
        required this.biography,
        required this.id,
        required this.username,
        
    });

    factory IgUser.fromJson(Map<String, dynamic> json) => IgUser(
        biography: json["biography"],
        id: json["id"],
        username: json["username"],
        
    );

    Map<String, dynamic> toJson() => {
        "biography": biography,
        "id": id,
        "username": username,
        
    };
}