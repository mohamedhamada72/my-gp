/*import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scholar_chat/pages/QuestionsScreen.dart'; // استيراد صفحة الأسئلة

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  static String id = 'Home_screen';

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  final picker = ImagePicker();
  List<String> notes = []; // قائمة الملاحظات
  TextEditingController noteController = TextEditingController(); // للتحكم في النص المدخل
  int? selectedIndex; // لحفظ الملاحظة المختارة للتعديل

  String userName = "Ahmed"; // مثال لاسم المستخدم، يمكن تغييره حسب الحاجة

  // اختيار صورة من الكاميرا
  Future getImageFromCamera() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'camera')),
    );
  }

  // اختيار صورة من المعرض
  Future getImageFromGallery() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'gallery')),
    );
  }

  // إضافة ملاحظة جديدة أو تعديل ملاحظة موجودة
  void saveNote() {
    if (noteController.text.isNotEmpty) {
      setState(() {
        if (selectedIndex == null) {
          notes.add(noteController.text); // إضافة ملاحظة جديدة
        } else {
          notes[selectedIndex!] = noteController.text; // تعديل ملاحظة
          selectedIndex = null; // إعادة تعيين
        }
        noteController.clear(); // مسح النص المدخل
      });
    }
  }

  // حذف الملاحظة
  void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  // تعديل ملاحظة موجودة
  void editNote(int index) {
    setState(() {
      noteController.text = notes[index]; // وضع النص في الحقل
      selectedIndex = index; // تعيين الملاحظة المختارة
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome back, $userName'), // إضافة رسالة الترحيب باسم المستخدم
        backgroundColor: Colors.blueGrey,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // عرض الملاحظات
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(notes[index]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // زر تعديل
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () => editNote(index),
                            ),
                            // زر حذف
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => deleteNote(index),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                
                // حقل النص لإضافة الملاحظات في وسط الشاشة مع زيادة الحجم
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: noteController,
                      maxLines: 5,  // زيادة عدد الأسطر في حقل النص
                      decoration: InputDecoration(
                        labelText: 'Enter your note',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16), // زيادة المسافات داخل حقل النص
                      ),
                    ),
                  ),
                ),
                // زر حفظ الملاحظة
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: saveNote,
                    child: Text(selectedIndex == null ? 'Add Note' : 'Update Note'),
                  ),
                ),
              ],
            ),
          ),

          // الأزرار تحت بعضهم في الجهة اليمنى مع زر Show Note فوق Open Camera
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // زر فتح الكاميرا
                  ElevatedButton.icon(
                    onPressed: getImageFromCamera,
                    icon: Icon(Icons.camera_alt),
                    label: Text("Open Camera"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // اللون الجديد
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // مساحة بين الأزرار
                  // زر فتح المعرض
                  ElevatedButton.icon(
                    onPressed: getImageFromGallery,
                    icon: Icon(Icons.photo_library),
                    label: Text("Open Gallery"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // اللون الجديد
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
 */
/*  // ده اللي عاملي صفحة الملاحظات show node
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scholar_chat/pages/QuestionsScreen.dart'; // استيراد صفحة الأسئلة
import 'NotesScreen.dart'; // استيراد صفحة الملاحظات
//import 'package:cloud_firestore/cloud_firestore.dart';

class Home_screen extends StatefulWidget {
   Home_screen({Key? key}) : super(key: key);

  static String id = 'Home_screen';
 
   //CollectionReference messages  = FirebaseFirestore.instance.collection('messages');
 
   
  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  final picker = ImagePicker();
  List<String> notes = []; // قائمة الملاحظات
  TextEditingController noteController = TextEditingController(); // للتحكم في النص المدخل
  int? selectedIndex; // لحفظ الملاحظة المختارة للتعديل

  String userName = "Ahmed"; // مثال لاسم المستخدم، يمكن تغييره حسب الحاجة

  // اختيار صورة من الكاميرا
  Future getImageFromCamera() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'camera')),
    );
  }

  // اختيار صورة من المعرض
  Future getImageFromGallery() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'gallery')),
    );
  }

  // إضافة ملاحظة جديدة أو تعديل ملاحظة موجودة
  void saveNote() {
    if (noteController.text.isNotEmpty) {
      setState(() {
        if (selectedIndex == null) {
          notes.add(noteController.text); // إضافة ملاحظة جديدة
        } else {
          notes[selectedIndex!] = noteController.text; // تعديل ملاحظة
          selectedIndex = null; // إعادة تعيين
        }
        noteController.clear(); // مسح النص المدخل
      });
    }
  }

  // حذف الملاحظة
  void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  // تعديل ملاحظة موجودة
  void editNote(int index) {
    setState(() {
      noteController.text = notes[index]; // وضع النص في الحقل
      selectedIndex = index; // تعيين الملاحظة المختارة
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome back, $userName'), // إضافة رسالة الترحيب باسم المستخدم
        backgroundColor: Colors.blueGrey,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // عرض الملاحظات
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(notes[index]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // زر تعديل
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () => editNote(index),
                            ),
                            // زر حذف
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => deleteNote(index),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                
                // حقل النص لإضافة الملاحظات في وسط الشاشة مع زيادة الحجم
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: noteController,
                      maxLines: 5,  // زيادة عدد الأسطر في حقل النص
                      decoration: InputDecoration(
                        labelText: 'Enter your note',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16), // زيادة المسافات داخل حقل النص
                      ),
                    ),
                  ),
                ),
                // زر حفظ الملاحظة
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: saveNote,
                    child: Text(selectedIndex == null ? 'Add Note' : 'Update Note'),
                  ),
                ),
                // زر عرض الملاحظات
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotesScreen(notes: notes),
                        ),
                      );
                    },
                    child: Text('Show Notes'),
                  ),
                ),
              ],
            ),
          ),
          // الأزرار تحت بعضهم في الجهة اليمنى مع زر Show Note فوق Open Camera
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // زر فتح الكاميرا
                  ElevatedButton.icon(
                    onPressed: getImageFromCamera,
                    icon: Icon(Icons.camera_alt),
                    label: Text("Open Camera"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // اللون الجديد
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // مساحة بين الأزرار
                  // زر فتح المعرض
                  ElevatedButton.icon(
                    onPressed: getImageFromGallery,
                    icon: Icon(Icons.photo_library),
                    label: Text("Open Gallery"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // اللون الجديد
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/ 



//ده كدا تمام فشخ انت ناقصك شوية تعديل بسيط عشان تظبط مكان النوتس المحفوظة  وتكريت توت جديدة

/*import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // إضافة هذه المكتبة
import 'package:scholar_chat/pages/NotesScreen.dart';

class Home_screen extends StatefulWidget {
  Home_screen({Key? key}) : super(key: key);

  static String id = 'Home_screen';

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  final picker = ImagePicker();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController noteController = TextEditingController();

  User? user;
  String userName = "User";
  List<Map<String, dynamic>> notes = [];
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    user = _auth.currentUser;
    if (user != null) {
      setState(() {
        userName = user!.email ?? "User";
      });
    }
  }

  void saveNote() async {
    if (noteController.text.isNotEmpty && user != null) {
      String uid = user!.uid;

      if (selectedIndex == null) {
        await _firestore.collection('users').doc(uid).collection('notes').add({
          'text': noteController.text,
          'timestamp': FieldValue.serverTimestamp(),  // تأكد من إضافة هذا الحقل
        });
      } else {
        await _firestore
            .collection('users')
            .doc(uid)
            .collection('notes')
            .doc(notes[selectedIndex!]['id'])
            .update({'text': noteController.text});
        selectedIndex = null;
      }
      noteController.clear();
    }
  }

  void deleteNote(int index) async {
    if (user != null) {
      String uid = user!.uid;
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('notes')
          .doc(notes[index]['id'])
          .delete();
    }
  }

  void editNote(int index) {
    setState(() {
      noteController.text = notes[index]['text'];
      selectedIndex = index;
    });
  }

  Future<void> getImageFromCamera() async {
    await picker.pickImage(source: ImageSource.camera);
  }

  Future<void> getImageFromGallery() async {
    await picker.pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome back, $userName'),
        backgroundColor: Colors.blueGrey,
      ),
      body: user == null
          ? Center(child: CircularProgressIndicator())
          : StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('users')
                  .doc(user!.uid)
                  .collection('notes')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                notes = snapshot.data!.docs.map((doc) {
                  return {
                    'id': doc.id,
                    'text': doc['text'],
                    'timestamp': doc['timestamp'],
                  };
                }).toList();

                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: notes.length,
                        itemBuilder: (context, index) {
                          // تنسيق التاريخ
                          String formattedDate = "";
                          if (notes[index]['timestamp'] != null) {
                            formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(
                                (notes[index]['timestamp'] as Timestamp).toDate());
                          }

                          return ListTile(
                            title: Text(notes[index]['text']),
                            subtitle: notes[index]['timestamp'] != null
                                ? Text(formattedDate)
                                : Text('No timestamp available'),  // عرض رسالة إذا لم يكن هناك تاريخ
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () => editNote(index),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () => deleteNote(index),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: noteController,
                            maxLines: 3,
                            decoration: InputDecoration(
                              labelText: 'Enter your note',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: saveNote,
                            child: Text(selectedIndex == null ? 'Add Note' : 'Update Note'),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NotesScreen(notes: notes),
                                ),
                              );
                            },
                            child: Text('Show Notes'),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton.icon(
                              onPressed: getImageFromCamera,
                              icon: Icon(Icons.camera_alt),
                              label: Text("Open Camera"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton.icon(
                              onPressed: getImageFromGallery,
                              icon: Icon(Icons.photo_library),
                              label: Text("Open Gallery"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // إضافة هذه المكتبة
//import 'package:scholar_chat/pages/NotesScreen.dart';  لو هجيب زرار ال show note
import 'package:scholar_chat/pages/QuestionsScreen.dart'; // استيراد صفحة الأسئلة

class Home_screen extends StatefulWidget {
  Home_screen({Key? key}) : super(key: key);

  static String id = 'Home_screen';

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  final picker = ImagePicker();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController noteController = TextEditingController();

  User? user;
  String userName = "User";
  List<Map<String, dynamic>> notes = [];
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    user = _auth.currentUser;
    if (user != null) {
      setState(() {
        userName = user!.email ?? "User";
      });
    }
  }

  void saveNote() async {
    if (noteController.text.isNotEmpty && user != null) {
      String uid = user!.uid;

      if (selectedIndex == null) {
        await _firestore.collection('users').doc(uid).collection('notes').add({
          'text': noteController.text,
          'timestamp': FieldValue.serverTimestamp(),
        });
      } else {
        await _firestore
            .collection('users')
            .doc(uid)
            .collection('notes')
            .doc(notes[selectedIndex!]['id'])
            .update({'text': noteController.text});
        selectedIndex = null;
      }
      noteController.clear();
    }
  }

  void deleteNote(int index) async {
    if (user != null) {
      String uid = user!.uid;
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('notes')
          .doc(notes[index]['id'])
          .delete();
    }
  }

  void editNote(int index) {
    setState(() {
      noteController.text = notes[index]['text'];
      selectedIndex = index;
    });
  }

  // اختيار صورة من الكاميرا
  Future getImageFromCamera() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'camera')),
    );
  }

  // اختيار صورة من المعرض
  Future getImageFromGallery() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'gallery')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome back, $userName'),
        backgroundColor: Colors.blueGrey,
      ),
      body: user == null
          ? Center(child: CircularProgressIndicator())
          : StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('users')
                  .doc(user!.uid)
                  .collection('notes')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                notes = snapshot.data!.docs.map((doc) {
                  return {
                    'id': doc.id,
                    'text': doc['text'],
                    'timestamp': doc['timestamp'],
                  };
                }).toList();

                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: notes.length,
                        itemBuilder: (context, index) {
                          String formattedDate = "";
                          if (notes[index]['timestamp'] != null) {
                            formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(
                                (notes[index]['timestamp'] as Timestamp).toDate());
                          }

                          return ListTile(
                            title: Text(notes[index]['text']),
                            subtitle: notes[index]['timestamp'] != null
                                ? Text(formattedDate)
                                : Text('No timestamp available'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () => editNote(index),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () => deleteNote(index),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: noteController,
                            maxLines: 3,
                            decoration: InputDecoration(
                              labelText: 'Enter your note',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: saveNote,
                            child: Text(selectedIndex == null ? 'Add Note' : 'Update Note'),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton.icon(
                              onPressed: getImageFromCamera,
                              icon: Icon(Icons.camera_alt),
                              label: Text("Open Camera"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton.icon(
                              onPressed: getImageFromGallery,
                              icon: Icon(Icons.photo_library),
                              label: Text("Open Gallery"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
*/    

/*
//احدث نسخة وصلتلها للكود مخلي كل ويدجت لوحدها 
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // إضافة هذه المكتبة
import 'package:scholar_chat/pages/QuestionsScreen.dart'; // استيراد صفحة الأسئلة

class Home_screen extends StatefulWidget {
  Home_screen({Key? key}) : super(key: key);

  static String id = 'Home_screen';

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  final picker = ImagePicker();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController noteController = TextEditingController();

  User? user;
  String userName = "User";
  List<Map<String, dynamic>> notes = [];
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    user = _auth.currentUser;
    if (user != null) {
      setState(() {
        userName = user!.email ?? "User";
      });
    }
  }

  void saveNote() async {
    if (noteController.text.isNotEmpty && user != null) {
      String uid = user!.uid;

      if (selectedIndex == null) {
        await _firestore.collection('users').doc(uid).collection('notes').add({
          'text': noteController.text,
          'timestamp': FieldValue.serverTimestamp(),
        });
      } else {
        await _firestore
            .collection('users')
            .doc(uid)
            .collection('notes')
            .doc(notes[selectedIndex!]['id'])
            .update({'text': noteController.text});
        selectedIndex = null;
      }
      noteController.clear();
    }
  }

  void deleteNote(int index) async {
    if (user != null) {
      String uid = user!.uid;
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('notes')
          .doc(notes[index]['id'])
          .delete();
    }
  }

  void editNote(int index) {
    setState(() {
      noteController.text = notes[index]['text'];
      selectedIndex = index;
    });
  }

  // اختيار صورة من الكاميرا
  Future getImageFromCamera() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'camera')),
    );
  }

  // اختيار صورة من المعرض
  Future getImageFromGallery() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'gallery')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome back, $userName'),
        backgroundColor: Colors.blueGrey,
      ),
      body: user == null
          ? Center(child: CircularProgressIndicator())
          : StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('users')
                  .doc(user!.uid)
                  .collection('notes')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                notes = snapshot.data!.docs.map((doc) {
                  return {
                    'id': doc.id,
                    'text': doc['text'],
                    'timestamp': doc['timestamp'],
                  };
                }).toList();

                return Column(
                  children: [
                    Expanded(
                      child: NotesList(
                        notes: notes,
                        onEdit: editNote,
                        onDelete: deleteNote,
                      ),
                    ),
                    NoteInput(
                      controller: noteController,
                      onSave: saveNote,
                      isEditing: selectedIndex != null,
                    ),
                    CameraGalleryButtons(
                      onCameraPressed: getImageFromCamera,
                      onGalleryPressed: getImageFromGallery,
                    ),
                  ],
                );
              },
            ),
    );
  }
}

// ويدجت لعرض قائمة النوتات
class NotesList extends StatelessWidget {
  final List<Map<String, dynamic>> notes;
  final Function(int) onEdit;
  final Function(int) onDelete;

  const NotesList({
    Key? key,
    required this.notes,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        String formattedDate = "";
        if (notes[index]['timestamp'] != null) {
          formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(
              (notes[index]['timestamp'] as Timestamp).toDate());
        }

        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Text(notes[index]['text']),
            subtitle: notes[index]['timestamp'] != null
                ? Text(formattedDate)
                : Text('No timestamp available'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => onEdit(index),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => onDelete(index),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ويدجت لإدخال النوتات
class NoteInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final bool isEditing;

  const NoteInput({
    Key? key,
    required this.controller,
    required this.onSave,
    required this.isEditing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            maxLines: 3,
            decoration: InputDecoration(
              labelText: 'Enter your note',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: onSave,
            child: Text(isEditing ? 'Update Note' : 'Add Note'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ويدجت لأزرار الكاميرا والمعرض
class CameraGalleryButtons extends StatelessWidget {
  final VoidCallback onCameraPressed;
  final VoidCallback onGalleryPressed;

  const CameraGalleryButtons({
    Key? key,
    required this.onCameraPressed,
    required this.onGalleryPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: onCameraPressed,
              icon: Icon(Icons.camera_alt),
              label: Text("Open Camera"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: onGalleryPressed,
              icon: Icon(Icons.photo_library),
              label: Text("Open Gallery"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
/*
// الكود ده لحد هنا بتاع التقويم بشكل صحيح وكتابتة وعرض النوتة في الصفحة الرئيسية مع وجود الكميرا والمعرض
//ده شكل التقويم وباقي الصفحة معى مشكلة زرار month
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // إضافة هذه المكتبة
import 'package:scholar_chat/pages/QuestionsScreen.dart'; // استيراد صفحة الأسئلة
import 'package:scholar_chat/widgets/CalendarWidget.dart'; // استيراد ويدجت التقويم

class Home_screen extends StatefulWidget {
  Home_screen({Key? key}) : super(key: key);

  static String id = 'Home_screen';

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  final picker = ImagePicker();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController noteController = TextEditingController();

  User? user;
  String userName = "User";
  List<Map<String, dynamic>> notes = [];
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    user = _auth.currentUser;
    if (user != null) {
      setState(() {
        userName = user!.email ?? "User";
      });
    }
  }

  void saveNote() async {
    if (noteController.text.isNotEmpty && user != null) {
      String uid = user!.uid;

      if (selectedIndex == null) {
        await _firestore.collection('users').doc(uid).collection('notes').add({
          'text': noteController.text,
          'timestamp': FieldValue.serverTimestamp(),
        });
      } else {
        await _firestore
            .collection('users')
            .doc(uid)
            .collection('notes')
            .doc(notes[selectedIndex!]['id'])
            .update({'text': noteController.text});
        selectedIndex = null;
      }
      noteController.clear();
    }
  }

  void deleteNote(int index) async {
    if (user != null) {
      String uid = user!.uid;
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('notes')
          .doc(notes[index]['id'])
          .delete();
    }
  }

  void editNote(int index) {
    setState(() {
      noteController.text = notes[index]['text'];
      selectedIndex = index;
    });
  }

  // اختيار صورة من الكاميرا
  Future getImageFromCamera() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'camera')),
    );
  }

  // اختيار صورة من المعرض
  Future getImageFromGallery() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'gallery')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome back, $userName'),
        backgroundColor: Colors.blueGrey,
      ),
      body: user == null
          ? Center(child: CircularProgressIndicator())
          : StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('users')
                  .doc(user!.uid)
                  .collection('notes')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                notes = snapshot.data!.docs.map((doc) {
                  return {
                    'id': doc.id,
                    'text': doc['text'],
                    'timestamp': doc['timestamp'],
                  };
                }).toList();

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      // عرض التقويم
                      CalendarWidget(),// في ايرور هنا

                      // عرض النوتات
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: notes.length,
                        itemBuilder: (context, index) {
                          String formattedDate = "";
                          if (notes[index]['timestamp'] != null) {
                            formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(
                                (notes[index]['timestamp'] as Timestamp).toDate());
                          }

                          return ListTile(
                            title: Text(notes[index]['text']),
                            subtitle: notes[index]['timestamp'] != null
                                ? Text(formattedDate)
                                : Text('No timestamp available'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () => editNote(index),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () => deleteNote(index),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: noteController,
                              maxLines: 3,
                              decoration: InputDecoration(
                                labelText: 'Enter your note',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: saveNote,
                              child: Text(selectedIndex == null ? 'Add Note' : 'Update Note'),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton.icon(
                                onPressed: getImageFromCamera,
                                icon: Icon(Icons.camera_alt),
                                label: Text("Open Camera"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton.icon(
                                onPressed: getImageFromGallery,
                                icon: Icon(Icons.photo_library),
                                label: Text("Open Gallery"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
/*
//الكود ده وصلنا في انه الزراير اتعملت تحت الكميرا والنوت اللي بدوس عليها بتوديني ف صفحة لوحدها والتيكست فيلد ف النص مع وجود التقويم في الاعلي 
*/import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:scholar_chat/pages/QuestionsScreen.dart'; // استيراد صفحة الأسئلة
import 'package:scholar_chat/widgets/CalendarWidget.dart'; // استيراد ويدجت التقويم
import 'AddNoteScreen.dart'; // استيراد صفحة إدخال النوتة

class Home_screen extends StatefulWidget {
  Home_screen({Key? key}) : super(key: key);

  static String id = 'Home_screen';

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? user;
  String userName = "User";
  List<Map<String, dynamic>> notes = [];

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    user = _auth.currentUser;
    if (user != null) {
      setState(() {
        userName = user!.email ?? "User";
      });
    }
  }

  void deleteNote(int index) async {
    if (user != null) {
      String uid = user!.uid;
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('notes')
          .doc(notes[index]['id'])
          .delete();
    }
  }

  Future getImageFromCamera() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'camera')),
    );
  }

  Future getImageFromGallery() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'gallery')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome back, $userName'),
        backgroundColor: Colors.blueGrey,
      ),
      body: user == null
          ? Center(child: CircularProgressIndicator())
          : StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('users')
                  .doc(user!.uid)
                  .collection('notes')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                notes = snapshot.data!.docs.map((doc) {
                  return {
                    'id': doc.id,
                    'text': doc['text'],
                    'timestamp': doc['timestamp'],
                  };
                }).toList();

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      CalendarWidget(),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: notes.length,
                        itemBuilder: (context, index) {
                          String formattedDate = "";
                          if (notes[index]['timestamp'] != null) {
                            formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(
                                (notes[index]['timestamp'] as Timestamp).toDate());
                          }
                          return ListTile(
                            title: Text(notes[index]['text']),
                            subtitle: notes[index]['timestamp'] != null
                                ? Text(formattedDate)
                                : Text('No timestamp available'),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => deleteNote(index),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "addNote",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNoteScreen()),
              );
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "camera",
            onPressed: getImageFromCamera,
            child: Icon(Icons.camera_alt),
            backgroundColor: Colors.blue,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "gallery",
            onPressed: getImageFromGallery,
            child: Icon(Icons.photo_library),
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}

*/
/*
//كدا تمام باقي زر ال settings والصفحات بتاعته بعدين اشكلهم من تحت
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scholar_chat/pages/QuestionsScreen.dart';
import 'package:scholar_chat/widgets/CalendarWidget.dart';
import 'AddNoteScreen.dart';

class Home_screen extends StatefulWidget {
  Home_screen({Key? key}) : super(key: key);

  static String id = 'Home_screen';

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? user;
  String userName = "User";

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    user = _auth.currentUser;
    if (user != null) {
      setState(() {
        userName = user!.email ?? "User";
      });
    }
  }

  // حذف ملاحظة من Firestore
  void deleteNote(String noteId) {
    _firestore.collection('users').doc(user!.uid).collection('notes').doc(noteId).delete();
  }

  // تعديل ملاحظة
  void editNote(String noteId, String currentText) {
    TextEditingController textController = TextEditingController(text: currentText);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Note"),
        content: TextField(
          controller: textController,
          decoration: InputDecoration(hintText: "Add New Note"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              _firestore.collection('users').doc(user!.uid).collection('notes').doc(noteId).update({
                'text': textController.text,
                'timestamp': FieldValue.serverTimestamp(), // تحديث التوقيت
              });
              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  Future getImageFromCamera() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'camera')),
    );
  }

  Future getImageFromGallery() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'gallery')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome back, $userName'),
        backgroundColor: Colors.blueGrey,
      ),
      body: user == null
          ? Center(child: CircularProgressIndicator())
          : StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('users')
                  .doc(user!.uid)
                  .collection('notes')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: [
                    CalendarWidget(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: snapshot.data!.docs.map((doc) {
                              String noteId = doc.id;
                              String noteText = doc['text'];

                              return Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.primaries[snapshot.data!.docs.indexOf(doc) % Colors.primaries.length].shade300,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        noteText,
                                        style: TextStyle(color: Colors.black, fontSize: 16),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.edit, color: Colors.blue),
                                          onPressed: () => editNote(noteId, noteText),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete, color: Colors.red),
                                          onPressed: () => deleteNote(noteId),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "addNote",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNoteScreen()),
              );
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "camera",
            onPressed: getImageFromCamera,
            child: Icon(Icons.camera_alt),
            backgroundColor: Colors.blue,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "gallery",
            onPressed: getImageFromGallery,
            child: Icon(Icons.photo_library),
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
*/
/*
//كود في صفحة نوت وزر نوت وكام والتاريخ وز الاعدادات
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scholar_chat/pages/QuestionsScreen.dart';
import 'package:scholar_chat/widgets/CalendarWidget.dart';
import 'AddNoteScreen.dart';
import 'SettingsScreen.dart'; // استيراد صفحة الإعدادات

class Home_screen extends StatefulWidget {
  Home_screen({Key? key}) : super(key: key);

  static String id = 'Home_screen';

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? user;
  String userName = "User";

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    user = _auth.currentUser;
    if (user != null) {
      setState(() {
        userName = user!.email ?? "User";
      });
    }
  }

  void deleteNote(String noteId) {
    _firestore.collection('users').doc(user!.uid).collection('notes').doc(noteId).delete();
  }

  void editNote(String noteId, String currentText) {
    TextEditingController textController = TextEditingController(text: currentText);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Note"),
        content: TextField(
          controller: textController,
          decoration: InputDecoration(hintText: "Add New Note"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              _firestore.collection('users').doc(user!.uid).collection('notes').doc(noteId).update({
                'text': textController.text,
                'timestamp': FieldValue.serverTimestamp(),
              });
              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  Future getImageFromCamera() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'camera')),
    );
  }

  Future getImageFromGallery() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'gallery')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome back, $userName'),
        backgroundColor: Colors.blueGrey,
      ),
      body: user == null
          ? Center(child: CircularProgressIndicator())
          : StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('users')
                  .doc(user!.uid)
                  .collection('notes')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: [
                    CalendarWidget(),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: snapshot.data!.docs.map((doc) {
                              String noteId = doc.id;
                              String noteText = doc['text'];
                              Timestamp? timestamp = doc['timestamp'] as Timestamp?; // فحص null
                              DateTime dateTime = timestamp != null ? timestamp.toDate() : DateTime.now(); // استخدام قيمة افتراضية إذا كان timestamp غير موجود
                              String formattedDate = "${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}";

                              return Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.primaries[snapshot.data!.docs.indexOf(doc) % Colors.primaries.length].shade300,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      noteText,
                                      style: TextStyle(color: Colors.black, fontSize: 20),
                                    ),
                                    SizedBox(height: 1),
                                    Text(
                                      formattedDate,
                                      style: TextStyle(color: Colors.black54, fontSize: 14),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.edit, color: Colors.blue),
                                          onPressed: () => editNote(noteId, noteText),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete, color: Colors.red),
                                          onPressed: () => deleteNote(noteId),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "addNote",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNoteScreen()),
              );
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "camera",
            onPressed: getImageFromCamera,
            child: Icon(Icons.camera_alt),
            backgroundColor: Colors.blue,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "gallery",
            onPressed: getImageFromGallery,
            child: Icon(Icons.photo_library),
            backgroundColor: Colors.green,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "settings",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
            child: Icon(Icons.settings),
            backgroundColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scholar_chat/pages/DermatologyClinicMapScreen.dart';
import 'package:scholar_chat/pages/QuestionsScreen.dart';
import 'package:scholar_chat/widgets/CalendarWidget.dart';
import 'AddNoteScreen.dart';
import 'SettingsScreen.dart'; // استيراد صفحة الإعدادات




class Home_screen extends StatefulWidget {
  Home_screen({Key? key}) : super(key: key);

  static String id = 'Home_screen';

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? user;
  String userName = "User";

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    user = _auth.currentUser;
    if (user != null) {
      setState(() {
        userName = user!.email ?? "User";
      });
    }
  }

  void deleteNote(String noteId) {
    _firestore.collection('users').doc(user!.uid).collection('notes').doc(noteId).delete();
  }

  void editNote(String noteId, String currentText) {
    TextEditingController textController = TextEditingController(text: currentText);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Note"),
        content: TextField(
          controller: textController,
          decoration: InputDecoration(hintText: "Add New Note"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              _firestore.collection('users').doc(user!.uid).collection('notes').doc(noteId).update({
                'text': textController.text,
                'timestamp': FieldValue.serverTimestamp(),
              });
              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  Future getImageFromCamera() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'camera')),
    );
  }

  Future getImageFromGallery() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'gallery')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome back, $userName'),
        backgroundColor: Colors.blueGrey,
      ),
      body: user == null
          ? Center(child: CircularProgressIndicator())
          : StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('users')
                  .doc(user!.uid)
                  .collection('notes')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: [
                    CalendarWidget(),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: snapshot.data!.docs.map((doc) {
                              String noteId = doc.id;
                              String noteText = doc['text'];
                              Timestamp? timestamp = doc['timestamp'] as Timestamp?; // فحص null
                              DateTime dateTime = timestamp != null ? timestamp.toDate() : DateTime.now(); // استخدام قيمة افتراضية إذا كان timestamp غير موجود
                              String formattedDate = "${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}";

                              return Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.primaries[snapshot.data!.docs.indexOf(doc) % Colors.primaries.length].shade300,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      noteText,
                                      style: TextStyle(color: Colors.black, fontSize: 20),
                                    ),
                                    SizedBox(height: 1),
                                    Text(
                                      formattedDate,
                                      style: TextStyle(color: Colors.black54, fontSize: 14),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.edit, color: Colors.blue),
                                          onPressed: () => editNote(noteId, noteText),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete, color: Colors.red),
                                          onPressed: () => deleteNote(noteId),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "addNote",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNoteScreen()),
              );
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "camera",
            onPressed: getImageFromCamera,
            child: Icon(Icons.camera_alt),
            backgroundColor: Colors.blue,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "gallery",
            onPressed: getImageFromGallery,
            child: Icon(Icons.photo_library),
            backgroundColor: Colors.green,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "settings",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
            child: Icon(Icons.settings),
            backgroundColor: Colors.orange,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "map",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>DermatologyClinicMapScreen(Clinices: [],)),
              );
            },
            child: Icon(Icons.map),
            backgroundColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}
*/
/*
//الكود مفهوش مشكلة بس عابز اضيف ال category
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:scholar_chat/pages/DermatologyClinicMapScreen.dart';
import 'package:scholar_chat/pages/QuestionsScreen.dart';
import 'package:scholar_chat/widgets/CalendarWidget.dart';
import 'AddNoteScreen.dart';
import 'SettingsScreen.dart'; // استيراد صفحة الإعدادات

class Home_screen extends StatefulWidget {
  Home_screen({Key? key}) : super(key: key);

  static String id = 'Home_screen';

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? user;
  String userName = "User";
  int _page = 2; // الصفحة الافتراضية هي الزر الأوسط (Add Note)

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    user = _auth.currentUser;
    if (user != null) {
      setState(() {
        userName = user!.email ?? "User";
      });
    }
  }

  void deleteNote(String noteId) {
    _firestore.collection('users').doc(user!.uid).collection('notes').doc(noteId).delete();
  }

  void editNote(String noteId, String currentText) {
    TextEditingController textController = TextEditingController(text: currentText);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Note"),
        content: TextField(
          controller: textController,
          decoration: InputDecoration(hintText: "Add New Note"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              _firestore.collection('users').doc(user!.uid).collection('notes').doc(noteId).update({
                'text': textController.text,
                'timestamp': FieldValue.serverTimestamp(),
              });
              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  Future getImageFromCamera() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'camera')),
    );
  }

  Future getImageFromGallery() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'gallery')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome back, $userName'),
        backgroundColor: Colors.blueGrey,
      ),
      body: user == null
          ? Center(child: CircularProgressIndicator())
          : StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('users')
                  .doc(user!.uid)
                  .collection('notes')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: [
                    CalendarWidget(),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: snapshot.data!.docs.map((doc) {
                              String noteId = doc.id;
                              String noteText = doc['text'];
                              Timestamp? timestamp = doc['timestamp'] as Timestamp?; // فحص null
                              DateTime dateTime = timestamp != null ? timestamp.toDate() : DateTime.now(); // استخدام قيمة افتراضية إذا كان timestamp غير موجود
                              String formattedDate = "${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}";

                              return Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.primaries[snapshot.data!.docs.indexOf(doc) % Colors.primaries.length].shade300,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      noteText,
                                      style: TextStyle(color: Colors.black, fontSize: 20),
                                    ),
                                    SizedBox(height: 1),
                                    Text(
                                      formattedDate,
                                      style: TextStyle(color: Colors.black54, fontSize: 14),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.edit, color: Colors.blue),
                                          onPressed: () => editNote(noteId, noteText),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete, color: Colors.red),
                                          onPressed: () => deleteNote(noteId),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.camera_alt, size: 30), // زر الكاميرا على اليسار
          Icon(Icons.photo_library, size: 30), // زر المعرض على اليمين
          Icon(Icons.add, size: 30), // زر Add Note في المنتصف
          Icon(Icons.settings, size: 30), // زر الإعدادات
          Icon(Icons.map, size: 30), // زر الخريطة
        ],
        color: Colors.blueGrey,
        buttonBackgroundColor: Colors.blueGrey,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _page = index;
          });

          switch (index) {
            case 0:
              getImageFromCamera(); // زر الكاميرا
              break;
            case 1:
              getImageFromGallery(); // زر المعرض
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNoteScreen()),
              ); // زر Add Note
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              ); // زر الإعدادات
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DermatologyClinicMapScreen(Clinices: [],)),
              ); // زر الخريطة
              break;
          }
        },
      ),
    );
  }
}
*/


/*
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:scholar_chat/pages/DermatologyClinicMapScreen.dart';
import 'package:scholar_chat/pages/QuestionsScreen.dart';
import 'package:scholar_chat/widgets/CalendarWidget.dart';
import 'AddNoteScreen.dart';
import 'SettingsScreen.dart'; // استيراد صفحة الإعدادات

class Home_screen extends StatefulWidget {
  Home_screen({Key? key}) : super(key: key);

  static String id = 'Home_screen';

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? user;
  String userName = "User";
  int _page = 2; // الصفحة الافتراضية هي الزر الأوسط (Add Note)

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    user = _auth.currentUser;
    if (user != null) {
      setState(() {
        userName = user!.email ?? "User";
      });
    }
  }

  void deleteNote(String noteId) {
    _firestore.collection('users').doc(user!.uid).collection('notes').doc(noteId).delete();
  }

  void editNote(String noteId, String currentText) {
    TextEditingController textController = TextEditingController(text: currentText);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Note"),
        content: TextField(
          controller: textController,
          decoration: InputDecoration(hintText: "Add New Note"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              _firestore.collection('users').doc(user!.uid).collection('notes').doc(noteId).update({
                'text': textController.text,
                'timestamp': FieldValue.serverTimestamp(),
              });
              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  Future getImageFromCamera() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'camera')),
    );
  }

  Future getImageFromGallery() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'gallery')),
    );
  }

  // ويدجت مخصصة لعرض الفئات
  Widget _buildCategoryCard(String title, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome back, $userName'),
        backgroundColor: Colors.blueGrey,
      ),
      body: user == null
          ? Center(child: CircularProgressIndicator())
          : StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('users')
                  .doc(user!.uid)
                  .collection('notes')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: [
                    CalendarWidget(),
                    // إضافة الفئتين هنا
                    _buildCategoryCard(
                      "Documents",
                      Colors.blueAccent,
                      () {
                        // وظيفة عند النقر على فئة Documents
                        print("Documents category tapped");
                      },
                    ),
                    _buildCategoryCard(
                      "Life Quality",
                      Colors.greenAccent,
                      () {
                        // وظيفة عند النقر على فئة Life Quality
                        print("Life Quality category tapped");
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: snapshot.data!.docs.map((doc) {
                              String noteId = doc.id;
                              String noteText = doc['text'];
                              Timestamp? timestamp = doc['timestamp'] as Timestamp?; // فحص null
                              DateTime dateTime = timestamp != null ? timestamp.toDate() : DateTime.now(); // استخدام قيمة افتراضية إذا كان timestamp غير موجود
                              String formattedDate = "${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}";

                              return Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.primaries[snapshot.data!.docs.indexOf(doc) % Colors.primaries.length].shade300,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      noteText,
                                      style: TextStyle(color: Colors.black, fontSize: 20),
                                    ),
                                    SizedBox(height: 1),
                                    Text(
                                      formattedDate,
                                      style: TextStyle(color: Colors.black54, fontSize: 14),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.edit, color: Colors.blue),
                                          onPressed: () => editNote(noteId, noteText),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete, color: Colors.red),
                                          onPressed: () => deleteNote(noteId),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.camera_alt, size: 30), // زر الكاميرا على اليسار
          Icon(Icons.photo_library, size: 30), // زر المعرض على اليمين
          Icon(Icons.add, size: 30), // زر Add Note في المنتصف
          Icon(Icons.settings, size: 30), // زر الإعدادات
          Icon(Icons.map, size: 30), // زر الخريطة
        ],
        color: Colors.blueGrey,
        buttonBackgroundColor: Colors.blueGrey,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _page = index;
          });

          switch (index) {
            case 0:
              getImageFromCamera(); // زر الكاميرا
              break;
            case 1:
              getImageFromGallery(); // زر المعرض
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNoteScreen()),
              ); // زر Add Note
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              ); // زر الإعدادات
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DermatologyClinicMapScreen(Clinices: [],)),
              ); // زر الخريطة
              break;
          }
        },
      ),
    );
  }
}
*/
/*

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:scholar_chat/pages/DermatologyClinicMapScreen.dart';
import 'package:scholar_chat/pages/QuestionsScreen.dart';
import 'package:scholar_chat/pages/life_quality_screen.dart';
import 'package:scholar_chat/widgets/CalendarWidget.dart';
import 'AddNoteScreen.dart';
import 'SettingsScreen.dart'; // استيراد صفحة الإعدادات
import 'package:scholar_chat/pages/ReliableInformationScreen.dart'; // استيراد الصفحة الجديدة

class Home_screen extends StatefulWidget {
  Home_screen({Key? key}) : super(key: key);

  static String id = 'Home_screen';

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? user;
  String userName = "User";
  int _page = 2; // الصفحة الافتراضية هي الزر الأوسط (Add Note)

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    user = _auth.currentUser;
    if (user != null) {
      setState(() {
        userName = user!.email ?? "User";
      });
    }
  }

  void deleteNote(String noteId) {
    _firestore.collection('users').doc(user!.uid).collection('notes').doc(noteId).delete();
  }

  void editNote(String noteId, String currentText) {
    TextEditingController textController = TextEditingController(text: currentText);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Note"),
        content: TextField(
          controller: textController,
          decoration: InputDecoration(hintText: "Add New Note"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              _firestore.collection('users').doc(user!.uid).collection('notes').doc(noteId).update({
                'text': textController.text,
                'timestamp': FieldValue.serverTimestamp(),
              });
              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  Future getImageFromCamera() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'camera')),
    );
  }

  Future getImageFromGallery() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'gallery')),
    );
  }

  // ويدجت مخصصة لعرض الفئات
  Widget _buildCategoryCard(String title, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome back, $userName'),
        backgroundColor: Colors.blueGrey,
      ),
      body: user == null
          ? Center(child: CircularProgressIndicator())
          : StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('users')
                  .doc(user!.uid)
                  .collection('notes')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: [
                    CalendarWidget(),
                    // إضافة الفئتين هنا
                    _buildCategoryCard(
                      "Documents",
                     Colors.greenAccent,
                      () {
                        // التنقل إلى صفحة Reliable Information
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReliableInformationScreen(),
                          ),
                        );
                      },
                    ),
                    _buildCategoryCard(
                      "Life Quality",
                      Colors.blueAccent,
                      () {  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LifeQualityScreen(),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: snapshot.data!.docs.map((doc) {
                              String noteId = doc.id;
                              String noteText = doc['text'];
                              Timestamp? timestamp = doc['timestamp'] as Timestamp?; // فحص null
                              DateTime dateTime = timestamp != null ? timestamp.toDate() : DateTime.now(); // استخدام قيمة افتراضية إذا كان timestamp غير موجود
                              String formattedDate = "${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}";

                              return Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.primaries[snapshot.data!.docs.indexOf(doc) % Colors.primaries.length].shade300,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      noteText,
                                      style: TextStyle(color: Colors.black, fontSize: 20),
                                    ),
                                    SizedBox(height: 1),
                                    Text(
                                      formattedDate,
                                      style: TextStyle(color: Colors.black54, fontSize: 14),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.edit, color: Colors.blue),
                                          onPressed: () => editNote(noteId, noteText),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete, color: Colors.red),
                                          onPressed: () => deleteNote(noteId),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.camera_alt, size: 30), // زر الكاميرا على اليسار
          Icon(Icons.photo_library, size: 30), // زر المعرض على اليمين
          Icon(Icons.add, size: 30), // زر Add Note في المنتصف
          Icon(Icons.settings, size: 30), // زر الإعدادات
          Icon(Icons.map, size: 30), // زر الخريطة
        ],
        color: Colors.blueGrey,
        buttonBackgroundColor: Colors.blueGrey,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _page = index;
          });

          switch (index) {
            case 0:
              getImageFromCamera(); // زر الكاميرا
              break;
            case 1:
              getImageFromGallery(); // زر المعرض
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNoteScreen()),
              ); // زر Add Note
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              ); // زر الإعدادات
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DermatologyClinicMapScreen(Clinices: [],)),
              ); // زر الخريطة
              break;
          }
        },
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:scholar_chat/pages/DermatologyClinicMapScreen.dart';
import 'package:scholar_chat/pages/QuestionsScreen.dart';
import 'package:scholar_chat/pages/life_quality_screen.dart';
import 'package:scholar_chat/widgets/CalendarWidget.dart';
import 'AddNoteScreen.dart';
import 'SettingsScreen.dart';
import 'package:scholar_chat/pages/ReliableInformationScreen.dart';

class Home_screen extends StatefulWidget {
  Home_screen({Key? key}) : super(key: key);

  static String id = 'Home_screen';

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? user;
  String userName = "User";
  int _page = 2;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    user = _auth.currentUser;
    if (user != null) {
      setState(() {
        userName = user!.displayName ?? user!.email ?? "User";
      });
    }
  }

  void deleteNote(String noteId) {
    _firestore.collection('users').doc(user!.uid).collection('notes').doc(noteId).delete();
  }

  void editNote(String noteId, String currentText) {
    TextEditingController textController = TextEditingController(text: currentText);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Note"),
        content: TextField(
          controller: textController,
          decoration: InputDecoration(hintText: "Edit your note"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              _firestore.collection('users').doc(user!.uid).collection('notes').doc(noteId).update({
                'text': textController.text,
                'timestamp': FieldValue.serverTimestamp(),
              });
              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  Future getImageFromCamera() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'camera')),
    );
  }

  Future getImageFromGallery() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsScreen(action: 'gallery')),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon, Color color, VoidCallback onTap) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Icon(icon, size: 30, color: Colors.white),
              SizedBox(width: 15),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $userName'),
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: user == null
          ? Center(child: CircularProgressIndicator())
          : StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('users')
                  .doc(user!.uid)
                  .collection('notes')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      CalendarWidget(),
                      _buildCategoryCard(
                        "Medical Documents",
                        Icons.medical_services,
                        Colors.greenAccent,
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReliableInformationScreen(),
                            ),
                          );
                        },
                      ),
                      _buildCategoryCard(
                        "Life Quality Assessment",
                        Icons.health_and_safety,
                        Colors.blueAccent,
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LifeQualityScreen(),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: snapshot.data!.docs.isEmpty
                              ? Center(
                                  child: Text(
                                    "No notes yet",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                              : SingleChildScrollView(
                                  child: Column(
                                    children: snapshot.data!.docs.map((doc) {
                                      String noteId = doc.id;
                                      String noteText = doc['text'];
                                      Timestamp? timestamp = doc['timestamp'];
                                      DateTime dateTime = timestamp?.toDate() ?? DateTime.now();
                                      String formattedDate = "${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}";

                                      return Container(
                                        width: double.infinity,
                                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 3,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              noteText,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  formattedDate,
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    IconButton(
                                                      icon: Icon(Icons.edit, size: 18, color: Colors.blue),
                                                      onPressed: () => editNote(noteId, noteText),
                                                    ),
                                                    IconButton(
                                                      icon: Icon(Icons.delete, size: 18, color: Colors.red),
                                                      onPressed: () => deleteNote(noteId),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        height: 60.0,
        items: <Widget>[
          Tooltip(
            message: 'Camera',
            child: Icon(Icons.camera_alt, size: 30),
          ),
          Tooltip(
            message: 'Gallery',
            child: Icon(Icons.photo_library, size: 30),
          ),
          Tooltip(
            message: 'Add Note',
            child: Icon(Icons.add, size: 30),
          ),
          Tooltip(
            message: 'Settings',
            child: Icon(Icons.settings, size: 30),
          ),
          Tooltip(
            message: 'Clinics Map',
            child: Icon(Icons.map, size: 30),
          ),
        ],
        color: Colors.blueGrey,
        buttonBackgroundColor: Colors.blueGrey.shade800,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _page = index;
          });

          switch (index) {
            case 0:
              getImageFromCamera();
              break;
            case 1:
              getImageFromGallery();
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNoteScreen()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DermatologyClinicMapScreen(Clinices: [])),
              );
              break;
          }
        },
      ),
    );
  }
}