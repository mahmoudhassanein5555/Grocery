String formatHowToUse(String? rawText) {
  if (rawText == null || rawText.isEmpty) return 'No instructions provided.';

  List<String> sentences = rawText.split('.');

  List<String> cleanSentences =
      sentences.map((s) => s.trim()).where((s) => s.isNotEmpty).toList();

  String formattedText = '';
  for (int i = 0; i < cleanSentences.length; i++) {
    formattedText += '${i + 1}- ${cleanSentences[i]}.\n';
  }

  return formattedText.trim();
}
