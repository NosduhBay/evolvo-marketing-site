import 'package:flutter/material.dart';
import 'package:group7evolvo/utils/app_colours.dart';

class NutritionGuideTile extends StatelessWidget {
  final String title;
  final String description;
  final bool isLocked;

  const NutritionGuideTile({
    super.key, 
    required this.title, 
    required this.description, 
    this.isLocked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isLocked ? AppColors.lightGrey : AppColors.background,
      elevation: isLocked ? 1 : 4,
      child: ListTile(
        leading: Icon(
          isLocked ? Icons.lock_outline : Icons.article_outlined, 
          color: isLocked ? AppColors.secondaryText : AppColors.primaryText,
        ),
        title: Text(
          title, 
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            color: isLocked ? AppColors.secondaryText : AppColors.primaryText,
          ),
        ),
        subtitle: Text(
          description, 
          style: TextStyle(color: AppColors.secondaryText),
        ),
        trailing: Icon(
          isLocked ? null : Icons.download_for_offline_outlined, 
          color: AppColors.secondaryText,
        ),
        onTap: isLocked ? () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Upgrade your plan to access!')),
          );
        } : () {},
      ),
    );
  }
}