import 'package:flutter/material.dart';
import 'package:group7evolvo/utils/app_colours.dart';

class SubscriptionCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> features;

  const SubscriptionCard({
    super.key,
    required this.title,
    required this.price,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 470,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withOpacity(0.25),
            spreadRadius: 5,
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Plan Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
          const SizedBox(height: 12),

          // Plan Price
          Text(
            price,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.secondaryText,
            ),
          ),
          const SizedBox(height: 24),
          
          // Divider
          const Divider(color: AppColors.lightGrey, thickness: 1),
          const SizedBox(height: 24),

          // Features List
          Column(
            children: features.map((feature) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 2.0),
                      child: Icon(Icons.check_circle_outline, color: AppColors.primaryText, size: 18),
                    ),
                    const SizedBox(width: 12),
                    Expanded( // This widget ensures the text wraps
                      child: Text(
                        feature,
                        style: const TextStyle(
                          color: AppColors.secondaryText,
                          fontSize: 15,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
            const Spacer(),

          // Action Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryText,
              foregroundColor: AppColors.background,
              minimumSize: const Size(double.infinity, 50),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )
            ),
            child: const Text('Choose Plan'),
          ),
        ],
      ),
    );
  }
}