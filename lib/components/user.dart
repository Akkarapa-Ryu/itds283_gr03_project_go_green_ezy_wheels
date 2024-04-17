class User {
  String id;
  final String phone;
  final String fname;
  final String lname;
  final String email;
  final String password;

  User(
      {this.id = '',
      required this.phone,
      required this.fname,
      required this.lname,
      required this.email,
      required this.password});

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "fname": fname,
        "lname": lname,
        "email": email,
        "password": password,
      };
}
