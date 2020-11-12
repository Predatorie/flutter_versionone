class AccessToken {
  final String token;
  final String refreshToken;
  final int expiresIn;
  final String tokenType;
  final DateTime requestedOn;

  AccessToken(
      {this.token,
      this.refreshToken,
      this.expiresIn,
      this.tokenType,
      this.requestedOn});

  AccessToken.fromJson(Map json)
      : token = json['access_token'] ?? '',
        refreshToken = json['refresh_token'] ?? '',
        expiresIn = json['expires_in'] ?? 0,
        tokenType = json['token_type'] ?? '',
        requestedOn = DateTime.now();

  AccessToken.fromDevice(Map<String, dynamic> json)
      : token = json['token'] ?? '',
        refreshToken = json['refreshToken'] ?? '',
        expiresIn = json['expiresIn'] ?? 0,
        tokenType = json['tokenType'] ?? '',
        requestedOn = DateTime.parse(json['requestedOn']);

  Map<String, dynamic> toDevice() => {
        'token': token,
        'refreshToken': refreshToken,
        'expiresIn': expiresIn,
        'tokenType': tokenType,
        'requestedOn': requestedOn.toString(),
      };
}
