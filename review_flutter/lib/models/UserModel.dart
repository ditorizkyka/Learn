import 'package:json_annotation/json_annotation.dart';
import 'package:review_flutter/models/DataUser.dart';
import 'package:review_flutter/models/SupportUser.dart';

part 'UserModel.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  final DataUser data;
  final SupportUser support;

  UserModel({
    required this.data,
    required this.support,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
