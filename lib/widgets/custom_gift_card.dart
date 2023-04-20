import 'package:flutter/material.dart';
import 'package:flutter_gift_card_app_ui/widgets/app_text.dart';

import '../models/card_model.dart';

class CustomGiftCard extends StatelessWidget {
  final CardModel card;
  final double width;
  final int? value;
  final bool showLabel;
  final bool showValue;


  const CustomGiftCard({
    required this.card,
    required this.width,
    this.value, 
    this.showLabel = true,
    this.showValue = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Image.asset(
                card.thumbnailPath,
                fit: BoxFit.cover,
              ),
            ),
            if(showLabel) ...[
              const SizedBox(height: 10,),
              AppText.medium(card.name),
            ]
          ],
        ),
        if (showValue)
          Positioned(
            bottom: 10,
            right: 10,
            child: AppText.large('\$$value'),
          )
      ],
    );
  }
}
