/*import 'package:flutter/material.dart';

class LifeQualityScreen extends StatefulWidget {
  @override
  _LifeQualityScreenState createState() => _LifeQualityScreenState();
}

class _LifeQualityScreenState extends State<LifeQualityScreen> {
  int? _selectedValue1; // إجابة السؤال الأول
  int? _selectedValue2; // إجابة السؤال الثاني

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Life Quality Assessment"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // السؤال الأول
            Text(
              "Over the last week, how much has your skin created problems with your partner or close ones?",
              style: TextStyle(fontSize: 18),
            ),
            RadioListTile(
              title: Text("Very much"),
              value: 3,
              groupValue: _selectedValue1,
              onChanged: (value) => setState(() => _selectedValue1 = value as int?),
            ),
            RadioListTile(
              title: Text("A lot"),
              value: 2,
              groupValue: _selectedValue1,
              onChanged: (value) => setState(() => _selectedValue1 = value as int?),
            ),
            RadioListTile(
              title: Text("A little"),
              value: 1,
              groupValue: _selectedValue1,
              onChanged: (value) => setState(() => _selectedValue1 = value as int?),
            ),
            RadioListTile(
              title: Text("Not at all"),
              value: 0,
              groupValue: _selectedValue1,
              onChanged: (value) => setState(() => _selectedValue1 = value as int?),
            ),

            SizedBox(height: 30),

            // السؤال الثاني
            Text(
              "Over the last week, how much has your skin caused sexual difficulties?",
              style: TextStyle(fontSize: 18),
            ),
            RadioListTile(
              title: Text("Very much"),
              value: 3,
              groupValue: _selectedValue2,
              onChanged: (value) => setState(() => _selectedValue2 = value as int?),
            ),
            RadioListTile(
              title: Text("A lot"),
              value: 2,
              groupValue: _selectedValue2,
              onChanged: (value) => setState(() => _selectedValue2 = value as int?),
            ),
            RadioListTile(
              title: Text("A little"),
              value: 1,
              groupValue: _selectedValue2,
              onChanged: (value) => setState(() => _selectedValue2 = value as int?),
            ),
            RadioListTile(
              title: Text("Not at all"),
              value: 0,
              groupValue: _selectedValue2,
              onChanged: (value) => setState(() => _selectedValue2 = value as int?),
            ),

            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                if (_selectedValue1 != null && _selectedValue2 != null) {
                  int totalScore = _selectedValue1! + _selectedValue2!;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(score: totalScore),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please answer all questions")),
                  );
                }
              },
              child: Text("Calculate Score", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;

  ResultScreen({required this.score});

  String _getInterpretation() {
    if (score >= 5) return "Extremely large effect: Daily life is severely affected.";
    else if (score >= 3) return "Moderate effect: Noticeable impact on activities.";
    else return "Mild effect: Minimal interference.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Score")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("YOUR SCORE", style: TextStyle(fontSize: 24)),
              SizedBox(height: 10),
              Text("$score", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              LinearProgressIndicator(
                value: score / 6,
                minHeight: 15,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              SizedBox(height: 30),
              Text(
                _getInterpretation(),
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';

class LifeQualityScreen extends StatefulWidget {
  @override
  _LifeQualityScreenState createState() => _LifeQualityScreenState();
}

class _LifeQualityScreenState extends State<LifeQualityScreen> {
  int? _selectedValue1;
  int? _selectedValue2;
  bool? _workStudyPrevented;
  int? _treatmentProblem;
  int? _clothesInfluence;
  int? _shoppingInterference;
  int? _sportDifficulty;
  int? _itchiness;
  int? _socialImpact;
  int? _embarrassment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تقييم جودة الحياة"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildQuestion(
              "خلال الأسبوع الماضي، كم سببت لك الإكزيما مشاكل مع شريكك أو أهلك؟",
              _selectedValue1,
              (value) => setState(() => _selectedValue1 = value),
            ),

            _buildQuestion(
              "خلال الأسبوع الماضي، كم سببت لك الإكزيما صعوبات جنسية؟",
              _selectedValue2,
              (value) => setState(() => _selectedValue2 = value),
            ),

            _buildYesNoQuestion(
              "خلال الأسبوع الماضي، هل منعتك الإكزيما من العمل أو الدراسة؟",
              _workStudyPrevented,
              (value) => setState(() => _workStudyPrevented = value),
            ),

            _buildQuestion(
              "خلال الأسبوع الماضي، كم كانت مشكلة علاجات الإكزيما؟",
              _treatmentProblem,
              (value) => setState(() => _treatmentProblem = value),
            ),

            _buildQuestion(
              "خلال الأسبوع الماضي، كم أثرت الإكزيما على ملابسك؟",
              _clothesInfluence,
              (value) => setState(() => _clothesInfluence = value),
            ),

            _buildQuestion(
              "خلال الأسبوع الماضي، كم أثرت الإكزيما على تسوقك أو أعمال المنزل؟",
              _shoppingInterference,
              (value) => setState(() => _shoppingInterference = value),
            ),

            _buildQuestion(
              "خلال الأسبوع الماضي، كم جعلت الإكزيما ممارسة الرياضة صعبة؟",
              _sportDifficulty,
              (value) => setState(() => _sportDifficulty = value),
            ),

            _buildQuestion(
              "خلال الأسبوع الماضي، كم كانت الإكزيما مثيرة للحكة/الألم؟",
              _itchiness,
              (value) => setState(() => _itchiness = value),
            ),

            _buildQuestion(
              "خلال الأسبوع الماضي، كم أثرت الإكزيما على أنشطتك الاجتماعية؟",
              _socialImpact,
              (value) => setState(() => _socialImpact = value),
            ),

            _buildQuestion(
              "خلال الأسبوع الماضي، كم شعرت بالإحراج بسبب الإكزيما؟",
              _embarrassment,
              (value) => setState(() => _embarrassment = value),
            ),

            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _calculateScore,
              child: const Text("احسب النتيجة", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestion(String question, int? selectedValue, ValueChanged<int?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(question, style: const TextStyle(fontSize: 18)),
        RadioListTile<int>(
          title: const Text("كثير جداً"),
          value: 3,
          groupValue: selectedValue,
          onChanged: onChanged,
        ),
        RadioListTile<int>(
          title: const Text("كثير"),
          value: 2,
          groupValue: selectedValue,
          onChanged: onChanged,
        ),
        RadioListTile<int>(
          title: const Text("قليلاً"),
          value: 1,
          groupValue: selectedValue,
          onChanged: onChanged,
        ),
        RadioListTile<int>(
          title: const Text("لا شيء"),
          value: 0,
          groupValue: selectedValue,
          onChanged: onChanged,
        ),
        RadioListTile<int?>(
          title: const Text("غير ذي صلة"),
          value: -1,
          groupValue: selectedValue,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildYesNoQuestion(String question, bool? selectedValue, ValueChanged<bool?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(question, style: const TextStyle(fontSize: 18)),
        RadioListTile<bool>(
          title: const Text("نعم"),
          value: true,
          groupValue: selectedValue,
          onChanged: onChanged,
        ),
        RadioListTile<bool>(
          title: const Text("لا"),
          value: false,
          groupValue: selectedValue,
          onChanged: onChanged,
        ),
        RadioListTile<bool?>(
          title: const Text("غير ذي صلة"),
          value: null,
          groupValue: selectedValue,
          onChanged: onChanged,
        ),
      ],
    );
  }

  void _calculateScore() {
    if (_selectedValue1 == null || _selectedValue2 == null || _workStudyPrevented == null ||
        _treatmentProblem == null || _clothesInfluence == null || _shoppingInterference == null ||
        _sportDifficulty == null || _itchiness == null || _socialImpact == null || _embarrassment == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("الرجاء الإجابة على جميع الأسئلة")),
      );
      return;
    }

    int totalScore = (_selectedValue1 ?? 0) +
        (_selectedValue2 ?? 0) +
        (_workStudyPrevented! ? 3 : 0) +
        (_treatmentProblem ?? 0) +
        (_clothesInfluence ?? 0) +
        (_shoppingInterference ?? 0) +
        (_sportDifficulty ?? 0) +
        (_itchiness ?? 0) +
        (_socialImpact ?? 0) +
        (_embarrassment ?? 0);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(score: totalScore, maxScore: 30),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  final int maxScore;

  const ResultScreen({required this.score, this.maxScore = 30, Key? key}) : super(key: key);

  String _getInterpretation() {
    double percentage = score / maxScore;
    if (percentage >= 0.75) return "تأثير شديد جداً: الحياة اليومية متأثرة بشدة";
    else if (percentage >= 0.5) return "تأثير كبير: صعوبات واضحة في الأنشطة";
    else if (percentage >= 0.25) return "تأثير متوسط: بعض الصعوبات";
    else return "تأثير بسيط: تأثير محدود";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("نتيجة التقييم")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("درجتك", style: TextStyle(fontSize: 24)),
              const SizedBox(height: 10),
              Text("$score/$maxScore", 
                  style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              LinearProgressIndicator(
                value: score / maxScore,
                minHeight: 20,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              const SizedBox(height: 30),
              Text(
                _getInterpretation(),
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("حسناً"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/

/*
// الكود ده تمام بس عايز اعمل كل سولب ف صفحة 
import 'package:flutter/material.dart';

class LifeQualityScreen extends StatefulWidget {
  @override
  _LifeQualityScreenState createState() => _LifeQualityScreenState();
}

class _LifeQualityScreenState extends State<LifeQualityScreen> {
  int? _selectedValue1;
  int? _selectedValue2;
  bool? _workStudyPrevented;
  int? _treatmentProblem;
  int? _clothesInfluence;
  int? _shoppingInterference;
  int? _sportDifficulty;
  int? _itchiness;
  int? _socialImpact;
  int? _embarrassment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quality of Life Assessment",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader("Personal Relationships"),
            _buildQuestion(
              "Over the past week, how much has your eczema caused problems with your partner or family?",
              _selectedValue1,
              (value) => setState(() => _selectedValue1 = value),
            ),
            _buildQuestion(
              "Over the past week, how much has your eczema caused sexual difficulties?",
              _selectedValue2,
              (value) => setState(() => _selectedValue2 = value),
            ),

            _buildSectionHeader("Daily Activities"),
            _buildYesNoQuestion(
              "Over the past week, has your eczema prevented you from working or studying?",
              _workStudyPrevented,
              (value) => setState(() => _workStudyPrevented = value),
            ),
            _buildQuestion(
              "Over the past week, how much has eczema treatment been a problem (e.g., making your home messy or taking up time)?",
              _treatmentProblem,
              (value) => setState(() => _treatmentProblem = value),
            ),
            _buildQuestion(
              "Over the past week, how much has eczema influenced your choice of clothing?",
              _clothesInfluence,
              (value) => setState(() => _clothesInfluence = value),
            ),
            _buildQuestion(
              "Over the past week, how much has eczema interfered with shopping or household chores?",
              _shoppingInterference,
              (value) => setState(() => _shoppingInterference = value),
            ),
            _buildQuestion(
              "Over the past week, how much has eczema made it difficult to do sports?",
              _sportDifficulty,
              (value) => setState(() => _sportDifficulty = value),
            ),

            _buildSectionHeader("Physical Symptoms"),
            _buildQuestion(
              "Over the past week, how itchy, sore, painful, or stinging has your skin been?",
              _itchiness,
              (value) => setState(() => _itchiness = value),
            ),

            _buildSectionHeader("Social Impact"),
            _buildQuestion(
              "Over the past week, how much has eczema affected your social or leisure activities?",
              _socialImpact,
              (value) => setState(() => _socialImpact = value),
            ),
            _buildQuestion(
              "Over the past week, how embarrassed or self-conscious have you been because of your skin?",
              _embarrassment,
              (value) => setState(() => _embarrassment = value),
            ),

            const SizedBox(height: 32),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _calculateScore,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("CALCULATE SCORE",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.blueGrey),
      ),
    );
  }

  Widget _buildQuestion(String question, int? selectedValue, ValueChanged<int?> onChanged) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            ..._buildOptions([
              "Very much",
              "A lot",
              "A little",
              "Not at all",
              "Not relevant"
            ], [3, 2, 1, 0, -1], selectedValue, onChanged),
          ],
        ),
      ),
    );
  }

  Widget _buildYesNoQuestion(String question, bool? selectedValue, ValueChanged<bool?> onChanged) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            ..._buildOptions<bool?>(
              ["Yes", "No", "Not relevant"],
              [true, false, null],
              selectedValue,
              onChanged,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildOptions<T>(
    List<String> labels,
    List<T> values,
    T? groupValue,
    ValueChanged<T?> onChanged,
  ) {
    return List<Widget>.generate(labels.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: RadioListTile<T>(
          title: Text(labels[index]),
          value: values[index],
          groupValue: groupValue,
          onChanged: onChanged,
          contentPadding: EdgeInsets.zero,
          dense: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)),
          tileColor: Colors.grey[50],
        ),
      );
    });
  }

  void _calculateScore() {
    if (_selectedValue1 == null || _selectedValue2 == null || _workStudyPrevented == null ||
        _treatmentProblem == null || _clothesInfluence == null || _shoppingInterference == null ||
        _sportDifficulty == null || _itchiness == null || _socialImpact == null || _embarrassment == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please answer all questions"),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    int totalScore = (_selectedValue1 ?? 0) +
        (_selectedValue2 ?? 0) +
        (_workStudyPrevented! ? 3 : 0) +
        (_treatmentProblem ?? 0) +
        (_clothesInfluence ?? 0) +
        (_shoppingInterference ?? 0) +
        (_sportDifficulty ?? 0) +
        (_itchiness ?? 0) +
        (_socialImpact ?? 0) +
        (_embarrassment ?? 0);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(score: totalScore, maxScore: 30),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  final int maxScore;

  const ResultScreen({required this.score, this.maxScore = 30, Key? key}) : super(key: key);

  String _getInterpretation() {
    double percentage = score / maxScore;
    if (percentage >= 0.75) return "Severe impact: Your daily life is significantly affected";
    else if (percentage >= 0.5) return "Major impact: Noticeable difficulties in activities";
    else if (percentage >= 0.25) return "Moderate impact: Some difficulties";
    else return "Mild impact: Minimal interference";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assessment Results"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Text(
                      "YOUR SCORE",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "$score / $maxScore",
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                    ),
                    const SizedBox(height: 24),
                    LinearProgressIndicator(
                      value: score / maxScore,
                      minHeight: 12,
                      backgroundColor: Colors.grey[200],
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      _getInterpretation(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("DONE",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';

class LifeQualityScreen extends StatefulWidget {
  @override
  _LifeQualityScreenState createState() => _LifeQualityScreenState();
}

class _LifeQualityScreenState extends State<LifeQualityScreen> {
  int _currentQuestionIndex = 0;
  int totalScore = 0;
  
  final List<Map<String, dynamic>> questions = [
    {
      'section': 'Personal Relationships',
      'question': 'Over the past week, how much has your eczema caused problems with your partner or family?',
      'type': 'scale',
      'options': ['Very much', 'A lot', 'A little', 'Not at all', 'Not relevant'],
      'values': [3, 2, 1, 0, -1],
      'answer': null
    },
    {
      'section': 'Personal Relationships',
      'question': 'Over the past week, how much has your eczema caused sexual difficulties?',
      'type': 'scale',
      'options': ['Very much', 'A lot', 'A little', 'Not at all', 'Not relevant'],
      'values': [3, 2, 1, 0, -1],
      'answer': null
    },
    {
      'section': 'Daily Activities',
      'question': 'Over the past week, has your eczema prevented you from working or studying?',
      'type': 'yesno',
      'options': ['Yes', 'No', 'Not relevant'],
      'values': [true, false, null],
      'answer': null
    },
    {
      'section': 'Daily Activities',
      'question': 'Over the past week, how much has eczema treatment been a problem?',
      'type': 'scale',
      'options': ['Very much', 'A lot', 'A little', 'Not at all', 'Not relevant'],
      'values': [3, 2, 1, 0, -1],
      'answer': null
    },
    {
      'section': 'Daily Activities',
      'question': 'Over the past week, how much has eczema influenced your choice of clothing?',
      'type': 'scale',
      'options': ['Very much', 'A lot', 'A little', 'Not at all', 'Not relevant'],
      'values': [3, 2, 1, 0, -1],
      'answer': null
    },
    {
      'section': 'Daily Activities',
      'question': 'Over the past week, how much has eczema interfered with shopping or household chores?',
      'type': 'scale',
      'options': ['Very much', 'A lot', 'A little', 'Not at all', 'Not relevant'],
      'values': [3, 2, 1, 0, -1],
      'answer': null
    },
    {
      'section': 'Physical Symptoms',
      'question': 'Over the past week, how itchy, sore, painful, or stinging has your skin been?',
      'type': 'scale',
      'options': ['Very much', 'A lot', 'A little', 'Not at all'],
      'values': [3, 2, 1, 0],
      'answer': null
    },
    {
      'section': 'Social Impact',
      'question': 'Over the past week, how much has eczema affected your social or leisure activities?',
      'type': 'scale',
      'options': ['Very much', 'A lot', 'A little', 'Not at all', 'Not relevant'],
      'values': [3, 2, 1, 0, -1],
      'answer': null
    },
    {
      'section': 'Social Impact',
      'question': 'Over the past week, how embarrassed or self-conscious have you been because of your skin?',
      'type': 'scale',
      'options': ['Very much', 'A lot', 'A little', 'Not at all'],
      'values': [3, 2, 1, 0],
      'answer': null
    },
    {
      'section': 'Social Impact',
      'question': 'Over the past week, how much has your skin made it difficult for you to do any sports?',
      'type': 'scale',
      'options': ['Very much', 'A lot', 'A little', 'Not at all'],
      'values': [3, 2, 1, 0],
      'answer': null
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eczema Impact Assessment"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue[800],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[50]!, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value: (_currentQuestionIndex + 1) / questions.length,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[700]!),
                minHeight: 10,
              ),
              SizedBox(height: 20),
              Text(
                questions[_currentQuestionIndex]['section'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[800],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Question ${_currentQuestionIndex + 1}/${questions.length}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        questions[_currentQuestionIndex]['question'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 20),
                      if (questions[_currentQuestionIndex]['type'] == 'scale')
                        ..._buildScaleOptions(),
                      if (questions[_currentQuestionIndex]['type'] == 'yesno')
                        ..._buildYesNoOptions(),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentQuestionIndex > 0)
                    OutlinedButton(
                      onPressed: _previousQuestion,
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: BorderSide(color: Colors.blue[700]!),
                      ),
                      child: Text(
                        'Back',
                        style: TextStyle(color: Colors.blue[700]),
                      ),
                    ),
                  if (_currentQuestionIndex < questions.length - 1)
                    ElevatedButton(
                      onPressed: _nextQuestion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Next'),
                    ),
                  if (_currentQuestionIndex == questions.length - 1)
                    ElevatedButton(
                      onPressed: _calculateScore,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[600],
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Get Results'),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildScaleOptions() {
    return List<Widget>.generate(
      questions[_currentQuestionIndex]['options'].length,
      (index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: Colors.grey[300]!,
              width: 1,
            ),
          ),
          child: RadioListTile<int>(
            title: Text(
              questions[_currentQuestionIndex]['options'][index],
              style: TextStyle(fontSize: 16),
            ),
            value: questions[_currentQuestionIndex]['values'][index],
            groupValue: questions[_currentQuestionIndex]['answer'],
            onChanged: (value) {
              setState(() {
                questions[_currentQuestionIndex]['answer'] = value;
              });
            },
            activeColor: Colors.blue[700],
            dense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildYesNoOptions() {
    return List<Widget>.generate(
      questions[_currentQuestionIndex]['options'].length,
      (index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: Colors.grey[300]!,
              width: 1,
            ),
          ),
          child: RadioListTile<bool?>(
            title: Text(
              questions[_currentQuestionIndex]['options'][index],
              style: TextStyle(fontSize: 16),
            ),
            value: questions[_currentQuestionIndex]['values'][index],
            groupValue: questions[_currentQuestionIndex]['answer'],
            onChanged: (value) {
              setState(() {
                questions[_currentQuestionIndex]['answer'] = value;
              });
            },
            activeColor: Colors.blue[700],
            dense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
          ),
        ),
      ),
    );
  }

  void _nextQuestion() {
    if (questions[_currentQuestionIndex]['answer'] == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select an answer'),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
      return;
    }
    setState(() {
      _currentQuestionIndex++;
    });
  }

  void _previousQuestion() {
    setState(() {
      _currentQuestionIndex--;
    });
  }

  void _calculateScore() {
    totalScore = 0;
    
    for (var q in questions) {
      final answer = q['answer'];
      if (answer == null || answer == -1) continue;
      
      if (answer is bool) {
        totalScore += answer ? 3 : 0;
      } else if (answer is int) {
        totalScore += answer;
      }
    }
    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(score: totalScore, maxScore: 30),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  final int maxScore;

  const ResultScreen({required this.score, this.maxScore = 30});

  String _getInterpretation() {
    double percentage = score / maxScore;
    if (percentage >= 0.75) return "Severe Impact: Your eczema is significantly affecting your quality of life";
    else if (percentage >= 0.5) return "Major Impact: Your eczema is noticeably affecting your daily activities";
    else if (percentage >= 0.25) return "Moderate Impact: Your eczema is causing some difficulties";
    else return "Mild Impact: Your eczema has minimal effect on your life";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assessment Results"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue[800],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[50]!, Colors.white],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Text(
                          "YOUR SCORE",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[800],
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "$score / $maxScore",
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[700],
                          ),
                        ),
                        SizedBox(height: 24),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: score / maxScore,
                            minHeight: 12,
                            backgroundColor: Colors.grey[300],
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[700]!),
                          ),
                        ),
                        SizedBox(height: 24),
                        Text(
                          _getInterpretation(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[800],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Done",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}