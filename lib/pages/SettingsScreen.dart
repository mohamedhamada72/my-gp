/*import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة المستخدم في وسط الجزء العلوي
            Center(
              child: Container(
                width: 200, // عرض الصورة
                height: 250, // ارتفاع الصورة
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // زوايا مدورة (اختياري)
                ),
                child: Image.asset(
                  'assets/images/imagedoc.png', // مسار الصورة
                  fit: BoxFit.cover, // لجعل الصورة تملأ المساحة المحددة
                ),
              ),
            ),
            SizedBox(height: 20),

            // خيارات الإعدادات
            _buildSettingButton('Edit Profile', Icons.edit, context),
            _buildSettingButton('Language', Icons.language, context),
            _buildSettingButton('Log Out', Icons.logout, context),
            _buildSettingButton('About', Icons.info, context),

           
            Spacer(),
          ],
        ),
      ),
    );
  }

  // دالة لبناء أزرار الإعدادات
  Widget _buildSettingButton(String title, IconData icon, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),)
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueGrey),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueGrey),
        onTap: () {
          // يمكنك إضافة تفاعل عند النقر على الزر
          _handleButtonClick(title, context);
        },
      ),
    );
  }

  // دالة للتعامل مع النقر على الأزرار
  void _handleButtonClick(String title, BuildContext context) {
    switch (title) {
      case 'Edit Profile':
        // تفاعل عند النقر على Edit Profile
        print('Edit Profile clicked');
        break;
      case 'Language':
        // تفاعل عند النقر على Language
        print('Language clicked');
        break;
      case 'Log Out':
        // تفاعل عند النقر على Log Out
        print('Log Out clicked');
        break;
      case 'About':
        // تفاعل عند النقر على About
        print('About clicked');
        break;
      default:
        break;
    }
  }
}
*/
/*
//ده شغال وتمام بس شغلنا في زر about بس 
import 'package:flutter/material.dart';
import 'aboutScreeen.dart'; // تأكد من أن الملف موجود

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 200,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  'assets/images/imagedoc.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),

            _buildSettingButton('Edit Profile', Icons.edit),
            _buildSettingButton('Language', Icons.language),
            _buildSettingButton('Log Out', Icons.logout),

            // زر About مع التنقل إلى AboutScreen
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.blueGrey),
                title: Text(
                  'About',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueGrey),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutScreen()),
                  );
                },
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingButton(String title, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueGrey),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueGrey),
      ),
    );
  }
}
*/
/*
//ده شغال وتمام بس شغلنا في زرارين about and log aut
import 'package:flutter/material.dart';
import 'login_page.dart'; // تأكد من أن هذا الملف موجود
import 'aboutScreeen.dart'; // تأكد من أن الملف موجود

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 200,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  'assets/images/imagedoc.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),

            _buildSettingButton('Edit Profile', Icons.edit, () {}),
            _buildSettingButton('Language', Icons.language, () {}),

            // زر Log Out الذي يعيد المستخدم إلى صفحة تسجيل الدخول
            _buildSettingButton('Log Out', Icons.logout, () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()), // صفحة تسجيل الدخول
              );
            }),

            // زر About مع التنقل إلى AboutScreen
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.blueGrey),
                title: Text(
                  'About',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueGrey),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutScreen()),
                  );
                },
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingButton(String title, IconData icon, VoidCallback onTap) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueGrey),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueGrey),
        onTap: onTap, // استخدام onTap لتمرير الوظيفة المناسبة لكل زر
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'login_page.dart'; // تأكد من أن هذا الملف موجود
import 'aboutScreeen.dart'; // تأكد من أن الملف موجود

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isArabic = false; // متغير لتحديد اللغة الحالية

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isArabic ? 'الإعدادات' : 'Settings'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 250,
                height: 230,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  'assets/images/onboarding2.gif',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),

            _buildSettingButton(isArabic ? 'تعديل الملف الشخصي' : 'Edit Profile', Icons.edit, () {}),
            
            // زر تغيير اللغة
            _buildSettingButton(isArabic ? 'تغيير اللغة' : 'Language', Icons.language, () {
              setState(() {
                isArabic = !isArabic; // تبديل اللغة
              });
            }),

            _buildSettingButton(isArabic ? 'تسجيل الخروج' : 'Log Out', Icons.logout, () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            }),

            // زر About
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.blueGrey),
                title: Text(
                  isArabic ? 'عن التطبيق' : 'About',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueGrey),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutScreen()),
                  );
                },
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingButton(String title, IconData icon, VoidCallback onTap) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueGrey),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueGrey),
        onTap: onTap,
      ),
    );
  }
}
