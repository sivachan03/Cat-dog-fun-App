import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http show get;

class GalleryScreen extends StatefulWidget {
  final String title;
  final String apiUrl;
  final Color appBarColor;

  const GalleryScreen({
    required this.title,
    required this.apiUrl,
    required this.appBarColor,
  });

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  Future<void> fetchImages() async {
    final response = await http.get(Uri.parse(widget.apiUrl));
    final List data = jsonDecode(response.body);
    setState(() {
      imageUrls = data.map((item) => item['url'] as String).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.appBarColor,
      ),
      body: RefreshIndicator(
        onRefresh: fetchImages,
        child: GridView.builder(
          padding: EdgeInsets.all(8),
          itemCount: imageUrls.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder:
              (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imageUrls[index],
                  fit: BoxFit.cover,
                  width: 160,
                ),
              ),
        ),
      ),
    );
  }
}
