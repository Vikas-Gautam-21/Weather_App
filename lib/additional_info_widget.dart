import 'package:flutter/material.dart';

class AdditionalInfoItem extends StatelessWidget {
  final IconData iconData;
  final String label;
  final String label2;
  const AdditionalInfoItem({
    super.key,
    required this.iconData,
    required this.label,
    required this.label2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: [
          Icon(
            iconData,
            size: 32,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            label,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            label2,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
