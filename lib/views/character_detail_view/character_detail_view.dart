import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordle_mobile/globals/widgets/button_details.dart';
import 'package:wordle_mobile/helpers/hero_details_options.dart';
import 'package:wordle_mobile/views/character_detail_view/detail_controller.dart';

class CharacterDetailView extends StatelessWidget {
  const CharacterDetailView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GetBuilder<DeatilController>(
        init: DeatilController(),
        builder: (_) {
          return SizedBox(
            height: height,
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    _.args!.thumbnailUrl!,
                    colorBlendMode: BlendMode.darken,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    children: [
                      const SizedBox(
                        height: 16.0,
                      ),
                      Center(
                        child: Text(
                          _.args!.name!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const ButtonDetails(
                        detail: HeroDetailsOptions.comics,
                      ),
                      const ButtonDetails(
                        detail: HeroDetailsOptions.events,
                      ),
                      const ButtonDetails(
                        detail: HeroDetailsOptions.series,
                      ),
                      const ButtonDetails(
                        detail: HeroDetailsOptions.stories,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red.shade700,
        onPressed: () {
          Get.back();
        },
        child: const Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
  }
}
