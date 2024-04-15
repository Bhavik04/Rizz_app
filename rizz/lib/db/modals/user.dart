import 'package:objectbox/objectbox.dart';

@Entity()
class AppUser {
  @Id()
  int id;
  String uId;
  String email;
  String name;
  String snapId;
  int age;
  String gender;
  String imageUrls;
  String? deviceToken;

  AppUser({
    this.id = 0,
    required this.uId,
    required this.name,
    required this.email,
    required this.snapId,
    required this.age,
    required this.gender,
    required this.imageUrls,
    required this.deviceToken,
  });
}
