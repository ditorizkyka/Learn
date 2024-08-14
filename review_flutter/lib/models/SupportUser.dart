import 'package:json_annotation/json_annotation.dart';

part 'SupportUser.g.dart';

@JsonSerializable()
class SupportUser {
  final String url;
  final String text;

  SupportUser({
    required this.url,
    required this.text,
  });

  factory SupportUser.fromJson(Map<String, dynamic> json) =>
      _$SupportUserFromJson(json);

  Map<String, dynamic> toJson() => _$SupportUserToJson(this);
}
