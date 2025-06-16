import 'package:flutter/material.dart';
import 'package:group7evolvo/utils/app_colours.dart';

class TrainingBookingCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isEnabled;

  const TrainingBookingCard({super.key, required this.title, required this.description, required this.isEnabled});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: isEnabled ? AppColors.background : AppColors.lightGrey,
      elevation: isEnabled ? 4 : 1,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryText)),
            const SizedBox(height: 8),
            Text(description, style: TextStyle(color: AppColors.secondaryText)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isEnabled ? () {} : null,
              child: Text(isEnabled ? 'Book Now' : 'Upgrade to Unlock'),
            )
          ],
        ),
      ),
    );
  }
}