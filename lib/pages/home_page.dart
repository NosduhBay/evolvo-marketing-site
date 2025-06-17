import 'package:flutter/material.dart';
import 'package:group7evolvo/pages/login_page.dart';
import 'package:group7evolvo/utils/app_colours.dart';
import 'package:group7evolvo/widgets/shop_item.dart';
import 'package:group7evolvo/widgets/subscription_card.dart';
import 'package:group7evolvo/widgets/testimonial_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _plansKey = GlobalKey();
  final GlobalKey _shopKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800), // Smooth scroll duration
        curve: Curves.easeInOut, // Smoother animation curve
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    // Use LayoutBuilder to make decisions based on screen width
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHeroSection(key: _heroKey),
                    _buildWhatIsEvolvoSection(key: _aboutKey),
                    const SizedBox(height: 60),
                    _buildAboutSection(),
                    const SizedBox(height: 60),
                    _buildSubscriptionSection(key: _plansKey),
                  const SizedBox(height: 60),
                  _buildTestimonialsSection(),
                  const SizedBox(height: 60),
                  _buildShopSection(key: _shopKey),
                  const SizedBox(height: 60),
                  _buildFooter(),
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
      color: AppColors.primaryText, // Use the background color for the header
      padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'ĒVOLVŌ', // Using the correct branding
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: AppColors.background,
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  _scrollToSection(_heroKey);
                },
                child: const Text('Home', style: TextStyle(color: AppColors.secondaryText))),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  _scrollToSection(_aboutKey);
                },
                child: const Text('About', style: TextStyle(color: AppColors.secondaryText))),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  _scrollToSection(_plansKey);
                },
                child: const Text('Plans', style: TextStyle(color: AppColors.secondaryText))),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  _scrollToSection(_shopKey);
                },
                child: const Text('Shop', style: TextStyle(color: AppColors.secondaryText))),
              const SizedBox(width: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.background,
                  foregroundColor: AppColors.primaryText,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: const Text('Login/Sign Up'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWhatIsEvolvoSection({Key? key}) {
    return Container(
      key: key,
      width: double.infinity,
      color: AppColors.lightGrey, // Use light grey for visual separation
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 60.0),
      child: const Column(
        children: [
          Text(
            'What is Ēvolvō?',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primaryText),
          ),
          SizedBox(height: 24),
          Text(
            'Ēvolvō is more than just a fitness brand; it’s a digital-first community dedicated to a holistic approach to health and wellness. Led by award-winning fitness and nutrition coach Daniela Suarez, Ēvolvō provides convenient, expert-led services designed to nurture a healthy and sustainable relationship between your mind and body. Our goal is not about quick transformations, but about empowering you to achieve your most authentic and powerful self through balanced living and long-term evolution.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: AppColors.secondaryText, height: 1.7),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection({Key? key}) {

    return Container(
      key: key,
      height: 500,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          // Using the specific image from the screenshot for brand consistency
          image: AssetImage('assets/home_background.png'),
          fit: BoxFit.cover,
          opacity: 0.5, // Adjust opacity for a subtle overlay effect
        ),
      ),
      child: Container(
        // Dark overlay for text readability
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'ĒVOLVŌ',
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Evolve with Ēvolvō',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  _scrollToSection(_plansKey);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                   backgroundColor: Colors.white,
                   foregroundColor: AppColors.primaryText,
                ),
                child: const Text('Explore Plans'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutSection({Key? key}) {
    return Container(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 40.0),
      child: const Column(
        children: [
          Text(
            'About Daniela Suarez',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primaryText),
          ),
          SizedBox(height: 24),
          Text(
            'Daniela Suarez is an award-winning fitness and nutrition coach dedicated to helping you achieve your best self. With a holistic approach to fitness, she has inspired millions to embark on their wellness journey. She is the author of a nutrition textbook and a multiple-time fitness contest winner.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: AppColors.secondaryText, height: 1.7),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionSection({Key? key}) {
    return Column(
      key: key,
      children: [
        const Text(
          'Choose Your Plan',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primaryText),
        ),
        const SizedBox(height: 40),
        const Wrap(
          spacing: 24,
          runSpacing: 24,
          alignment: WrapAlignment.center,
          children: [
            SubscriptionCard(
              title: 'Free Tier', 
              price: 'Free', 
              features: [
                'Access to free videos for each program',
                'Access to Daniela\'s blog',
                'Access to Daniela\'s YouTube channel',
              ],
              ),
            SubscriptionCard(
              title: 'Momentum',
              price: '\$99/month',
              features: [
                'All videos',
                'Nutrition guides',
                'Exclusive Q&A sessions',
                'Free mat and band bundle (annual plan)'
              ],
            ),
            SubscriptionCard(
              title: 'Ascend',
              price: '\$499/month',
              features: ['All Momentum features', '4 group training sessions/month'],
            ),
            SubscriptionCard(
              title: 'Pinnacle',
              price: '\$1499/month',
              features: ['All Momentum features', '4 personal 1-on-1 sessions/month'],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTestimonialsSection() {
    return Container(
      width: double.infinity,
      color: AppColors.lightGrey,
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 60.0),
      child: const Column(
        children: [
          Text(
            'What Our Members Say',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primaryText),
          ),
          SizedBox(height: 40),
          TestimonialWidget(
            testimonial: """Daniela has the most amazing, infectious energy, which radiates from the moment you meet her. She is so supportive, and you can feel that she really wants to empower you to succeed in your fitness goals, whatever they are. She taught me so much in just 3 months that to this day, I’ve implemented into my daily routines. Not only did she help me lose 15 lbs and help me get to my dream body, but she taught me how to make healthy choices in the kitchen and in life that can make it last. I’ve never had such an easy time maintaining my body and fitness level as I have after being coached by her, and that’s not an easy feat for my very busy work schedule! She honestly changed my life, and I’m lucky to have met such an amazing person that I also can now call my friend. I can’t recommend Daniela more!""",
            author: 'Leila'),
          SizedBox(height: 20),
          TestimonialWidget(
            testimonial: """ Before joining Daniela's coaching program, I would work out regularly. Yet, I struggled to get fit and just wanted to feel good again. She offered far more than just fitness and nutrition mentorship. We focused on limiting beliefs and reprogramming the mind/body through specific exercises. She always provided all the tools I needed to work through the areas where we identified the limiting beliefs. I began to see significant changes in my body, but the biggest win was feeling good again. I got leaner and stronger, and with the changes, I also became more confident. You'll love her incredible energy, and she's also extremely knowledgeable - she loves what she does. I am forever grateful for this experience and for having her as my coach.""",
            author: 'Maribel',
          ),
          SizedBox(height: 20),
          TestimonialWidget(
            testimonial: """The results after coaching were insanely good, I think this is the peak of my fitness now that I am done. I always had an issue with my posture, now it’s not there because I have gained muscles in my back. Also, I am very satisfied in general with my overall body, I was never self-confident but now I am 100%. It is very important to know that fitness is not just an appearance or a nice body; it is a complete lifestyle, and it is earned. I would recommend Daniela because she’s extremely friendly and determined to make you reach your fitness goal. Another important thing that was absent in other coaches that I personally encountered is that Daniela listens to you and she wants you to enjoy the workout, therefore the workouts were to an extent tailored to what I usually enjoy doing at the gym which is amazing! Also, the tips she gives you and the motivation are things that can be applied to your everyday life, and they are things she teaches you. Now that I don’t live in Canada anymore, I always remember the things and advice she taught me! Lastly, she is very approachable, highly knowledgeable in nutrition and fitness, and professional (always on time, you always have her full attention, she’s always prepared).""",
            author: 'Salma',
          ),
        ],
      ),
    );
  }

  Widget _buildShopSection({Key? key}) {
    return Container(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 40.0),
      child: const Column(
        children: [
          Text(
            'Shop Ēvolvō Essentials',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primaryText),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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

  Widget _buildFooter() {
    return Container(
      color: AppColors.primaryText,
      padding: const EdgeInsets.all(40.0),
      child: const Center(
        child: Text(
          'This website is purely a proof of concept for an assignment, it is based on an case given in class and is not to be used commercially. It is not affiliated with Evolvo in any way so please do not take it as such. It will only be available for a limited time surrounding the assignment due date such that it can be reviewed and graded.',
          style: TextStyle(color: AppColors.lightGrey),
        ),
      ),
    );
  }
}