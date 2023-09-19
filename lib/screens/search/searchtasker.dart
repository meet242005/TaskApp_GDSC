import 'package:flutter/material.dart';
import 'package:gdsc_task/constants/colors.dart';
import 'package:get/get.dart';

class SearchTasker extends StatefulWidget {
  final String taskertype;
  const SearchTasker(this.taskertype, {super.key});

  @override
  _SearchtaskerState createState() => _SearchtaskerState();
}

class _SearchtaskerState extends State<SearchTasker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 270,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
            decoration: BoxDecoration(color: AppColors.accentColor),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 24,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const Text(
                      "Search Tasker",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
