import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';

enum CardCategory {
  birthday,
  chrismas,
  general,
  congratulation,
  wedding,
}

class CardModel {
  final int id;
  final String name;
  final String thumbnailPath;
  final Color bgColor;
  final List<CardCategory> categories;

  CardModel({
    required this.id,
    required this.name,
    required this.thumbnailPath,
    required this.bgColor,
    required this.categories,
  });

  static List<CardModel> sampleCards = [
    CardModel(
      id: 1,
      name: 'Flowers girl',
      thumbnailPath: Assets.cards.card1.path,
      categories: [CardCategory.general, CardCategory.congratulation],
      bgColor: ColorName.bgBlue,
    ),
    CardModel(
      id: 2,
      name: 'Fantasy island',
      thumbnailPath: Assets.cards.card2.path,
      categories: [CardCategory.general, CardCategory.chrismas],
      bgColor: ColorName.bgOrange,
    ),
    CardModel(
      id: 3,
      name: 'Drandpa & Grandma',
      thumbnailPath: Assets.cards.card3.path,
      categories: [CardCategory.general, CardCategory.chrismas],
      bgColor: ColorName.bgBlue,
    ),  
    CardModel(
      id: 4,
      name: 'Cosmos lady',
      thumbnailPath: Assets.cards.card4.path,
      categories: [CardCategory.general, CardCategory.chrismas],
      bgColor: ColorName.bgBlue,
    ),
    CardModel(
      id: 5,
      name: 'Crazy man',
      thumbnailPath: Assets.cards.card5.path,
      categories: [CardCategory.general, CardCategory.chrismas],
      bgColor: ColorName.bgOrange,
    ),
    CardModel(
      id: 6,
      name: 'Indian woman',
      thumbnailPath: Assets.cards.card6.path,
      categories: [CardCategory.general, CardCategory.chrismas, CardCategory.wedding],
      bgColor: ColorName.bgOrange,
    ),
    CardModel(
      id: 7,
      name: 'Vincent van Gogh',
      thumbnailPath: Assets.cards.card7.path,
      categories: [CardCategory.general, CardCategory.chrismas],
      bgColor: ColorName.bgBlue,
    ),
    CardModel(
      id: 8,
      name: 'Birds',
      thumbnailPath: Assets.cards.card8.path,
      categories: [CardCategory.general, CardCategory.chrismas],
      bgColor: ColorName.bgBlue,
    ),
  ];
}