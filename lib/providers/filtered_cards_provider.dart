import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/card_model.dart';
import '../repositories/card_repository.dart';


part 'filtered_cards_provider.g.dart';

@riverpod 

Future<List<CardModel>> filterCards(FilterCardsRef ref) async {
  final CardRepository cardRepository = ref.watch(cardRepositoryProvider);
  var allCards =  cardRepository.getAllCards();

  return allCards;
}