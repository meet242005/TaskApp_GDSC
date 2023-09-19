//Created By Meet Chavan

import 'package:flutter/material.dart';
import 'package:gdsc_task/constants/colors.dart';
import 'package:gdsc_task/constants/lists.dart';
import 'package:gdsc_task/screens/search/searchtasker.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({super.key});

  @override
  _SearchLocationState createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  TextEditingController search_query = TextEditingController();
  var current_fetched_location = "";

  var locationlist = StaticListData.cities;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future geoLocator() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Location Permission is Not Available")));
      Geolocator.openAppSettings();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Location Permission is Not Available")));
        Geolocator.openAppSettings();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Location Permission is Not Available")));
      Geolocator.openAppSettings();
    }

    Position? position = await Geolocator.getCurrentPosition();
    var placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    setState(() {
      current_fetched_location = placemark[0].locality.toString();
      setLocation(current_fetched_location);
    });
  }

  Future setLocation(String location) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('userLocation', location);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Location is set to $location")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 210,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
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
                      "Location",
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
                      Expanded(
                          child: TextField(
                        controller: search_query,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Find your location"),
                        onChanged: (value) {
                          setState(() {
                            //required for changing icon to close
                          });
                        },
                      )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            if (search_query.text != "") {
                              setState(() {
                                search_query.text = "";
                              });
                            }
                          },
                          child: Icon(search_query.text == ""
                              ? Icons.search
                              : Icons.close),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    geoLocator();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.my_location_outlined,
                        color: Colors.grey.shade800,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        current_fetched_location == ""
                            ? "Current Location"
                            : current_fetched_location,
                        style: const TextStyle(
                            fontSize: 16,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: locationlist.length,
              itemBuilder: (BuildContext context, int index) {
                if (locationlist[index]
                    .toString()
                    .toLowerCase()
                    .contains(search_query.text.toLowerCase())) {
                  return InkWell(
                    onTap: () {
                      setLocation(locationlist[index]);
                    },
                    child: SizedBox(
                      height: 55,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.grey.shade800,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  locationlist[index],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            height: 0,
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
