import 'package:firebase_vertexai/firebase_vertexai.dart';
import '../../../main.dart';
import '../../../util/_/shared_params/firebase_vertexai_lego/_.dart';

Future<String?> VerTexAIGeminiInTextIManyImageOutText(
    String prompt, List<Uint8List> imageBytesList, List<String?> imageTypeList) async {

  // 텍스트 프롬프트 준비
  final textPart = TextPart(prompt);

  // 이미지 데이터 준비 (각 이미지와 타입을 결합)
  final imageParts = <DataPart>[];
  for (int i = 0; i < imageBytesList.length; i++) {
    // 각 이미지의 타입을 imageTypeList에서 받아오거나 기본적으로 'image/jpeg'로 설정
    final imageType = imageTypeList[i] ?? 'image/jpeg';
    final imagePart = DataPart(imageType, imageBytesList[i]);
    imageParts.add(imagePart);
  }

  // 텍스트와 이미지들을 결합하여 Content.multi에 전달
  final response = await vertexAIModel.generateContent([
    Content.multi([textPart, ...imageParts])
  ]);

  // 응답의 텍스트 반환
  return response.text;
}
