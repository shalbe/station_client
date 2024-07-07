class LoginModel {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  Client? client;

  LoginModel({this.accessToken, this.tokenType, this.expiresIn, this.client});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    client =
        json['client'] != null ? new Client.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    return data;
  }
}

class Client {
  int? id;
  String? name;
  String? number;
  String? email;
  Null? emailVerifiedAt;
  String? password;
  int? status;
  String? createdAt;
  String? updatedAt;

  Client(
      {this.id,
      this.name,
      this.number,
      this.email,
      this.emailVerifiedAt,
      this.password,
      this.status,
      this.createdAt,
      this.updatedAt});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['number'] = this.number;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
