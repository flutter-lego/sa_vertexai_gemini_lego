import 'package:firebase_vertexai/firebase_vertexai.dart';
import '../../../util/_/shared_params/firebase_vertexai_lego/_.dart';

Future<String?> VerTexAIGeminiInTextOutText(String prompt) async {
  final promptObj = [Content.text(prompt)];
  final response = await vertexAIModel.generateContent(promptObj);
  return response.text;
}