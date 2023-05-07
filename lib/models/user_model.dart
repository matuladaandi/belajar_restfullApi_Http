// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final int idUser;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User({
    required this.idUser,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        idUser: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"]);
  }


}
