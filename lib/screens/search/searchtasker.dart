//Created By Meet Chavan

import 'package:flutter/material.dart';
import 'package:gdsc_task/constants/colors.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchTasker extends StatefulWidget {
  final String taskertype;
  const SearchTasker(this.taskertype, {super.key});

  @override
  _SearchtaskerState createState() => _SearchtaskerState();
}

class _SearchtaskerState extends State<SearchTasker> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getChipData();
  }

  Future getChipData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey("userLocation")) {
      setState(() {
        chip1text = sharedPreferences.getString("userLocation")!;
      });
    } else {
      setState(() {
        chip1visible = false;
      });
    }
  }

  bool chip1visible = true;
  bool chip2visible = true;
  bool chip3visible = true;
  var chip1text = "";
  var chip2text = "₹500 - ₹1K";
  var chip3text = "Within a week";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: chip1visible || chip2visible || chip3visible ? 255 : 220,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
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
                      style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Container(
                  height: 55,
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 16),
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.taskertype,
                        style: const TextStyle(
                            fontSize: 16,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w400),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.filter_list),
                      )
                    ],
                  ),
                ),
                chip1visible || chip2visible || chip3visible
                    ? SizedBox(
                        height: 36,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            chip1visible
                                ? Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                    child: Chip(
                                      side: BorderSide(
                                          color: AppColors.primaryColor),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      backgroundColor: AppColors.primaryColor,
                                      deleteIconColor: Colors.white,
                                      deleteIcon: const Icon(
                                        Icons.close,
                                        size: 18,
                                      ),
                                      labelStyle:
                                          const TextStyle(color: Colors.white),
                                      label: Text(chip1text),
                                      onDeleted: () {
                                        setState(() {
                                          chip1visible = !chip1visible;
                                        });
                                      },
                                    ),
                                  )
                                : const SizedBox(),
                            chip2visible
                                ? Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                    child: Chip(
                                      side: BorderSide(
                                          color: AppColors.primaryColor),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      backgroundColor: AppColors.primaryColor,
                                      deleteIconColor: Colors.white,
                                      deleteIcon: const Icon(
                                        Icons.close,
                                        size: 18,
                                      ),
                                      labelStyle:
                                          const TextStyle(color: Colors.white),
                                      label: Text(chip2text),
                                      onDeleted: () {
                                        setState(() {
                                          chip2visible = !chip2visible;
                                        });
                                      },
                                    ),
                                  )
                                : const SizedBox(),
                            chip3visible
                                ? Chip(
                                    side: BorderSide(
                                        color: AppColors.primaryColor),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: AppColors.primaryColor,
                                    deleteIconColor: Colors.white,
                                    deleteIcon: const Icon(
                                      Icons.close,
                                      size: 18,
                                    ),
                                    labelStyle:
                                        const TextStyle(color: Colors.white),
                                    label: Text(chip3text),
                                    onDeleted: () {
                                      setState(() {
                                        chip3visible = !chip3visible;
                                      });
                                    },
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      '4 results for "${widget.taskertype}"',
                      style: const TextStyle(
                          fontSize: 16,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                TaskerCard(
                    name: "Dianne Rusell",
                    charges: "500",
                    rating: "4.5",
                    reviewcount: "4",
                    waitingcount: "5",
                    description:
                        "Who specializes in installing and maintaining systems used for potable (drinking) water, sewage and drainage in plumbing systems.",
                    photourl:
                        "https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg"),
                TaskerCard(
                    name: "Meet Chavan",
                    charges: "900",
                    rating: "5.0",
                    reviewcount: "90",
                    waitingcount: "2",
                    description:
                        "Trained in all aspects of plumbing, including potable water, sewage, and drainage systems installation and maintenance.",
                    photourl:
                        "https://img.freepik.com/free-photo/bearded-young-man-wearing-shirt_273609-5938.jpg"),
                TaskerCard(
                    name: "Brooklyn Simmons",
                    charges: "600",
                    rating: "4.3",
                    reviewcount: "6",
                    waitingcount: "3",
                    description:
                        "Skilled professional in the installation and upkeep of plumbing systems for drinking water, waste management, and drainage.",
                    photourl:
                        "https://img.freepik.com/free-photo/emotions-people-concept-headshot-serious-looking-handsome-man-with-beard-looking-confident-determined_1258-26730.jpg"),
                TaskerCard(
                    name: "Devon Lane",
                    charges: "900",
                    rating: "5.0",
                    reviewcount: "90",
                    waitingcount: "2",
                    description:
                        "Trained in all aspects of plumbing, including potable water, sewage, and drainage systems installation and maintenance.",
                    photourl:
                        "https://img.freepik.com/free-photo/beautiful-male-half-length-portrait-isolated-white-studio-background-young-emotional-hindu-man-blue-shirt-facial-expression-human-emotions-advertising-concept-standing-smiling_155003-25250.jpg"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget TaskerCard(
    {name = "",
    charges = "",
    rating = "",
    reviewcount = "",
    waitingcount = "",
    description = "",
    required photourl}) {
  return Container(
    height: 205,
    color: Colors.white,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 80,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(photourl ?? ""),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '$rating ($reviewcount Reviews)',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle_outline,
                                  color: AppColors.primaryColor,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '$waitingcount waiting in line jobs',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '₹$charges/hr',
                    style: const TextStyle(
                        fontSize: 16,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                '''$description''',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 14,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        const Divider()
      ],
    ),
  );
}
