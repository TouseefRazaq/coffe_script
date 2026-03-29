import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<Widget> pages = [
    OnboardingPage(
      image: 'assets/images/onboarding1.png',
      title: 'Embrace coffee\nessence',
      subtitle: 'Start your day with the rich\naroma of freshly brewed coffee.',
    ),
    OnboardingPage(
      image: 'assets/images/onboarding2.png',
      title: 'Flavorful bean\njourney',
      subtitle:
          'From farm to cup, explore the\nworld of handpicked coffee beans.',
    ),
    OnboardingPage(
      image: 'assets/images/onboarding3.png',
      title: 'Unlock bean\nsecrets',
      subtitle:
          'Your perfect cup is one step away.\nJoin our coffee community.',
      isLastPage: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            physics: const BouncingScrollPhysics(), // smooth transition
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            children: pages,
          ),
          if (currentIndex != 2)
            Positioned(
              top: 30,
              right: 20,
              child: TextButton(
                onPressed: () {
                  _controller.animateToPage(
                    2,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          Positioned(
            top: 50,
            left: 30,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: pages.length,
                effect: const WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 8,
                  activeDotColor: Color.fromARGB(255, 215, 158, 109),
                  dotColor: Colors.white54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final bool isLastPage;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.isLastPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        color: Color.fromRGBO(0, 0, 0, 0.3),
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            Spacer(flex: 3),
            if (isLastPage)
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(206, 151, 96, 1.0),
                        foregroundColor: Color.fromARGB(255, 84, 58, 32),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Color.fromRGBO(206, 151, 96, 1.0),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(
                          color: Color.fromRGBO(206, 151, 96, 1.0),
                          width: 2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
