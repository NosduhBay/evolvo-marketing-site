import 'package:flutter/material.dart';
import 'package:group7evolvo/utils/app_colours.dart';

class DashboardStatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  const DashboardStatCard({super.key, required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
         boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 2, blurRadius: 8)],
      ),
      child: Row(
        children: [
          Icon(icon, size: 40, color: AppColors.primaryText),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primaryText)),
              Text(label, style: const TextStyle(fontSize: 14, color: AppColors.secondaryText)),
            ],
          ),
        ],
      ),
    );
  }
}