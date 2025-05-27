import 'package:cat_dog_gallery/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  // live_aiJnlkv6MkEh2er72yUQ4GbgDnyStkNjvQ8LV5FcAzNUwqnWwStMkXEbVitnAJ1t

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
