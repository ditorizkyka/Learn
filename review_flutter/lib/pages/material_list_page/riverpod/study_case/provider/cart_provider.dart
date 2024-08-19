import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:review_flutter/pages/material_list_page/riverpod/study_case/models/products.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  // Initial value
  @override
  Set<Product> build() {
    return const {};
  }

  void addProducts(Product product) {
    state = {...state, product};
  }

  int totalPrice() {
    int total = 0;
    state.forEach((product) {
      total += product.price;
    });
    return total;
  }

  void removeProducts(Product product) {
    state = {...state}..remove(product);
  }
}
