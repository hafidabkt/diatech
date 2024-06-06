import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'phonetic_algorithms.dart'; // Ensure this file exists and includes soundex and metaphone functions
import 'food_list.dart'; // Import the FoodItem class
import 'info_screen.dart'; // Import the InfoScreen

class PhoneticSimilarityPage extends StatefulWidget {
  final String reference;
  PhoneticSimilarityPage({required this.reference});
 
  @override
  _PhoneticSimilarityPageState createState() => _PhoneticSimilarityPageState();
}

class _PhoneticSimilarityPageState extends State<PhoneticSimilarityPage> {
  List<FoodItem> _data = [];
  List<FoodItem> _filteredData = [];
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCsvData();
  }

  Future<void> _loadCsvData() async {
    final rawData = await rootBundle.loadString('../files/3.csv');
    List<List<dynamic>> csvData = const CsvToListConverter().convert(rawData);

    // Assuming the first row is the header and the "Food name" column is the first column
    List<FoodItem> items = csvData.skip(1).take(200).map((row) {
      String name = row[1].toString();
      int gi = int.tryParse(row[6].toString()) ?? 0; // Handle parsing errors
      int gl = int.tryParse(row[7].toString()) ?? 0; // Handle parsing errors
      return FoodItem(name: name, gi: gi, gl: gl);
    }).toList();

    setState(() {
      _data = items;
      _filterData(widget.reference);
    });
  }

  void _filterData(String reference) {
    List<FoodItem> wordMatches = _filterPhoneticWordMatches(_data, reference);
    List<FoodItem> sentenceMatches = _filterPhoneticSentenceMatches(_data, reference);

    // Merge the lists
    _filteredData = [...wordMatches, ...sentenceMatches];

    // Sort by name length
    _filteredData.sort((a, b) => a.name.split(' ').length.compareTo(b.name.split(' ').length));
  }

  List<FoodItem> _filterPhoneticWordMatches(List<FoodItem> items, String reference) {
    return items.where((item) => _phoneticWordMatch(item.name, reference)).toList();
  }

  List<FoodItem> _filterPhoneticSentenceMatches(List<FoodItem> items, String reference) {
    return items.where((item) => _phoneticSentenceMatch(item.name, reference)).toList();
  }

  bool _phoneticWordMatch(String sentence, String reference) {
    final words = sentence.split(' ');
    return words.any((word) => _soundexSimilarity(word, reference) || _metaphoneSimilarity(word, reference));
  }

  bool _phoneticSentenceMatch(String sentence, String reference) {
    final words = sentence.split(' ');
    final permutations = _getPermutations(words);
    return permutations.any((perm) {
      final permSentence = perm.join(' ');
      return _soundexSimilarity(permSentence, reference) || _metaphoneSimilarity(permSentence, reference);
    });
  }

  bool _soundexSimilarity(String s1, String s2) {
    return soundex(s1) == soundex(s2);
  }

  bool _metaphoneSimilarity(String s1, String s2) {
    return metaphone(s1) == metaphone(s2);
  }

  List<List<String>> _getPermutations(List<String> words) {
    if (words.isEmpty) return [[]];
    List<List<String>> result = [];
    for (int i = 0; i < words.length; i++) {
      List<String> remainingWords = List.from(words)..removeAt(i);
      for (var perm in _getPermutations(remainingWords)) {
        result.add([words[i], ...perm]);
      }
    }
    return result;
  }

  Color _getColorForCategory(int value) {
    if (value <= 50) {
      return Colors.green;
    } else if (value <= 100) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: [
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Reference: ${widget.reference}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredData.length,
                itemBuilder: (context, index) {
                  final item = _filteredData[index];
                  return ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text('${item.name}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          width: 20,
                          height: 40,
                          child: CircleAvatar(
                            backgroundColor: _getColorForCategory(item.gi),
                            child: Text('GI', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text('GI: ${item.gi}'),
                        SizedBox(width: 20),
                        SizedBox(
                          width: 20,
                          height: 40,
                          child: CircleAvatar(
                            backgroundColor: _getColorForCategory(item.gl),
                            child: Text('GL', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text('GL: ${item.gl}'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
