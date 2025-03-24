//login model
class LoginRsp {
  final String? token;
  final User? data;

  LoginRsp({
    this.token,
    this.data,
  });

  factory LoginRsp.fromJson(Map<String, dynamic> json) => LoginRsp(
    token: json["token"],
    data: json["data"] == null ? null : User.fromJson(json["data"]),
  );

}

class User {
  final String? id;
  final String? username;
  final String? email;
  final String? password;
  final String? role;
  final List<dynamic>? wishlist;
  final List<dynamic>? cart;
  final int? v;

  User({
    this.id,
    this.username,
    this.email,
    this.password,
    this.role,
    this.wishlist,
    this.cart,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    username: json["username"],
    email: json["email"],
    password: json["password"],
    role: json["role"],
    wishlist: json["wishlist"] == null ? [] : List<dynamic>.from(json["wishlist"]!.map((x) => x)),
    cart: json["cart"] == null ? [] : List<dynamic>.from(json["cart"]!.map((x) => x)),
    v: json["__v"],
  );

}