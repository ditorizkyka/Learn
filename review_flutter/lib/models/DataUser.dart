import 'package:json_annotation/json_annotation.dart';

part 'DataUser.g.dart';

@JsonSerializable()
class DataUser {
  final int id;
  final String avatar;
  final String first_name;
  final String last_name;
  final String email;

  DataUser({
    required this.avatar,
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.email,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) =>
      _$DataUserFromJson(json);

  Map<String, dynamic> toJson() => _$DataUserToJson(this);
}
