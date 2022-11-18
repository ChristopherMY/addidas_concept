class NikeShoes {
  final String model;
  final double oldPrice;
  final double currentPrice;
  final List<String> image;
  final int modelNumber;
  final int color;

  NikeShoes({
    required this.model,
    required this.oldPrice,
    required this.currentPrice,
    required this.image,
    required this.modelNumber,
    required this.color,
  });
}

final shoes = <NikeShoes>[
  NikeShoes(
    model: "AIR MAX 90 EZ BLACK",
    oldPrice: 299.0,
    currentPrice: 149.0,
    image: [
      "assets/nike_shoes_store/shoes1_1.png",
      "assets/nike_shoes_store/shoes1_2.png",
      "assets/nike_shoes_store/shoes1_3.png"
    ],
    modelNumber: 90,
    color: 0xFFF6F6F6,
  ),
  NikeShoes(
    model: "AIR MAX 270 Gold",
    oldPrice: 349.0,
    currentPrice: 199.0,
    image: [
      "assets/nike_shoes_store/shoes2_1.png",
      "assets/nike_shoes_store/shoes2_2.png",
      "assets/nike_shoes_store/shoes2_3.png"
    ],
    modelNumber: 270,
    color: 0xFFFCF5EB,
  ),
  NikeShoes(
    model: "AIR MAX 95 Red",
    oldPrice: 399.0,
    currentPrice: 299.0,
    image: [
      "assets/nike_shoes_store/shoes3_1.png",
      "assets/nike_shoes_store/shoes3_2.png",
      "assets/nike_shoes_store/shoes3_3.png"
    ],
    modelNumber: 95,
    color: 0xFFFEEFEF,
  ),
  NikeShoes(
    model: "AIR MAX 98 FREE",
    oldPrice: 299.0,
    currentPrice: 149.0,
    image: [
      "assets/nike_shoes_store/shoes4_1.png",
      "assets/nike_shoes_store/shoes4_2.png",
      "assets/nike_shoes_store/shoes4_3.png"
    ],
    modelNumber: 98,
    color: 0xFFEDF3FE,
  ),
];
