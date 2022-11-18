import 'package:addidas_concept/nike_shoes.dart';
import 'package:flutter/material.dart';

class NikeShoesDetails extends StatelessWidget {
  final NikeShoes shoes;

  NikeShoesDetails({Key? key, required this.shoes}) : super(key: key);

  final ValueNotifier<bool> notifierButtonsVisible = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifierButtonsVisible.value = true;
    });

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Image.asset(
          'assets/nike_shoes_store/nike_logo.png',
          height: 50.0,
        ),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BuildCarrousel(shoes: shoes),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              shoes.model,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "\$ ${shoes.oldPrice}",
                                  style: const TextStyle(
                                    color: Colors.red,
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 13.0,
                                  ),
                                ),
                                Text(
                                  "\$ ${shoes.currentPrice}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        const Text(
                          "AVAILABLE SIZES",
                          style: TextStyle(fontSize: 11.0),
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            ShoesSizeItem(size: "6"),
                            ShoesSizeItem(size: "7"),
                            ShoesSizeItem(size: "8"),
                            ShoesSizeItem(size: "9"),
                            ShoesSizeItem(size: "10"),
                            ShoesSizeItem(size: "11"),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        const Text(
                          "DESCRIPTION",
                          style: TextStyle(fontSize: 11.0),
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: notifierButtonsVisible,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    heroTag: "fav_1",
                    onPressed: () {},
                    backgroundColor: Colors.white,
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    ),
                  ),
                  FloatingActionButton(
                    heroTag: "fav_2",
                    onPressed: () {},
                    backgroundColor: Colors.black,
                    child: const Icon(Icons.shopping_cart),
                  ),
                ],
              ),
            ),
            builder: (context, value, child) {
              return AnimatedPositioned(
                left: 0,
                right: 0,
                bottom: value ? 0.0 : kToolbarHeight,
                duration: kThemeAnimationDuration,
                child: child!,
              );
            },
          ),
        ],
      ),
    );
  }
}

class BuildCarrousel extends StatelessWidget {
  final NikeShoes shoes;

  const BuildCarrousel({Key? key, required this.shoes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.6,
      child: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: 'background_${shoes.model}',
              child: Container(
                color: Color(shoes.color),
              ),
            ),
          ),
          Positioned(
            left: 70,
            right: 70,
            top: 10,
            child: Hero(
              tag: "number_${shoes.modelNumber}",
              child: Material(
                color: Colors.transparent,
                child: FittedBox(
                  child: Text(
                    shoes.modelNumber.toString(),
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.05),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          PageView.builder(
            itemCount: shoes.image.length,
            itemBuilder: (context, index) {
              final image = shoes.image[index];
              final tag = index == 0 ? "image_${shoes.model}" : "image_${shoes.model}_index";
              return Container(
                alignment: Alignment.center,
                child: Hero(
                  tag: tag,
                  child: Image.asset(
                    image,
                    height: 200,
                    width: 200,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class ShoesSizeItem extends StatelessWidget {
  final String size;

  const ShoesSizeItem({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        "US $size",
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11.0),
      ),
    );
  }
}
