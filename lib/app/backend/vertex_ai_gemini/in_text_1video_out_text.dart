import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_vertexai/firebase_vertexai.dart';

import '../../../util/_/shared_params/firebase_vertexai_lego/_.dart';

Future<String> VerTexAIGeminiInText1VideoOutText(String prompt, File videoFile, String? videoType) async {
  // 텍스트 프롬프트 준비
  final textPart = TextPart(prompt);

  // 비디오 데이터를 읽어오기
  final videoBytes = await videoFile.readAsBytes();

  // 비디오 데이터를 DataPart로 준비 (MIME 타입: 'video/mp4')
  final videoPart = DataPart(videoType ?? 'video/mp4', videoBytes);

  // 텍스트와 비디오를 Content.multi로 결합하여 전송
  final response = vertexAIModel.generateContentStream([
    Content.multi([textPart, videoPart])
  ]);

  // 응답을 스트림으로 처리하여 텍스트 결합
  StringBuffer completeResponse = StringBuffer();
  await for (final chunk in response) {
    completeResponse.write(chunk.text);
  }

  // 모든 텍스트를 하나로 결합한 후 반환
  return completeResponse.toString();
}
