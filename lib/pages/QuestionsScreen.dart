import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class QuestionsScreen extends StatefulWidget {
  final String action; // لتحديد إذا كان المستخدم يريد فتح الكاميرا أو المعرض
  const QuestionsScreen({Key? key, required this.action}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  String? _skinColor;
  String? _spotColor;
  String? _appearanceAfterInfection;
  String? _severeItching;
  String? _painInSpot;
  String? _bumpInSpot;
  String? _spotGrowingQuickly;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    XFile? image;
    if (widget.action == 'camera') {
      image = await _picker.pickImage(source: ImageSource.camera);
    } else if (widget.action == 'gallery') {
      image = await _picker.pickImage(source: ImageSource.gallery);
    }

    if (image != null) {
      print("Image Path: ${image.path}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Answer Questions'),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // السؤال 1
            Text('1. Color of your skin', style: TextStyle(fontSize: 16)),
            ListTile(
              title: Text('1. White to Pink'),
              leading: Radio<String>(
                value: '1-white to pink',
                groupValue: _skinColor,
                onChanged: (String? value) {
                  setState(() {
                    _skinColor = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('2. Brown'),
              leading: Radio<String>(
                value: '2-brown',
                groupValue: _skinColor,
                onChanged: (String? value) {
                  setState(() {
                    _skinColor = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('3. Black'),
              leading: Radio<String>(
                value: '3-black',
                groupValue: _skinColor,
                onChanged: (String? value) {
                  setState(() {
                    _skinColor = value;
                  });
                },
              ),
            ),

            // السؤال 2
            Text('2. Color of the spot', style: TextStyle(fontSize: 16)),
            ListTile(
              title: Text('1. Brown'),
              leading: Radio<String>(
                value: '1-brown',
                groupValue: _spotColor,
                onChanged: (String? value) {
                  setState(() {
                    _spotColor = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('2. Red'),
              leading: Radio<String>(
                value: '2-red',
                groupValue: _spotColor,
                onChanged: (String? value) {
                  setState(() {
                    _spotColor = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('3. Black'),
              leading: Radio<String>(
                value: '3-black',
                groupValue: _spotColor,
                onChanged: (String? value) {
                  setState(() {
                    _spotColor = value;
                  });
                },
              ),
            ),

            // السؤال 3
            Text('3. Did the spot appear after infection?', style: TextStyle(fontSize: 16)),
            ListTile(
              title: Text('1. Yes'),
              leading: Radio<String>(
                value: '1-Yes',
                groupValue: _appearanceAfterInfection,
                onChanged: (String? value) {
                  setState(() {
                    _appearanceAfterInfection = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('2. No'),
              leading: Radio<String>(
                value: '2-No',
                groupValue: _appearanceAfterInfection,
                onChanged: (String? value) {
                  setState(() {
                    _appearanceAfterInfection = value;
                  });
                },
              ),
            ),

            // السؤال 4
            Text('4. Is the spot accompanied by severe itching?', style: TextStyle(fontSize: 16)),
            ListTile(
              title: Text('1. Yes'),
              leading: Radio<String>(
                value: '1-Yes',
                groupValue: _severeItching,
                onChanged: (String? value) {
                  setState(() {
                    _severeItching = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('2. No'),
              leading: Radio<String>(
                value: '2-No',
                groupValue: _severeItching,
                onChanged: (String? value) {
                  setState(() {
                    _severeItching = value;
                  });
                },
              ),
            ),

            // السؤال 5
            Text('5. Is there pain in the spot?', style: TextStyle(fontSize: 16)),
            ListTile(
              title: Text('1. Yes'),
              leading: Radio<String>(
                value: '1-Yes',
                groupValue: _painInSpot,
                onChanged: (String? value) {
                  setState(() {
                    _painInSpot = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('2. No'),
              leading: Radio<String>(
                value: '2-No',
                groupValue: _painInSpot,
                onChanged: (String? value) {
                  setState(() {
                    _painInSpot = value;
                  });
                },
              ),
            ),

            // السؤال 6
            Text('6. Is there a bump in the spot?', style: TextStyle(fontSize: 16)),
            ListTile(
              title: Text('1. Yes'),
              leading: Radio<String>(
                value: '1-Yes',
                groupValue: _bumpInSpot,
                onChanged: (String? value) {
                  setState(() {
                    _bumpInSpot = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('2. No'),
              leading: Radio<String>(
                value: '2-No',
                groupValue: _bumpInSpot,
                onChanged: (String? value) {
                  setState(() {
                    _bumpInSpot = value;
                  });
                },
              ),
            ),

            // السؤال 7
            Text('7. Is the spot getting bigger quickly?', style: TextStyle(fontSize: 16)),
            ListTile(
              title: Text('1. Yes'),
              leading: Radio<String>(
                value: '1-Yes',
                groupValue: _spotGrowingQuickly,
                onChanged: (String? value) {
                  setState(() {
                    _spotGrowingQuickly = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('2. No'),
              leading: Radio<String>(
                value: '2-No',
                groupValue: _spotGrowingQuickly,
                onChanged: (String? value) {
                  setState(() {
                    _spotGrowingQuickly = value;
                  });
                },
              ),
            ),

            // زر الإرسال
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () async {
                  if (_skinColor != null &&
                      _spotColor != null &&
                      _appearanceAfterInfection != null &&
                      _severeItching != null &&
                      _painInSpot != null &&
                      _bumpInSpot != null &&
                      _spotGrowingQuickly != null) {
                    // افتح الكاميرا أو المعرض بعد الإجابة على الأسئلة
                    await _pickImage();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please answer all questions')),
                    );
                  }
                },
                child: Text('Submit Answers'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
    