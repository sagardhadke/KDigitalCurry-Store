import 'package:flutter/material.dart';

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Care",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const BulletPointText("Machine wash cold with like colors."),
          const BulletPointText("Gentle cycle to maintain texture."),
          const BulletPointText("Do not bleach."),
          const BulletPointText("Tumble dry low or hang to dry."),
          const BulletPointText(
              "Iron on low heat if needed, avoiding the textured creases."),
          const BulletPointText("Do not dry clean."),
          const SizedBox(height: 16),
          const Divider(thickness: 1.2),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.local_shipping, size: 20),
              const SizedBox(width: 8),
              Text(
                "Shipping Worldwide",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const ShippingInfoItem(
              icon: Icons.credit_card, text: "100% Secure Payment"),
          const ShippingInfoItem(
              icon: Icons.fire_truck, text: "Free Shipping Order Above ₹300"),
          const ShippingInfoItem(
              icon: Icons.repeat_rounded, text: "Extended Returns"),
        ],
      ),
    );
  }
}

class BulletPointText extends StatelessWidget {
  final String text;
  const BulletPointText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("• ", style: TextStyle(fontSize: 16)),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
      ],
    );
  }
}

class ShippingInfoItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const ShippingInfoItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
