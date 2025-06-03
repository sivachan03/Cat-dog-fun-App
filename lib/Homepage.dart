import 'package:cat_dog_gallery/animals/cat.dart';
import 'package:cat_dog_gallery/animals/dog.dart';

import 'package:cat_dog_gallery/constent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 105, 115),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 56, 55),
        foregroundColor: foreground,
        centerTitle: true,
        title: const Text('Cat and Dog Gallery', style: textcolor),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(10)),
            const SizedBox(height: 20),
            Text("Welcome to Cat and Dog Gallery", style: textcolor),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () => {Get.to(Catfun())},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      width: double.infinity,
                      height: 220,
                      child: Column(
                        children: [
                          Image.asset(
                            'images/cat.jpg',
                            fit: BoxFit.contain,
                            height: 180,
                          ),
                          Text(
                            "Cat Gallery",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () => {Get.to(Dogfun())},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      width: double.infinity,
                      height: 220,
                      child: Column(
                        children: [
                          Image.asset(
                            'images/dog1.jpg',
                            fit: BoxFit.contain,
                            height: 180,
                          ),
                          Text(
                            "Dog Gallery",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Container(child: Text("data", style: textcolor)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
