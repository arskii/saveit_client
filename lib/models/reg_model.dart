class Auth {
  String email;
  String password;

  Auth({required this.email, required this.password});

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(email: json['email'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> datauser = new Map<String, dynamic>();
    datauser['email'] = this.email;
    datauser['password'] = this.password;
    return datauser;
  }
}
