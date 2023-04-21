import 'package:flutter/material.dart';
import 'package:flutter_gift_card_app_ui/gen/colors.gen.dart';
import 'package:flutter_gift_card_app_ui/models/card_model.dart';
import 'package:flutter_gift_card_app_ui/providers/filtered_cards_provider.dart';
import 'package:flutter_gift_card_app_ui/providers/search_query_provider.dart';
import 'package:flutter_gift_card_app_ui/providers/selected_category_provider.dart';
import 'package:flutter_gift_card_app_ui/utilities/card_category_extension.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/app_text.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/custom_chip.dart';
import '../widgets/custom_gift_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
          ),
          child: AppText.title('Gift Cards'),
        ),
      ),
      bottomNavigationBar: CustomNavBar(index: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(
          children: const [
            SizedBox(
              height: 10,
            ),
            _SearchBar(),
            SizedBox(
              height: 10,
            ),
            _CategoryFilters(),
            SizedBox(
              height: 10,
            ),
            _CardGrid(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends ConsumerWidget {
  const _SearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flexible(
      child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            hintText: "Search card",
            prefixIcon: const Icon(Icons.search),
            fillColor: ColorName.lightGrey,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            )),
        onChanged: ref.read(searchQueryProvider.notifier).onChange,
      ),
    );
  }
}

class _CategoryFilters extends ConsumerWidget {
  const _CategoryFilters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
final selectedCategory = ref.watch(selectedCategoryProvider);

    return SizedBox(
      height: 30,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          ...CardCategory.values.map((category) => CustomChip(
                label: category.capitalName(),
                isSelected:  selectedCategory == category,
                onTap: (){
                  ref
                    .read(selectedCategoryProvider.notifier)
                    .setSelectedCategory(category);
                },
              ),
            ),
          const SizedBox(height: 10,),
        ],  
      ),
    );
  }
}

class _CardGrid extends ConsumerWidget {
  const _CardGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final cards = ref.watch(filterCardsProvider);

    return cards.when(
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        data: (cards) => SizedBox(
              height: size.height * 0.67,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 10,
                ),
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: CustomGiftCard(
                      card: cards[index],
                      width: size.width * 0.425,
                    ),
                  );
                },
              ),
            ),
        error: (error, stackTrace) =>
            Center(child: AppText.medium('Failed to fetch card')));
  }
}
