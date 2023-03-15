import 'package:church_app/models/custom_list.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/config.controller.dart';

class FavoriteListButton extends StatelessWidget {
  final CustomList customList;
  const FavoriteListButton({required this.customList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          SizedBox(
            height: 400,
            width: 240,
            child: RawMaterialButton(
              onPressed: () {},
              child: Container(
                height: 400,
                width: 240,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Config.colors[ColorVariables.black]!,
                  ),
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        customList.name,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        '${'items'.tr}: ${customList.products.length}',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          color: Config.colors[ColorVariables.highlightGray],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      height: 130,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          customList.products.length,
                          (int index) {
                            return Container(
                              margin: const EdgeInsets.only(left: 16),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Config.colors[ColorVariables.black]!,
                                  ),
                                  borderRadius: BorderRadius.circular(16)),
                              height: 120,
                              width: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  16.0,
                                ),
                                child: FadeInImage(
                                  fit: BoxFit.cover,
                                  imageErrorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    return Image.asset(
                                        'assets/images/placeholder.jpg');
                                  },
                                  image: const NetworkImage(
                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/A_small_cup_of_coffee.JPG/1280px-A_small_cup_of_coffee.JPG',
                                  ),
                                  placeholder: const AssetImage(
                                    'assets/images/placeholder.jpg',
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        // options: CarouselOptions(
                        //   autoPlay: true,
                        //   enlargeCenterPage: false,
                        //   enableInfiniteScroll: false,
                        //   viewportFraction: 0.5,
                        //   aspectRatio: 16 / 9,
                        //   // scrollPhysics: const NeverScrollableScrollPhysics(),
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
