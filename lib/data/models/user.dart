import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? number;
  @HiveField(2)
  String? registerDate;
  @HiveField(3)
  String? expireDate;
  @HiveField(4)
  int? id;
  UserModel(
      {this.expireDate, this.registerDate, this.name, this.number, this.id});
}
