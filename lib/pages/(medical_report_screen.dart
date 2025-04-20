/*
import 'package:flutter/material.dart';

class MedicalReportScreen extends StatelessWidget {
  final Map<String, double> diagnosisResults;

  const MedicalReportScreen({
    Key? key,
    required this.diagnosisResults,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Report'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Doctor.png'), // <-- هنا ضع صورتك الخلفية
            fit: BoxFit.cover,
            opacity: 0.1,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Diagnosis Results',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              
              // Diagnosis Cards
              for (var entry in diagnosisResults.entries)
                _buildDiagnosisCard(
                  condition: entry.key,
                  score: entry.value,
                ),
              
              const SizedBox(height: 40),
              
              // Footer
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dermatology Clinic',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      child: const Text('Home'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.blue[800],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDiagnosisCard({required String condition, required double score}) {
    Color getScoreColor(double score) {
      if (score > 0.7) return Colors.red[800]!;
      if (score > 0.4) return Colors.orange[800]!;
      return Colors.green[800]!;
    }

    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    condition.split(' ').map((word) => 
                      word[0].toUpperCase() + word.substring(1)
                    ).join(' '),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  LinearProgressIndicator(
                    value: score,
                    backgroundColor: Colors.grey[200],
                    color: getScoreColor(score),
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15),
            Text(
              '${(score * 100).toStringAsFixed(1)}%',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: getScoreColor(score),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/






//ده تمام بس من مفهوش كود التعامل مع end point

import 'package:flutter/material.dart';

class MedicalReportScreen extends StatelessWidget {
  final Map<String, double> diagnosisResults;

  const MedicalReportScreen({
    Key? key,
    required this.diagnosisResults,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Report'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Doctor.png'),
            fit: BoxFit.cover,
            opacity: 0.05, // تقليل الشفافية لجعل الصورة أقل وضوحاً
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with Icon
                    Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.medical_services,
                            size: 50,
                            color: Colors.blueGrey[800],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Diagnosis Results',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Based on your uploaded image',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    
                    // Diagnosis Cards
                    for (var entry in diagnosisResults.entries)
                      _buildDiagnosisCard(
                        condition: entry.key,
                        score: entry.value,
                      ),
                    
                    const SizedBox(height: 30),
                    
                    // Summary Card
                    Card(
                      elevation: 3,
                      margin: const EdgeInsets.only(bottom: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Summary',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              _getSummaryText(diagnosisResults),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[700],
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Centered Home Button
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SizedBox(
                width: 200,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  icon: const Icon(Icons.home, size: 20),
                  label: const Text('Home', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[800],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiagnosisCard({required String condition, required double score}) {
    Color getScoreColor(double score) {
      if (score > 0.7) return Colors.red[800]!;
      if (score > 0.4) return Colors.orange[800]!;
      return Colors.green[800]!;
    }

    String getRiskLevel(double score) {
      if (score > 0.7) return 'High Risk';
      if (score > 0.4) return 'Medium Risk';
      return 'Low Risk';
    }

    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    condition.split(' ').map((word) => 
                      word[0].toUpperCase() + word.substring(1)
                    ).join(' '),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  '${(score * 100).toStringAsFixed(1)}%',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: getScoreColor(score),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: score,
              backgroundColor: Colors.grey[200],
              color: getScoreColor(score),
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 5),
            Text(
              getRiskLevel(score),
              style: TextStyle(
                fontSize: 14,
                color: getScoreColor(score),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getSummaryText(Map<String, double> results) {
    final highestRisk = results.entries.reduce((a, b) => a.value > b.value ? a : b);
    
    if (highestRisk.value > 0.7) {
      return 'The analysis shows a high probability of ${highestRisk.key}. We recommend consulting a dermatologist as soon as possible for further evaluation and treatment options.';
    } else if (highestRisk.value > 0.4) {
      return 'There is a moderate indication of ${highestRisk.key}. It would be advisable to monitor the condition and schedule a doctor visit if symptoms persist or worsen.';
    } else {
      return 'The results indicate a low probability of significant skin conditions. However, if you notice any changes or have concerns, please consult a healthcare professional.';
    }
  }
}



/*
//لما حسام يبعت end point

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MedicalReportScreen extends StatefulWidget {
  final String imagePath;
  final Map<String, String?> answers;

  const MedicalReportScreen({
    Key? key,
    required this.imagePath,
    required this.answers,
  }) : super(key: key);

  @override
  _MedicalReportScreenState createState() => _MedicalReportScreenState();
}

class _MedicalReportScreenState extends State<MedicalReportScreen> {
  late Future<Map<String, dynamic>> _diagnosisData;
  bool _isLoading = true;
  Map<String, double> _diagnosisResults = {};

  @override
  void initState() {
    super.initState();
    _diagnosisData = _fetchDiagnosisData();
  }

  Future<Map<String, dynamic>> _fetchDiagnosisData() async {
    try {
      // 1. إنشاء طلب متعدد الأجزاء
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://your-api-endpoint.com/diagnose'),
      );
      
      // 2. إضافة الصورة
      request.files.add(
        await http.MultipartFile.fromPath('image', widget.imagePath),
      );

      // 3. إضافة إجابات الاستبيان
      request.fields['answers'] = jsonEncode(widget.answers);

      // 4. إرسال الطلب
      var response = await request.send();

      // 5. معالجة الاستجابة
      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> data = json.decode(responseBody);
        
        setState(() {
          _isLoading = false;
          _diagnosisResults = Map<String, double>.from(data['diagnosis']);
        });
        
        return data;
      } else {
        throw Exception('Failed to load diagnosis data');
      }
    } catch (e) {
      setState(() => _isLoading = false);
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Report'),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _diagnosisData,
        builder: (context, snapshot) {
          if (_isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 50, color: Colors.red),
                  const SizedBox(height: 20),
                  Text(
                    'Error: ${snapshot.error}',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isLoading = true;
                        _diagnosisData = _fetchDiagnosisData();
                      });
                    },
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Image Preview
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: FileImage(File(widget.imagePath)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                
                // Diagnosis Results
                const Text(
                  'Diagnosis Results',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                
                ..._getSortedResults().map((entry) => 
                  _buildDiagnosisCard(entry.key, entry.value),
                ),
                
                // Recommended Actions
                const SizedBox(height: 30),
                const Text(
                  'Recommended Actions',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ..._getRecommendedActions(),
              ],
            ),
          );
        },
      ),
    );
  }

  List<MapEntry<String, double>> _getSortedResults() {
    var entries = _diagnosisResults.entries.toList();
    entries.sort((a, b) => b.value.compareTo(a.value));
    return entries;
  }

  Widget _buildDiagnosisCard(String condition, double score) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    _formatConditionName(condition),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '${(score * 100).toStringAsFixed(1)}%',
                  style: TextStyle(
                    fontSize: 18,
                    color: _getScoreColor(score),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: score,
              backgroundColor: Colors.grey[200],
              color: _getScoreColor(score),
              minHeight: 8,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getRecommendedActions() {
    if (_diagnosisResults.isEmpty) return [const Text('No recommendations available')];
    
    final topCondition = _diagnosisResults.entries.first;
    List<String> actions = [];

    if (topCondition.value > 0.7) {
      actions.add('Consult a dermatologist immediately');
      actions.add('Avoid scratching the affected area');
    } else if (topCondition.value > 0.4) {
      actions.add('Schedule a dermatologist appointment');
      actions.add('Monitor for any changes');
    } else {
      actions.add('Monitor the area for changes');
      actions.add('Maintain good skin hygiene');
    }

    return actions.map((action) => 
      ListTile(
        leading: const Icon(Icons.circle, size: 8),
        title: Text(action),
      ),
    ).toList();
  }

  Color _getScoreColor(double score) {
    if (score > 0.7) return Colors.red[800]!;
    if (score > 0.4) return Colors.orange[800]!;
    return Colors.green[800]!;
  }

  String _formatConditionName(String condition) {
    switch (condition) {
      case 'dyshidrosis': return 'Dyshidrosis';
      case 'monkey pox': return 'Monkey Pox';
      case 'atopic': return 'Atopic Dermatitis';
      case 'contact-dermatitis': return 'Contact Dermatitis';
      case 'hand eczema': return 'Hand Eczema';
      case 'nummular': return 'Nummular Dermatitis';
      case 'seborrheic-dermatitis': return 'Seborrheic Dermatitis';
      case 'stasis-dermatitis': return 'Stasis Dermatitis';
      default: return condition;
    }
  }
}
*/