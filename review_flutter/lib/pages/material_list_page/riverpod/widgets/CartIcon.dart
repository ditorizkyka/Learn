import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:review_flutter/pages/material_list_page/riverpod/study_case/cart_screen.dart';
import 'package:review_flutter/pages/material_list_page/riverpod/study_case/provider/cart_provider.dart';

class CartIcon extends ConsumerWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const CartScreen();
            }));
          },
          icon: const Icon(Icons.shopping_bag_outlined),
        ),
        if (ref.watch(cartNotifierProvider).isNotEmpty)
          Positioned(
            top: 5,
            left: 5,
            child: Container(
              width: 18,
              height: 18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent,
              ),
              child: Text(
                ref.watch(cartNotifierProvider).length.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
