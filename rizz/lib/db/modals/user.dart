import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  @Id()
  int id;
  String email;
  String name;
  String snapId;
  int age;
  String gender;
  List<String> imageUrl;

  User({
    this.id = 0,
    required this.name,
    required this.email,
    required this.snapId,
    required this.age,
    required this.gender,
    required this.imageUrl,
  });
}
