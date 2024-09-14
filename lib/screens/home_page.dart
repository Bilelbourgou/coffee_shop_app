import 'package:coffee_shop_app/models/product_model.dart';
import 'package:coffee_shop_app/utils/colors.dart';
import 'package:coffee_shop_app/widgets/background.dart';
import 'package:coffee_shop_app/widgets/category_items.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: Stack(
        children: [
          const Background(),
          const Positioned(
            top: 30,
            left: 40,
            child: Text(
              'Smooth Out\nYour Everyday',
              style: TextStyle(
                color: Colors.black,
                height: 1.2,
                fontSize: 35,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          // For selected items
          Positioned(
            top: 120,
            child: ClipPath(
              clipper: Clip(),
              child: Container(
                height: 190,
                width: MediaQuery.of(context).size.width,
                color: firstColor,
                child: Row(
                  children: List.generate(
                    categories.length,
                    (index) => Container(
                      height: 190,
                      width: 107,
                      color: currentCategory == index
                          ? Colors.amberAccent
                          : Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // For category items display
          Positioned(
            top: 120,
            child: ClipPath(
              clipper: Clip(),
              child: Container(
                height: 280,
                width: MediaQuery.of(context).size.width,
                color: firstColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(categories.length, (index) {
                    // Using sine wave to create the curved layout
                    int decrease = 0;
                    int max = 1;
                    int bottomPadding = 1;
                    // for items display in curve shape
                    for (var i = 0; i < categories.length; i++) {
                      bottomPadding = index > max ? index - decrease++ : index;
                    }

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentCategory = index;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 10,
                            bottom: bottomPadding.abs() * 75), // Adjust bottom padding for curve effect
                        child: Column(
                          // Changed Row to Column to allow vertical layout
                          mainAxisAlignment:
                              MainAxisAlignment.end, // Align items to bottom
                          children: [
                            CategoryItems(
                              category: categories[index],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Image.asset(
            "images/coffee-cup.png",
            height: 30,
            color: Colors.amber,
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Qahwa",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "Space",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Center(
          child: Stack(
            children: [
              const Icon(
                Icons.shopping_cart,
                color: Colors.amber,
              ),
              Positioned(
                right: 3,
                top: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: firstColor),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }
}

class Clip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 100);
    path.quadraticBezierTo(size.width / 2, -40, 0, 100);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
