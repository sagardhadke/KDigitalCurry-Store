import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final int price;
  final int oldPrice;

  const ProductCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.price,
    required this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: const Color(0XFFECECED),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                width: double.infinity,
                height: 120,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                '₹ $price',
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                '₹ $oldPrice',
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
