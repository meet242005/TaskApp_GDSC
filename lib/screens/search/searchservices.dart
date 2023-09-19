import 'package:flutter/material.dart';
import 'package:gdsc_task/constants/colors.dart';
import 'package:gdsc_task/screens/search/searchtasker.dart';
import 'package:get/get.dart';

class SearchServices extends StatefulWidget {
  const SearchServices({super.key});

  @override
  _SearchServicesState createState() => _SearchServicesState();
}

class _SearchServicesState extends State<SearchServices> {
  TextEditingController search_query = TextEditingController();

  var services = [
    "AC Cleaning",
    "Plumbing",
    "Electrician",
    "Carpentry",
    "Painting",
    "Landscaping",
    "Roofing",
    "Pest Control",
    "HVAC Repair",
    "Appliance Repair",
    "Flooring Installation",
    "Home Cleaning",
    "Interior Design",
    "Auto Repair",
    "Computer Repair",
    "Gardening",
    "Moving and Packing",
    "Window Cleaning",
    "Home Security",
    "Locksmith",
    "Dry Cleaning",
    "Laundry",
    "Carpet Cleaning",
    "Pool Cleaning",
    "Junk Removal",
    "Handyman Services",
    "Furniture Assembly",
    "Renovation",
    "Kitchen Remodeling",
    "Bathroom Remodeling",
    "Legal Services",
    "Financial Planning",
    "Tax Preparation",
    "Real Estate",
    "Event Planning",
    "Catering",
    "Photography",
    "Web Design",
    "Graphic Design",
    "Marketing",
    "Printing",
    "Fitness Training",
    "Personal Coaching",
    "Tutoring",
    "Childcare",
    "Pet Grooming",
    "Pet Sitting",
    "Travel Planning",
    "Wedding Planning",
    "Massage Therapy",
    "Hair Salon",
    "Nail Salon",
    "Spa Services",
    "Yoga Classes",
    "Pilates Classes",
    "Personal Training",
    "Dog Training",
    "Dog Walking",
    "Veterinary Services",
    "Plumbing Inspection",
    "Home Inspection",
    "Home Staging",
    "Home Theater Installation",
    "Security System Installation",
    "Home Automation",
    "Swimming Pool Installation",
    "Land Surveying",
    "Architectural Services",
    "House Cleaning",
    "Office Cleaning",
    "Window Installation",
    "Glass Repair",
    "Septic Tank Services",
    "Dumpster Rental",
    "Tree Services",
    "Lawn Care",
    "Irrigation Services",
    "Fence Installation",
    "Garage Door Repair",
    "Lock Installation",
    "Security Camera Installation",
    "Pressure Washing",
    "Deck Installation",
    "Concrete Services",
    "Masonry",
    "Paving",
    "Home Theater Design",
    "Audio Installation",
    "Plumbing Fixture Installation",
    "Solar Panel Installation",
    "Chimney Services",
    "Roof Repair",
    "Exterior Painting",
    "Wallpaper Installation",
    "Commercial Cleaning",
    "Event Catering",
    "Party Planning",
    "DJ Services",
    "Music Lessons",
    "Language Lessons"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 180,
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
                      "Search Services",
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
                            hintText: "Search for Services"),
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
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: services.length,
              itemBuilder: (BuildContext context, int index) {
                if (services[index]
                    .toString()
                    .toLowerCase()
                    .contains(search_query.text.toLowerCase())) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => SearchTasker(services[index]));
                    },
                    child: SizedBox(
                      height: 55,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                            child: Text(
                              services[index],
                              style: const TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Divider()
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
