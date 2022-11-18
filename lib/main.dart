import 'package:addidas_concept/nike_shoes.dart';
import 'package:addidas_concept/nike_shoes_details.dart';
import 'package:addidas_concept/shake_transition.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainNikeShoesStore());
}

class MainNikeShoesStore extends StatelessWidget {
  const MainNikeShoesStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Addidas Concept',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NikeShoesStoreHome(),
    );
  }
}

class NikeShoesStoreHome extends StatelessWidget {
  NikeShoesStoreHome({Key? key}) : super(key: key);

  final ValueNotifier<bool> notifierBottomBarVisible = ValueNotifier(true);

  _onShoesItemPressed({
    required NikeShoes shoes,
    required BuildContext context,
  }) async {
    notifierBottomBarVisible.value = false;
    await Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: NikeShoesDetails(shoes: shoes),
          );
        },
      ),
    );

    notifierBottomBarVisible.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/nike_shoes_store/nike_logo.png',
                  height: 50.0,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: shoes.length,
                    padding: const EdgeInsets.only(bottom: 55.0),
                    itemBuilder: (BuildContext context, int index) {
                      final shoesItem = shoes[index];
                      return NikeShoesItem(
                        shoesItem: shoesItem,
                        onTap: () {
                          _onShoesItemPressed(
                            shoes: shoesItem,
                            context: context,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder(
            valueListenable: notifierBottomBarVisible,
            child: Container(
              color: Colors.white,
              child: Row(
                children: const [
                  Expanded(
                    child: Icon(Icons.home),
                  ),
                  Expanded(
                    child: Icon(Icons.search),
                  ),
                  Expanded(
                    child: Icon(Icons.favorite_border),
                  ),
                  Expanded(
                    child: Icon(Icons.shopping_cart),
                  ),
                  Expanded(
                    child: Center(
                      child: CircleAvatar(
                        radius: 13.5,
                        backgroundColor: Colors.grey,
                        backgroundImage:
                            AssetImage("assets/nike_shoes_store/nike_logo.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            builder: (context, bool value, child) {
              return AnimatedPositioned(
                duration: kThemeAnimationDuration,
                left: 0,
                right: 0,
                bottom: value ? 0.0 : -kToolbarHeight,
                height: kToolbarHeight,
                child: child!,
              );
            },
          ),
        ],
      ),
    );
  }
}

class NikeShoesItem extends StatelessWidget {
  const NikeShoesItem({
    Key? key,
    required this.shoesItem,
    required this.onTap,
  }) : super(key: key);

  final NikeShoes shoesItem;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const itemHeight = 300.0;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: SizedBox(
          height: itemHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: Hero(
                  tag: "background_${shoesItem.model}",
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(shoesItem.color),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: itemHeight * 0.6,
                  child: ShakeTransition(
                    child: Hero(
                      tag: "number_${shoesItem.modelNumber}",
                      child: Material(
                        color: Colors.transparent,
                        child: FittedBox(
                          child: Text(
                            shoesItem.modelNumber.toString(),
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.05),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20.0,
                left: 100.0,
                height: itemHeight * 0.60,
                child: Hero(
                  tag: "image_${shoesItem.model}",
                  child: Image.asset(
                    shoesItem.image.first,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const Positioned(
                bottom: 20,
                left: 20,
                child: Icon(
                  Icons.favorite,
                  color: Colors.grey,
                ),
              ),
              const Positioned(
                right: 20,
                bottom: 20,
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.grey,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 25,
                child: Column(
                  children: [
                    Text(
                      shoesItem.model.toString(),
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "\$ ${shoesItem.oldPrice.toDouble().toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "\$ ${shoesItem.currentPrice.toDouble().toStringAsFixed(2)}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
