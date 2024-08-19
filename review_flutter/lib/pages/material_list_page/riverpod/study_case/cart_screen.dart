import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:review_flutter/pages/material_list_page/riverpod/study_case/provider/cart_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  // bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 50,
            alignment: Alignment.centerRight,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 103, 16, 255),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Text(
                'Total Price : £${ref.watch(cartNotifierProvider.notifier).totalPrice()}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: ref.watch(cartNotifierProvider).map((product) {
                return Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(children: [
                      Image.asset(product.image, width: 60, height: 60),
                      const SizedBox(width: 10),
                      Text('${product.title}...'),
                      const Expanded(child: SizedBox()),
                      Text('£${product.price}'),
                    ]));
              }).toList(), // output cart products here
            ),
          ),

          // output totals here
        ],
      ),
    );
  }
}
