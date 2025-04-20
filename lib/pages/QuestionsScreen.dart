/*
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
    */




    import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scholar_chat/pages/(medical_report_screen.dart';

class QuestionsScreen extends StatefulWidget {
  final String action;
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
  XFile? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    XFile? image;
    try {
      if (widget.action == 'camera') {
        image = await _picker.pickImage(source: ImageSource.camera);
      } else if (widget.action == 'gallery') {
        image = await _picker.pickImage(source: ImageSource.gallery);
      }

      if (image != null) {
        setState(() {
          _selectedImage = image;
        });
        // بعد اختيار الصورة، انتقل إلى صفحة النتائج
        _navigateToResultScreen();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: $e')),
      );
    }
  }

  void _navigateToResultScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          imagePath: _selectedImage?.path,
          onRetry: () {
            Navigator.pop(context);
            _pickImage();
          },
        ),
      ),
    );
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
            // ... (كل الأسئلة كما هي في الكود الأصلي)
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


class ResultScreen extends StatelessWidget {
  final String? imagePath;
  final VoidCallback onRetry;

  const ResultScreen({
    Key? key,
    required this.imagePath,
    required this.onRetry,
  }) : super(key: key);
void _generateReport(BuildContext context) {
  // بيانات التشخيص (ستأتي من API أو نموذج ML في التطبيق الحقيقي)
  final diagnosisResults = {
    'psoriatic nail': 0.687,
    'psoriatic arthritis': 0.210,
    'not define': 0.134,
    'UPNormal': 0.897,
    'normal': 0.109,
  };

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MedicalReportScreen(
        diagnosisResults: diagnosisResults,
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Image of Your Case'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              'Review Your Case Image',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[800],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Please check the image quality before proceeding',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            
            // Image Container with Shadow and Border
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
                border: Border.all(
                  color: Colors.blueGrey.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: imagePath != null
                    ? Image.file(
                        File(imagePath!),
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => 
                          const Center(child: Icon(Icons.error, size: 50, color: Colors.red)),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                          const SizedBox(height: 10),
                          Text(
                            'No Image Available',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 40),
            
            // Buttons Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  // Retry Button
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: onRetry,
                      icon: const Icon(Icons.refresh, size: 20),
                      label: const Text('RETRY', style: TextStyle(fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey[100],
                        foregroundColor: Colors.blueGrey[800],
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 2,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  
                  // Take Report Button
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _generateReport(context),
                      icon: const Icon(Icons.assignment, size: 20),
                      label: const Text('TAKE REPORT', style: TextStyle(fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            // Help Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'If the image is not clear, please retry with better lighting and focus.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
//لما حسام يبعت end point
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scholar_chat/pages/(medical_report_screen.dart';


class QuestionsScreen extends StatefulWidget {
  final String action;
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
  XFile? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  bool _isSubmitting = false;

  Future<void> _pickImage() async {
    XFile? image;
    try {
      if (widget.action == 'camera') {
        image = await _picker.pickImage(source: ImageSource.camera);
      } else if (widget.action == 'gallery') {
        image = await _picker.pickImage(source: ImageSource.gallery);
      }

      if (image != null) {
        setState(() => _selectedImage = image);
        _navigateToReportScreen();
      }
    } catch (e) {
      setState(() => _isSubmitting = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: $e')),
      );
    }
  }

  Map<String, String?> getAnswers() {
    return {
      'skinColor': _skinColor,
      'spotColor': _spotColor,
      'appearanceAfterInfection': _appearanceAfterInfection,
      'severeItching': _severeItching,
      'painInSpot': _painInSpot,
      'bumpInSpot': _bumpInSpot,
      'spotGrowingQuickly': _spotGrowingQuickly,
    };
  }

  bool areAllQuestionsAnswered() {
    return _skinColor != null &&
        _spotColor != null &&
        _appearanceAfterInfection != null &&
        _severeItching != null &&
        _painInSpot != null &&
        _bumpInSpot != null &&
        _spotGrowingQuickly != null;
  }

  void _navigateToReportScreen() {
    if (_selectedImage == null) return;
    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MedicalReportScreen(
          imagePath: _selectedImage!.path,
          answers: getAnswers(),
        ),
      ),
    );
    setState(() => _isSubmitting = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skin Condition Questionnaire'),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Please answer all questions to get an accurate diagnosis',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            
            // Question 1
            const Text('1. Color of your skin', style: TextStyle(fontSize: 16)),
            ListTile(
              title: const Text('1. White to Pink'),
              leading: Radio<String>(
                value: '1-white to pink',
                groupValue: _skinColor,
                onChanged: (String? value) {
                  setState(() => _skinColor = value);
                },
              ),
            ),
            // ... (بقية الأسئلة بنفس النمط)
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

            
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _isSubmitting ? null : () async {
                if (areAllQuestionsAnswered()) {
                  setState(() => _isSubmitting = true);
                  await _pickImage();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please answer all questions')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.blueGrey[800],
              ),
              child: _isSubmitting
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Submit & Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}
*/