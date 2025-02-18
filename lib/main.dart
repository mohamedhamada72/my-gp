/*import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/firebase_options.dart';
import 'package:scholar_chat/pages/home_screen.dart';
import 'package:scholar_chat/pages/login_page.dart';
import 'package:scholar_chat/pages/register_page_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( EczemaSD());
}

class EczemaSD extends StatelessWidget {
  const EczemaSD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
  
  routes: {
    
    LoginPage.id: (context) => LoginPage(),

     
    RegisterPage.id: (context) =>RegisterPage(),

     Home_screen.id: (context) =>Home_screen(),

     

  },
      initialRoute: LoginPage.id,
);
  }
}*/

/*
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/firebase_options.dart';
import 'package:scholar_chat/pages/OnboardingScreens.dart';
import 'package:scholar_chat/pages/home_screen.dart';
import 'package:scholar_chat/pages/login_page.dart';
import 'package:scholar_chat/pages/register_page_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const EczemaSD());
}

class EczemaSD extends StatelessWidget {
  const EczemaSD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.id: (context) =>  LoginPage(),
        RegisterPage.id: (context) =>  RegisterPage(),
        Home_screen.id: (context) =>  Home_screen(),
        OnboardingScreen.id: (context) =>  OnboardingScreen(), // إضافة الصفحة هنا
      },
      initialRoute: OnboardingScreen.id, // جعل الصفحة الأولية هي OnboardingScreen
    );
  }
}
*/
/*
//الكود شغال بجل مشكلة الدخول علي زر الخريطة اكتر من مرة  في الكود الل بعده
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scholar_chat/firebase_options.dart';
import 'package:scholar_chat/pages/OnboardingScreens.dart';
import 'package:scholar_chat/pages/home_screen.dart';
import 'package:scholar_chat/pages/login_page.dart';
import 'package:scholar_chat/pages/register_page_screen.dart';
import 'package:scholar_chat/pages/maps_provider.dart'; // استيراد الـ Provider

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MapProvider()), // ✅ إضافة الـ Provider هنا
      ],
      child: EczemaSD(), // ❌ إزالة `const` من هنا
    ),
  );
}

class EczemaSD extends StatelessWidget {
  // ❌ إزالة `const` لأن الكلاس يحتوي على بيانات متغيرة
  EczemaSD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: OnboardingScreen.id, // ✅ جعل شاشة البداية `OnboardingScreen`
      routes: {
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        Home_screen.id: (context) => Home_screen(),
        OnboardingScreen.id: (context) => OnboardingScreen(),
      },
    );
  }
}
*/import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scholar_chat/firebase_options.dart';
import 'package:scholar_chat/pages/DermatologyClinicMapScreen.dart';
import 'package:scholar_chat/pages/OnboardingScreens.dart';
import 'package:scholar_chat/pages/home_screen.dart';
import 'package:scholar_chat/pages/login_page.dart';
import 'package:scholar_chat/pages/register_page_screen.dart';
import 'package:scholar_chat/pages/maps_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MapProvider(), lazy: false), // ✅ تحميل المزود عند بدء التطبيق
      ],
      child: EczemaSD(),
    ),
  );
}

class EczemaSD extends StatelessWidget {
  EczemaSD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: OnboardingScreen.id, // ✅ جعل شاشة البداية `OnboardingScreen`
      routes: {
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        Home_screen.id: (context) => Home_screen(),
        OnboardingScreen.id: (context) => OnboardingScreen(),
      },
    );
  }
}

// ✅ الطريقة الصحيحة لفتح `DermatologyClinicMapScreen` دون إعادة إنشاء `MapProvider`
void navigateToClinicMapScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DermatologyClinicMapScreen(Clinices: []),
    ),
  );
}
