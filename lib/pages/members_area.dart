import 'package:flutter/material.dart';
import 'package:group7evolvo/utils/app_colours.dart';
import 'package:group7evolvo/widgets/dashboard_stat_card.dart';
import 'package:group7evolvo/widgets/nutrition_guide_tile.dart';
import 'package:group7evolvo/widgets/shop_item.dart';
import 'package:group7evolvo/widgets/training_booking_card.dart';
import 'package:group7evolvo/widgets/workout_video_card.dart';
import 'home_page.dart';

class MembersArea extends StatefulWidget {
  const MembersArea({super.key, required this.email});
  final String email;

  @override
  State<MembersArea> createState() => _MembersAreaState();
}

class _MembersAreaState extends State<MembersArea> {
  // --- User Tier Constants & Logic ---
  static const String momentumMemberEmail = 'momentum_member@evolvo.com';
  static const String ascendMemberEmail = 'ascend_member@evolvo.com';
  static const String pinnacleMemberEmail = 'pinnacle_member@evolvo.com';

  String _getUserTier() {
    switch (widget.email) {
      case momentumMemberEmail:
        return 'Momentum';
      case ascendMemberEmail:
        return 'Ascend';
      case pinnacleMemberEmail:
        return 'Pinnacle';
      default:
        return 'Free';
    }
  }

  // --- Scroll Keys & Function ---
  final GlobalKey _dashboardKey = GlobalKey();
  final GlobalKey _myWorkoutsKey = GlobalKey();
  final GlobalKey _nutritionGuidesKey = GlobalKey();
  final GlobalKey _shopKey = GlobalKey();
  final GlobalKey _personalTrainingKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final String userTier = _getUserTier();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDashboardSection(key: _dashboardKey, userTier: userTier),
                  const SizedBox(height: 40),
                  _buildPersonalTrainingSection(key: _personalTrainingKey, userTier: userTier),
                  const SizedBox(height: 40),
                  _buildMyWorkoutsSection(key: _myWorkoutsKey, userTier: userTier),
                  const SizedBox(height: 40),
                  _buildNutritionGuidesSection(key: _nutritionGuidesKey, userTier: userTier),
                  const SizedBox(height: 40),
                  _buildShopSection(key: _shopKey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: AppColors.primaryText,
      padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'ĒVOLVŌ - Member Portal',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: AppColors.background,
            ),
          ),
          Row(
            children: [
              TextButton(onPressed: () => _scrollToSection(_dashboardKey), child: const Text('Dashboard', style: TextStyle(color: Colors.white70))),
              const SizedBox(width: 20),
              TextButton(onPressed: () => _scrollToSection(_personalTrainingKey), child: const Text('Personal Training', style: TextStyle(color: Colors.white70))),
              const SizedBox(width: 20),
              TextButton(onPressed: () => _scrollToSection(_myWorkoutsKey), child: const Text('My Workouts', style: TextStyle(color: Colors.white70))),
              const SizedBox(width: 20),
              TextButton(onPressed: () => _scrollToSection(_nutritionGuidesKey), child: const Text('Nutrition Guides', style: TextStyle(color: Colors.white70))),
              const SizedBox(width: 20),
              TextButton(onPressed: () => _scrollToSection(_shopKey), child: const Text('Shop', style: TextStyle(color: Colors.white70))),
              const SizedBox(width: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.background,
                  foregroundColor: AppColors.primaryText,
                ),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardSection({required Key key, required String userTier}) {
     return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back, $userTier Member!',
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primaryText),
        ),
        const SizedBox(height: 24),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DashboardStatCard(icon: Icons.fitness_center, value: '14', label: 'Workouts Completed'),
            DashboardStatCard(icon: Icons.video_library_outlined, value: '3', label: 'New Videos This Week!'),
          ],
        )
      ],
    );
  }

  Widget _buildMyWorkoutsSection({required Key key, required String userTier}) {
    final workoutData = [
      {
        'category': 'Abs & Core',
        'videos': [
          {'title': '5-Min Quick Core', 'duration': '5 min', 'imageUrl': 'assets/core_exercise.jpg', 'isFree': true},
          {'title': 'Advanced Ab Burner', 'duration': '20 min', 'imageUrl': 'assets/advanced_ab_burner.png', 'isFree': false},
          {'title': 'Core Stability with Bands', 'duration': '15 min', 'imageUrl': 'assets/core_stability_with_bands.png', 'isFree': false},
          {'title': 'Pilates Core Flow', 'duration': '30 min', 'imageUrl': 'assets/pilates_core_flow.png', 'isFree': false},
          {'title': 'Standing Abs Routine', 'duration': '15 min', 'imageUrl': 'assets/standing_abs_routine.png', 'isFree': false},
          {'title': 'Advanced Core Challenge', 'duration': '25 min', 'imageUrl': 'assets/advanced_core_challenge.png', 'isFree': false},
          {'title': 'Core Recovery Stretch', 'duration': '10 min', 'imageUrl': 'assets/core_recovery_stretch.png', 'isFree': false},
        ],
      },
      {
        'category': 'Glutes & Legs',
        'videos': [
          {'title': 'Intro to Glute Activation', 'duration': '10 min', 'imageUrl': 'assets/intro_to_glute_activation.png', 'isFree': true},
          {'title': 'Resistance Band Glute Workout', 'duration': '25 min', 'imageUrl': 'assets/resistance_band_glute_workout.png', 'isFree': false},
          {'title': 'Intro to Bodyweight Squats', 'duration': '15 min', 'imageUrl': 'assets/intro_to_bodyweight_squats.png', 'isFree': false},
          {'title': 'Resistance Band Quad Workout', 'duration': '35 min', 'imageUrl': 'assets/resistance_band_quad_workout.png', 'isFree': false},
          {'title': 'Hamstring Focused Workout', 'duration': '30 min', 'imageUrl': 'assets/hamstring_focused_workout.png', 'isFree': false},
          {'title': 'Full Leg Burnout', 'duration': '20 min', 'imageUrl': 'assets/full_leg_burnout.png', 'isFree': false},
          {'title': 'Glute Activation Cool Down', 'duration': '10 min', 'imageUrl': 'assets/glute_activation_cool_down.png', 'isFree': false},
          {'title': 'Legs & Glutes Recovery', 'duration': '15 min', 'imageUrl': 'assets/legs_and_glutes_recovery.png', 'isFree': false},
        ],
      },
      {
        'category': 'Upper Body & Arms',
        'videos': [
          {'title': 'Upper Body Warm-Up', 'duration': '10 min', 'imageUrl': 'assets/upper_body_warmup.png', 'isFree': true},
          {'title': 'Resistance Band Arm Workout', 'duration': '20 min', 'imageUrl': 'assets/resistance_band_arm_workout.png', 'isFree': false},
          {'title': 'Push-Up Progressions', 'duration': '15 min', 'imageUrl': 'assets/push_up_progressions.png', 'isFree': false},
          {'title': 'Full Upper Body Circuit', 'duration': '30 min', 'imageUrl': 'assets/full_upper_body_circuit.png', 'isFree': false},
          {'title': 'Bicep & Tricep Focused Workout', 'duration': '25 min', 'imageUrl': 'assets/bicep_tricep_focused_workout.png', 'isFree': false},
          {'title': 'Shoulder Mobility Routine', 'duration': '20 min', 'imageUrl': 'assets/shoulder_mobility_routine.png', 'isFree': false},
          {'title': 'Upper Body Cool Down Stretch', 'duration': '10 min', 'imageUrl': 'assets/upper_body_cool_down_stretch.png', 'isFree': false},
        ],
      },
      {
        'category': 'Flexibility & Mobility',
        'videos': [
          {'title': 'Full Body Morning Stretch', 'duration': '15 min', 'imageUrl': 'assets/full_body_morning_stretch.png', 'isFree': true},
          {'title': 'Deep Hip Openers', 'duration': '20 min', 'imageUrl': 'assets/deep_hip_openers.png', 'isFree': false},
          {'title': 'Seated Forward Bend', 'duration': '10 min', 'imageUrl': 'assets/seated_forward_bend.png', 'isFree': false},
          {'title': 'Standing Balance Flow', 'duration': '15 min', 'imageUrl': 'assets/standing_balance_flow.png', 'isFree': false},
          {'title': 'Upper Body Mobility Routine', 'duration': '20 min', 'imageUrl': 'assets/upper_body_mobility_routine.png', 'isFree': false},
          {'title': 'Foam Roller Recovery', 'duration': '30 min', 'imageUrl': 'assets/foam_roller_recovery.png', 'isFree': false},
          {'title': 'Yoga for Flexibility', 'duration': '25 min', 'imageUrl': 'assets/yoga_for_flexibility.png', 'isFree': false},
          {'title': 'Gentle Evening Stretch', 'duration': '15 min', 'imageUrl': 'assets/gentle_evening_stretch.png', 'isFree': false},
        ],
      },
      {
        'category': 'Cardio & HIIT',
        'videos': [
          {'title': '10-Minute HIIT Blast', 'duration': '10 min', 'imageUrl': 'assets/10_minute_hiit_blast.png', 'isFree': true},
          {'title': 'Full Body Cardio Circuit', 'duration': '30 min', 'imageUrl': 'assets/full_body_cardio_circuit.png', 'isFree': false},
          {'title': 'Low Impact Cardio', 'duration': '20 min', 'imageUrl': 'assets/low_impact_cardio.png', 'isFree': false},
          {'title': 'Tabata Cardio Workout', 'duration': '15 min', 'imageUrl': 'assets/tabata_cardio_workout.png', 'isFree': false},
          {'title': 'Cardio Kickboxing Routine', 'duration': '25 min', 'imageUrl': 'assets/cardio_kickboxing_routine.png', 'isFree': false},
          {'title': 'Dance Cardio Party', 'duration': '30 min', 'imageUrl': 'assets/dance_cardio_party.png', 'isFree': false},
          {'title': 'HIIT for Beginners', 'duration': '20 min', 'imageUrl': 'assets/hiit_for_beginners.png', 'isFree': false},
          {'title': 'Cardio Cool Down Stretch', 'duration': '10 min', 'imageUrl': 'assets/cardio_cool_down_stretch.png', 'isFree': false},
        ],
      },
      {
        'category': 'Yoga & Mindfulness',
        'videos': [
          {'title': 'Morning Yoga Flow', 'duration': '20 min', 'imageUrl': 'assets/morning_yoga_flow.png', 'isFree': true},
          {'title': 'Evening Relaxation Yoga', 'duration': '30 min', 'imageUrl': 'assets/evening_relaxation_yoga.png', 'isFree': false},
          {'title': 'Mindful Breathing Techniques', 'duration': '15 min', 'imageUrl': 'assets/mindful_breathing_techniques.png', 'isFree': false},
          {'title': 'Gentle Yoga for Stress Relief', 'duration': '25 min', 'imageUrl': 'assets/gentle_yoga_for_stress_relief.png', 'isFree': false},
          {'title': 'Yoga for Better Sleep', 'duration': '20 min', 'imageUrl': 'assets/yoga_for_better_sleep.png', 'isFree': false},
          {'title': 'Yoga Nidra for Deep Relaxation', 'duration': '30 min', 'imageUrl': 'assets/yoga_nidra_for_deep_relaxation.png', 'isFree': false},
          {'title': 'Vinyasa Flow for Energy', 'duration': '25 min', 'imageUrl': 'assets/vinyasa_flow_for_energy.png', 'isFree': false},
          {'title': 'Guided Meditation Session', 'duration': '15 min', 'imageUrl': 'assets/guided_meditation_session.png', 'isFree': false},
        ],
      },
    ];

    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: workoutData.map((categoryData) {
        final videos = categoryData['videos'] as List<Map<String, Object>>;
        return Padding(
          padding: const EdgeInsets.only(bottom: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoryData['category'] as String,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primaryText),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    final video = videos[index];
                    bool isLocked = userTier == 'Free' && !(video['isFree'] as bool);
                    return WorkoutVideoCard(
                      title: video['title'] as String,
                      duration: video['duration'] as String,
                      imageUrl: video['imageUrl'] as String,
                      isLocked: isLocked,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNutritionGuidesSection({required Key key, required String userTier}) {
    bool isLocked = userTier == 'Free';
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const Text(
          'Nutrition Guides',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primaryText),
        ),
        const SizedBox(height: 20),
        NutritionGuideTile(title: '7-Day Meal Prep Plan', description: 'Healthy eating made easy for your week.', isLocked: isLocked),
        NutritionGuideTile(title: 'Post-Workout Smoothies', description: 'Recipes to refuel and recover.', isLocked: isLocked),
        NutritionGuideTile(title: 'Understanding Macros', description: 'A guide to proteins, carbs, and fats.', isLocked: isLocked),
        NutritionGuideTile(title: 'Meal Prep Basics', description: 'Learn how to meal prep like a pro.', isLocked: isLocked),
        NutritionGuideTile(title: 'Healthy Snack Ideas', description: 'Quick and nutritious snack options.', isLocked: isLocked),
        NutritionGuideTile(title: 'Hydration Tips', description: 'Stay hydrated with these simple tips.', isLocked: isLocked),
        NutritionGuideTile(title: 'Mindful Eating Practices', description: 'Learn to eat with awareness and intention.', isLocked: isLocked),
        NutritionGuideTile(title: 'Nutrition Myths Debunked', description: 'Separate fact from fiction in nutrition.', isLocked: isLocked),
        NutritionGuideTile(title: 'Balanced Diet Essentials', description: 'What you need for a balanced diet.', isLocked: isLocked),
        NutritionGuideTile(title: 'Meal Planning for Success', description: 'Plan your meals for optimal health.', isLocked: isLocked),
        NutritionGuideTile(title: 'Eating for Energy', description: 'Foods that boost your energy levels.', isLocked: isLocked),
      ],
    );
  }

  Widget _buildPersonalTrainingSection({required Key key, required String userTier}) {
     return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const Text(
          'Personal Training',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primaryText),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            userTier == 'Ascend'
                ? Expanded(
                    child: TrainingBookingCard(
                      title: 'Group Sessions',
                      description: 'Join a small group session with Daniela.',
                      isEnabled: userTier == 'Ascend',
                    ),
                  )
                : const SizedBox.shrink(),
            userTier == 'Pinnacle'
                ? Expanded(
                    child: TrainingBookingCard(
                      title: '1-on-1 with Daniela',
                      description: 'Book your exclusive, private session.',
                      isEnabled: userTier == 'Pinnacle',
                    ),
                  )
                : const SizedBox.shrink(),
            userTier == 'Momentum' || userTier == 'Free'
                ? Expanded(
                    child: TrainingBookingCard(
                      title: 'Book a Session',
                      description: 'Upgrade to book a session with Daniela.',
                      isEnabled: false,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        )
      ],
    );
  }
  
  Widget _buildShopSection({required Key key}) {
     return Container(
      key: key,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shop Essentials',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primaryText),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ShopItem(
                imageUrl: 'assets/resistance_bands.png',
                name: 'Resistance Bands',
                price: '\$33',
              ),
              SizedBox(width: 40),
              ShopItem(
                imageUrl: 'assets/yoga_mat.jpeg',
                name: 'Yoga Mat',
                price: '\$42',
              ),
            ],
          ),
        ],
      ),
    );
  }
}