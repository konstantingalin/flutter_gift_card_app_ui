import 'package:flutter_gift_card_app_ui/models/card_model.dart';

extension CardCategoryExtension on CardCategory {
  String capitalName() => name[0].toUpperCase() + name.substring(1, name.length).toLowerCase();
}