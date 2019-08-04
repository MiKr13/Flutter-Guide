import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_guide/Stateless/body.dart';
import 'package:flutter_guide/Stateless/footer.dart' as footer;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // understand final vs const
  // static const List<Map<String, Object>> _questions = [ use static with const to satisfy Dart as it doesn't allows const at Class level or,
  final List<Map<String, Object>> _questions = const [
    {
      'questionText': 'What is the number of states in India?',
      'options': ['14', '27', '29', 'NA'],
      'answer': '29'
    },
    {
      'questionText':
          'Which is the first state to be formed on the basis of language?',
      'options': ['Andhra Pradesh', 'Bombay', 'Madhya Bharat', 'Meghalaya'],
      'answer': 'Andhra Pradesh'
    },
    {
      'questionText':
          'Which state was divided into Maharashtra and Gujarat in 1960?',
      'options': ['Bombay', 'Madras', 'Mysore', 'Hyderabad'],
      'answer': 'Bombay'
    },
    {
      'questionText':
          'Which city was the summer capital of India during British Rule?',
      'options': ['Ooty', 'Simla', 'Pachmarhi', 'Matheran'],
      'answer': 'Simla'
    },
    {
      'questionText': 'When was Burma was separated from India?',
      'options': ['1948', '1901', '1937', '1945'],
      'answer': '1937'
    },
    {
      'questionText': 'When did India become a republic?',
      'options': ['1935', '1947', '1950', '1961'],
      'answer': '1950'
    },
    {
      'questionText':
          'Who was the Speaker of the Lok Sabha before he became the President of India?',
      'options': [
        'R. Venkataraman',
        'A.P.J. Abdul Kalam',
        'N. Sanjeeva Reddy',
        'K. R. Narayanan'
      ],
      'answer': 'N. Sanjeeva Reddy'
    },
    {
      'questionText':
          'What was the age of Morarji Desai when he became the Prime Minister?',
      'options': ['45', '56', '81', '96'],
      'answer': '81'
    },
    {
      'questionText': 'How was Tamil Nadu known?',
      'options': ['Mysore', 'Madras', 'Bombay', 'Hyderabad'],
      'answer': 'Madras'
    },
    {
      'questionText': 'Which is the capital of Kerala',
      'options': ['Calicut', 'Cochin', 'Ooty', 'Thiruvananthapuram'],
      'answer': 'Thiruvananthapuram'
    },
    {
      'questionText': 'Nagaland was separated from which state?',
      'options': ['Orissa', 'Punjab', 'West Bengal', 'Assam'],
      'answer': 'Assam'
    },
    {
      'questionText': 'Which is the smallest state in terms of area?',
      'options': ['Punjab', 'Sikkim', 'Goa', 'Tripura'],
      'answer': 'Goa'
    },
    {
      'questionText': 'Where is the tomb of Akbar?',
      'options': ['Delhi', 'Sikandra', 'Lahore', 'Fatehpur Sikri'],
      'answer': 'Sikandra'
    },
    {
      'questionText':
          'Which former Indian Prime Minister’s birthday is on December 25?',
      'options': [
        'Rajiv Gandhi',
        'Atal Bihari Vajpayee',
        'Lal Bahadur Shastri',
        'P.V. Narasimha Roa'
      ],
      'answer': 'Atal Bihari Vajpayee'
    },
    {
      'questionText': 'Which state was known as North East Frontier Agency?',
      'options': ['Mizoram', 'Tripura', 'Manipur', 'Arunachal Pradesh'],
      'answer': 'Arunachal Pradesh'
    }
  ];

  void _showToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.blue[300],
        textColor: Colors.white70,
        fontSize: 19.0);
  }

  var _index = 0, _correctCount = 0;
  void _checkAndChangeQuestion(String choice) {
    if (choice == _questions[_index]['answer']) {
      _showToast('Right Answer');
      _correctCount++;
    } else {
      _showToast('Wrong Answer');
    }
    setState(() {
      _index++;
    });
  }

  void _reset() {
    setState(() {
      _index = 0;
      _correctCount = 0;
    });
  }

  var _theme = Brightness.dark;
  void _changeTheme() {
    setState(() {
      _theme = _theme == Brightness.dark ? Brightness.light : Brightness.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    // build() returns a so-called "widget tree" which tells Flutter what to draw onto the screen
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // brightness: Brightness.light, // to enable dark theme by default instead of battery saver mode only
        brightness: _theme,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('QUIZmania'),
        ),
        body: Body(
            _questions, _index, _checkAndChangeQuestion, _reset, _correctCount),
        bottomNavigationBar: footer.Footer(_changeTheme),
      ),
    );
  }
}
