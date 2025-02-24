class UserModel {
  final String? name;
  final String? password;
  final String? wallet;
  final dynamic balance;

  UserModel({this.name, this.password, this.wallet, this.balance});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String?,
      password: json['password'] as String?,
      wallet: json['wallet'] as String?,
      balance: json['balance'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'password': password,
    'wallet': wallet,
    'balance': balance,
  };
}
