import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Dogfun extends StatefulWidget {
  const Dogfun({super.key});

  @override
  State<Dogfun> createState() => _DogfunState();
}

class _DogfunState extends State<Dogfun> {
  bool showdogs = true;
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    fetchImages(); // Load dog images by default
  }

  Future<void> fetchImages() async {
    setState(() {
      imageUrls = [];
    });

    final url =
        showdogs
            ? Uri.parse('https://api.thedogapi.com/v1/images/search?limit=20')
            : Uri.parse('https://api.thedogapi.com/v1/images/search?limit=20');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        imageUrls =
            showdogs
                ? List<String>.from(data.map((item) => item['url']))
                : List<String>.from(data['message']);
      });
    } else {
      print("Failed to load images");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('dog or Dog Gallery'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                showdogs = true;
              });
              fetchImages();
            },
            child: const Text('dogs', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                showdogs = false;
              });
              fetchImages();
            },
            child: const Text('Dogs', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body:
          imageUrls.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                onRefresh: fetchImages,
                child: GridView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: imageUrls.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return Image.network(imageUrls[index], fit: BoxFit.cover);
                  },
                ),
              ),
    );
  }
}
