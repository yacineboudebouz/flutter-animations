import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool added = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              added = !added;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: added ? 200.0 : 80,
            height: added ? 40.0 : 60.0,
            curve: Curves.decelerate,
            decoration: BoxDecoration(
              color: added ? Colors.green : Colors.blue,
              borderRadius: added
                  ? BorderRadius.circular(20.0)
                  : BorderRadius.circular(10.0),
            ),
            child: added
                ? AnimatedOpacity(
                    opacity: added ? 1 : 0,
                    duration: const Duration(seconds: 1),
                    child: const Center(
                        child: Text(
                      'Added to cart',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    )),
                  )
                : const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
          ),
        ),
      ),
    );
  }
}
