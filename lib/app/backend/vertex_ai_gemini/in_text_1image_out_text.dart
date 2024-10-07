import 'package:firebase_vertexai/firebase_vertexai.dart';
import '../../../main.dart';
import '../../../util/_/shared_params/firebase_vertexai_lego/_.dart';

Future<String> VerTexAIGeminiInText1ImageOutText(
    String prompt, Uint8List imageBytes, String? imageType) async {
  final textPart = TextPart(prompt);
  final imagePart = DataPart(imageType ?? 'image/jpeg', imageBytes);

  final response = vertexAIModel.generateContentStream([
    Content.multi([textPart, imagePart])
  ]);

  // 하나의 string으로 합치기
  StringBuffer completeResponse = StringBuffer();

  await for (final chunk in response) {
    completeResponse.write(chunk.text);
  }

  return completeResponse.toString();
}
