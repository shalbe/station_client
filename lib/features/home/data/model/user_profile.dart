class UserProfile {
  int? id;
  String? name;
  String? number;
  String? email;
  Null? emailVerifiedAt;
  String? password;
  int? status;
  String? createdAt;
  String? updatedAt;

  UserProfile(
      {this.id,
      this.name,
      this.number,
      this.email,
      this.emailVerifiedAt,
      this.password,
      this.status,
      this.createdAt,
      this.updatedAt});

  UserProfile.fromJson(Map<String, dynamic> json) {
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
