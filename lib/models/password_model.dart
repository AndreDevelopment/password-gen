
class PasswordModel {
  String password;
  String name;
  String backgroundColor;

  PasswordModel({
    required this.name,
    required this.password,
    required this.backgroundColor,
  });
  
  factory  PasswordModel.fromJson(Map<String, dynamic> json) {
      return  PasswordModel(
        name: json['name'],
        password: json['password'],
        backgroundColor : json['backgroundColor']
      );
  }

  Map<String, dynamic> toJson() => {'name': name, 'password': password,'backgroundColor':backgroundColor};

}
