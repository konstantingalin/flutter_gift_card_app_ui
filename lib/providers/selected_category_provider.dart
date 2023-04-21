
import 'package:flutter_gift_card_app_ui/models/card_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_category_provider.g.dart';

@riverpod
class SelectedCategory extends _$SelectedCategory {
  @override
  CardCategory? build() {
    return null;
  }

  void setSelectedCategory(CardCategory? selectedCategory){
    if (state == selectedCategory){
      state = null;
    } else {
      state = selectedCategory;
    }
  }
}