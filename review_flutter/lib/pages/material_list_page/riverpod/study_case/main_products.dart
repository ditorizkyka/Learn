import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:review_flutter/pages/material_list_page/riverpod/study_case/provider/cart_provider.dart';
import 'package:review_flutter/pages/material_list_page/riverpod/study_case/provider/products_provider.dart';
import 'package:review_flutter/pages/material_list_page/riverpod/widgets/CartIcon.dart';

class MainProducts extends ConsumerWidget {
  const MainProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the color you want
        ),
        title: const Text(
          'Products Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: const [CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: 8,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            return Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                color: Colors.blueGrey.withOpacity(0.05),
                child: Column(children: [
                  Image.asset(
                    allProducts[index].image,
                    height: 80,
                    width: 80,
                  ),
                  Text(allProducts[index].title),
                  Text('£${allProducts[index].price}'),
                  const SizedBox(height: 10),
                  if (ref
                      .watch(cartNotifierProvider)
                      .contains(allProducts[index]))
                    TextButton(
                        onPressed: () {
                          ref
                              .watch(cartNotifierProvider.notifier)
                              .removeProducts(allProducts[index]);
                        },
                        child: const Text('Remove',
                            style: TextStyle(color: Colors.red))),
                  if (!ref
                      .watch(cartNotifierProvider)
                      .contains(allProducts[index]))
                    TextButton(
                        onPressed: () {
                          ref
                              .watch(cartNotifierProvider.notifier)
                              .addProducts(allProducts[index]);
                        },
                        child: const Text('Add To Cart',
                            style: TextStyle(color: Colors.blue))),
                ]));
          },
        ),
      ),
    );
  }
}
