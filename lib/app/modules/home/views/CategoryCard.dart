import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const CategoryCard({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imagePath,
                fit: BoxFit.cover, width: double.infinity),
          ),
        ),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
