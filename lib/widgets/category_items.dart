// ignore_for_file: prefer_const_constructors

import 'package:coffee_shop_app/models/product_model.dart';
import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  final Category category;
  const CategoryItems({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 75,
          width: 75,
          padding: const EdgeInsets.all(10),
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Image.asset("images/${category.image}"),
        ),
        const SizedBox(height: 10),
        Text(
          category.name.toUpperCase(),
          style:TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 13,
            color: Colors.white
          )
          )
      ],
    );
  }
}
