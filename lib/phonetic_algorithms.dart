String soundex(String s) {
  if (s.isEmpty) return "";
  List<String> map = [
    "AEIOUYHW",
    "BFPV",
    "CGJKQSXZ",
    "DT",
    "L",
    "MN",
    "R"
  ];

  s = s.toUpperCase();
  String firstLetter = s[0];
  StringBuffer result = StringBuffer(firstLetter);
  String lastCode = _encode(firstLetter, map);

  for (int i = 1; i < s.length; i++) {
    String code = _encode(s[i], map);
    if (code != lastCode && code.isNotEmpty) {
      result.write(code);
    }
    if (result.length == 4) break;
    if (code.isNotEmpty) lastCode = code;
  }

  while (result.length < 4) {
    result.write("0");
  }

  return result.toString();
}

String _encode(String s, List<String> map) {
  for (int i = 0; i < map.length; i++) {
    if (map[i].contains(s)) return i.toString();
  }
  return "";
}

String metaphone(String word) {
  // A basic implementation of the Metaphone algorithm
  // Note: This is a simplified version and may not cover all cases
  if (word.isEmpty) return "";

  word = word.toUpperCase();
  List<String> result = [];
  List<String> vowels = ["A", "E", "I", "O", "U"];
  String lastChar = '';

  for (int i = 0; i < word.length; i++) {
    String currentChar = word[i];
    if (i == 0) {
      if (!vowels.contains(currentChar)) {
        result.add(currentChar);
      }
    } else {
      if (currentChar != lastChar) {
        result.add(currentChar);
      }
    }
    lastChar = currentChar;
  }

  return result.join();
}
