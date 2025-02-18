/*
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scholar_chat/pages/login_page.dart';

class OnboardingScreen extends StatefulWidget {
  static String id = 'onboarding_screen';
  
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 2);
            },
            children: [
              buildPage(
                image: 'assets/images/Doctor.png',
                title: 'مرحبًا بك!',
                description: 'تطبيقنا يوفر لك أفضل الميزات',
              ),
              buildPage(
                image: 'assets/images/onboarding1.gif',
                title: 'سهولة الاستخدام',
                description: 'تم تصميم التطبيق ليوفر لك تجربة سلسة',
              ),
              buildPage(
                image: 'assets/images/onboarding2.gif',
                title: 'ابدأ الآن!',
                description: 'اضغط على زر البدء للانطلاق',
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) => buildDot(index)),
                ),
                const SizedBox(height: 20),
                isLastPage
                    ? ElevatedButton(
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setBool('seenOnboarding', true);
                          Navigator.pushReplacementNamed(context, LoginPage.id);
                        },
                        child: Text('ابدأ'),
                      )
                    : TextButton(
                        onPressed: () => _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        ),
                        child: Text('التالي'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage({required String image, required String title, required String description}) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 300),
          const SizedBox(height: 20),
          Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(description, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isLastPage && index == 2 ? Colors.blue : Colors.grey,
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scholar_chat/pages/login_page.dart';

class OnboardingScreen extends StatefulWidget {
  static String id = 'onboarding_screen';

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية المتدرجة
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white70, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // المحتوى الرئيسي
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 2);
            },
            children: [
              buildPage(
                image: 'assets/images/Doctor.png',
                title: ' Eczema management!',
                description: 'Track your symptoms and get personalized medical advice',
              ),
              buildPage(
                image: 'assets/images/image_girl.png',
                title: ' Early diagnosis',
                description: 'To know your diagnosis accurately and avoid illness',
              ),
              buildPage(
                image: 'assets/images/image_no_bg.png',
                title: ' Track your progress',
                description: 'Watch your skin improve over time and learn all about this disease.',
              ),
            ],
          ),

          // الأزرار والمؤشرات في الأسفل
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) => buildDot(index)),
                ),
                const SizedBox(height: 20),
                isLastPage
                    ? ElevatedButton(
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setBool('seenOnboarding', true);
                          Navigator.pushReplacementNamed(context, LoginPage.id);
                        },
                        child: Text('Start'),
                      )
                    : TextButton(
                        onPressed: () => _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        ),
                        child: Text('Next'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage({required String image, required String title, required String description}) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 300),
          const SizedBox(height: 20),
          Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(description, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isLastPage && index == 2 ? Colors.blue : Colors.grey,
      ),
    );
  }
}
