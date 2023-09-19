import 'package:flutter/material.dart';
import 'package:gdsc_task/screens/search/searchlocation.dart';
import 'package:gdsc_task/screens/search/searchservices.dart';
import 'package:gdsc_task/screens/search/searchtasker.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tasker App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: "Roboto"),
      debugShowCheckedModeBanner: false,
      home: const TempScreen(),
    );
  }
}

class TempScreen extends StatelessWidget {
  const TempScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Temporary Navigation"),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const SearchLocation());
              },
              style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
              ),
              child: const Text("Location Select Page"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const SearchServices());
              },
              style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
              ),
              child: const Text("Services Search Page"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const SearchTasker("Plumber"));
              },
              style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
              ),
              child: const Text("Tasker Search Page"),
            )
          ],
        ),
      ),
    );
  }
}
