import 'package:flutter/material.dart';
import 'package:group7evolvo/utils/app_colours.dart';
import 'members_area.dart';
import 'login_page.dart'; // We need this to access the static email addresses

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  // Helper method to handle navigation, keeping the UI code cleaner
  void _loginAs(BuildContext context, String email) {
    // We use pushReplacement to simulate a real login flow
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MembersArea(email: email)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: Colors.white, // Use a strong color for the app bar
        title: const Text('Ēvolvō - Create Account'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.dashboard_customize_outlined, size: 48, color: AppColors.secondaryText),
              const SizedBox(height: 16),
              const Text(
                'Select a Tier to Demo',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primaryText),
              ),
              const SizedBox(height: 8),
              const Text(
                'Click a card to instantly log in as that user type.',
                style: TextStyle(fontSize: 16, color: AppColors.secondaryText),
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  TierLoginCard(
                    title: 'Free Member',
                    description: 'Preview the basic, locked experience.',
                    icon: Icons.explore_outlined,
                    onTap: () => _loginAs(context, LoginPage.freeTierMemberEmail),
                  ),
                  TierLoginCard(
                    title: 'Momentum Member',
                    description: 'Access to videos and nutrition guides.',
                    icon: Icons.trending_up,
                    onTap: () => _loginAs(context, LoginPage.momentumMemberEmail),
                  ),
                  TierLoginCard(
                    title: 'Ascend Member',
                    description: 'Unlocks group training sessions.',
                    icon: Icons.groups_2_outlined,
                    onTap: () => _loginAs(context, LoginPage.ascendMemberEmail),
                  ),
                  TierLoginCard(
                    title: 'Pinnacle Member',
                    description: 'Full access to all features & 1-on-1s.',
                    icon: Icons.star_outline,
                    onTap: () => _loginAs(context, LoginPage.pinnacleMemberEmail),
                  ),
                ],
              ),

              const SizedBox(height: 40),
              TextButton(
                onPressed: () {
                  // Navigate back to the standard login page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text('Go to Standard Login Page',
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A reusable card widget for our demo login portal.
class TierLoginCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const TierLoginCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
            )
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 32, color: AppColors.primaryText),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.secondaryText,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}