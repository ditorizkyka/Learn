// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DataUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataUser _$DataUserFromJson(Map<String, dynamic> json) => DataUser(
      avatar: json['avatar'] as String,
      id: (json['id'] as num).toInt(),
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$DataUserToJson(DataUser instance) => <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
    };
