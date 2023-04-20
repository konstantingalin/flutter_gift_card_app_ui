import 'package:flutter/material.dart';
import 'package:flutter_gift_card_app_ui/gen/colors.gen.dart';
import 'package:flutter_gift_card_app_ui/models/card_model.dart';
import 'package:flutter_gift_card_app_ui/utilities/card_category_extension.dart';

import '../widgets/app_text.dart';
import '../widgets/custom_chip.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            _SearchBar(),
            const SizedBox(
              height: 10,
            ),
            _CategoryFilters(),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
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
        onChanged: (value) {},
      ),
    );
  }
}

class _CategoryFilters extends StatelessWidget {
  const _CategoryFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          ...CardCategory.values.map((category) => CustomChip(
                label: category.capitalName(),
              )),
        ],
      ),
    );
  }
}
