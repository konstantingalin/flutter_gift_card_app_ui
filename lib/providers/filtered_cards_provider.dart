import 'package:flutter_gift_card_app_ui/providers/search_query_provider.dart';
import 'package:flutter_gift_card_app_ui/providers/selected_category_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/card_model.dart';
import '../repositories/card_repository.dart';


part 'filtered_cards_provider.g.dart';

@riverpod 

Future<List<CardModel>> filterCards(FilterCardsRef ref) async {
  final CardRepository cardRepository = ref.watch(cardRepositoryProvider);
  final selectedCategory =  ref.watch(selectedCategoryProvider);
  final searchQuery = ref.watch(searchQueryProvider); 

  var allCards = await cardRepository.getAllCards();

  if(selectedCategory != null){
    return allCards.where((card) {
      return card.categories.any((category) => category == selectedCategory);
    }).toList();
  }

  if (searchQuery.trim().isNotEmpty) {
    return allCards.where((card) {
      return card.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }

  return allCards;
}