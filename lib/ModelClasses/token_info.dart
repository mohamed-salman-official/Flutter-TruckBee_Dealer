class TokenInfo {
  String? type;
  String? accessToken;
  int? expiresIn;
  String? printedCardNumber;
  String? refreshToken;
  String? scope;
  String? tokenType;
  String? username;
  String? result;

  TokenInfo(
      {this.type,
      this.accessToken,
      this.expiresIn,
      this.printedCardNumber,
      this.refreshToken,
      this.scope,
      this.tokenType,
      this.username,
      this.result});

  TokenInfo.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
    printedCardNumber = json['printedCardNumber'];
    refreshToken = json['refresh_token'];
    scope = json['scope'];
    tokenType = json['token_type'];
    username = json['username'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['access_token'] = accessToken;
    data['expires_in'] = expiresIn;
    data['printedCardNumber'] = printedCardNumber;
    data['refresh_token'] = refreshToken;
    data['scope'] = scope;
    data['token_type'] = tokenType;
    data['username'] = username;
    data['result'] = result;
    return data;
  }
}


class UserInfo {
  String? userRole;
  String? userId;

  UserInfo(
      {this.userRole,
        this.userId});

  UserInfo.fromJson(Map<String, dynamic> json) {
    userRole = json['userRole'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userRole'] = userRole;
    data['userId'] = userId;
    return data;
  }
}