// ignore_for_file: no_leading_underscores_for_local_identifiers

class UserLoginModel {
  UserLoginModel({
    required this.status,
    required this.token,
    required this.userData,
  });
  late final String status;
  late final String token;
  late final UserData userData;

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    userData = UserData.fromJson(json['userData']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['token'] = token;
    _data['userData'] = userData.toJson();
    return _data;
  }
}

class UserData {
  UserData({
    required this.id,
    required this.status,
    required this.couponsUsed,
    required this.email,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.cartid,
    required this.watchlist,
    required this.watchhistory,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String id;
  late final bool status;
  late final List<dynamic> couponsUsed;
  late final String email;
  late final String username;
  late final String firstName;
  late final String lastName;
  late final String cartid;
  late final String watchlist;
  late final List<dynamic> watchhistory;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    status = json['status'];
    couponsUsed = List.castFrom<dynamic, dynamic>(json['coupons_used']);
    email = json['email'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    cartid = json['cartid'];
    watchlist = json['watchlist'];
    watchhistory = List.castFrom<dynamic, dynamic>(json['watchhistory']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['status'] = status;
    _data['coupons_used'] = couponsUsed;
    _data['email'] = email;
    _data['username'] = username;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['cartid'] = cartid;
    _data['watchlist'] = watchlist;
    _data['watchhistory'] = watchhistory;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}
