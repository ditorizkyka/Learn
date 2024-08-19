import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final greet = Provider((ref) => 'Hello, Riverpod!');

final counterWithAutoDispose = StateProvider.autoDispose(
  (ref) => 0,
); // auto restart counter
final counter = StateProvider(
  (ref) => 0,
); // auto restart counter

