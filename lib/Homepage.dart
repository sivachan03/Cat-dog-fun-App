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
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        foregroundColor: foreground,
        centerTitle: true,
        title: const Text('Cat and Dog Gallery', style: textcolor),
      ),
      body: Center(
        child: Column(
          children: [
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
                      height: 200,
                      child: Column(
                        children: [
                          Image.asset(
                            'images/cat.jpg',
                            fit: BoxFit.contain,
                            height: 180,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
                      height: 200,
                      child: Column(
                        children: [
                          Image.asset(
                            'images/dog1.jpg',
                            fit: BoxFit.contain,
                            height: 180,
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
