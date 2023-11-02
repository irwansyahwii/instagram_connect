class LongLiveTokenResponse {
    String accessToken;
    String tokenType;
    int expiresIn;

    LongLiveTokenResponse({
        required this.accessToken,
        required this.tokenType,
        required this.expiresIn,
    });

    factory LongLiveTokenResponse.fromJson(Map<String, dynamic> json) => LongLiveTokenResponse(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"] ?? -1,
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
    };
}
