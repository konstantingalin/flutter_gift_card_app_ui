import "../models/card_model.dart";

class CardRepository {
  Future<List<CardModel>> getAllCards() async {
    return Future.delayed(
      const Duration(microseconds: 300),
      () {
        return CardModel.sampleCards;
      }  
    );
  }

  Future<CardModel>getCard(int cardId) async {
    return Future.delayed(
      const Duration(microseconds: 300),
      () {
        return CardModel.sampleCards.where((card) => card.id == cardId).first;
      },
    );
  }


}