import 'package:church_app/controllers/config.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPosts extends StatelessWidget {
  const SearchPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${'hello'.tr}, Usuário',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16.0,
              ),
              color: Config.colors[ColorVariables.inputBackground],
            ),
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: 40,
                      padding: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Config.colors[ColorVariables.borderGray]!,
                            width: 1,
                          ),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.search,
                          size: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextFormField(
                        maxLines: 1,
                        cursorColor: Config.colors[ColorVariables.secondary],
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 12, left: 12),
                          border: InputBorder.none,
                          constraints: BoxConstraints(),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Config.colors[ColorVariables.borderGray]!,
                        width: 1,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.search,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
