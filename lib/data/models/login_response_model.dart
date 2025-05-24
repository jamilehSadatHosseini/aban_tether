class LoginResponseModel {
  final String authToken;

  LoginResponseModel(this.authToken);

  LoginResponseModel.fromJson(Map<String,dynamic> json) : authToken = json['auth_token'];
}
