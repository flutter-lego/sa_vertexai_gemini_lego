import 'dart:io';

import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../_/shared_params/firebase_vertexai_lego/_.dart';

String _noteName = "Note";

/// Generate text from text-only input Stream
T _button00 = T("00", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  // Provide a prompt that contains text
  final prompt = [Content.text('Write a story about a magic backpack.')];

  // To stream generated text output, call generateContentStream with the text input
  final response = vertexAIModel.generateContentStream(prompt);
  await for (final chunk in response) {
    print(chunk.text);
  }
  ////////////////////////////////////////
});

/// Generate text from text-only input
T _button01 = T("01", onTap: (BuildContext context) async {
  ////////////////////////////////////////
  // Provide a prompt that contains text
  final prompt = [Content.text('Write a story about a magic backpack.')];

  // To generate text output, call generateContent with the text input
  final response = await vertexAIModel.generateContent(prompt);
  print(response.text);
  ////////////////////////////////////////
});

/// Generate text from text and a single image
T _button02 = T("02", onTap: (BuildContext context) async {
  ////////////////////////////////////////
  // Provide a text prompt to include with the image
  final prompt = TextPart("What's in the picture?");
  // Prepare images for input
  // final image = await File('image0.jpg').readAsBytes();
  // final imagePart = DataPart('image/jpeg', image);

  final image =
      await rootBundle.load('assets/lego/firebase_vertexai_lego/winter.webp');
  final imageBytes = image.buffer.asUint8List();
  final imagePart = DataPart('image/jpeg', imageBytes);

  // To stream generated text output, call generateContentStream with the text and image
  final response = vertexAIModel.generateContentStream([
    Content.multi([prompt, imagePart])
  ]);
  await for (final chunk in response) {
    print(chunk.text);
  }
  ////////////////////////////////////////
});

/// Generate text from text and a single image
T _button03 = T("03", onTap: (BuildContext context) async {
  ////////////////////////////////////////
  // Provide a text prompt to include with the image
  final prompt = TextPart("What's in the picture?");
  // Prepare images for input
  // final image = await File('image0.jpg').readAsBytes();
  // final imagePart = DataPart('image/jpeg', image);

  final image =
      await rootBundle.load('assets/lego/firebase_vertexai_lego/winter.webp');
  final imageBytes = image.buffer.asUint8List();
  final imagePart = DataPart('image/jpeg', imageBytes);

  // To generate text output, call generateContent with the text and image
  final response = await vertexAIModel.generateContent([
    Content.multi([prompt, imagePart])
  ]);
  print(response.text);
  ////////////////////////////////////////
});

/// Generate text from text and multiple images Stream
T _button04 = T("04", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  // Load both images from assets
  final imagesData = await Future.wait([
    rootBundle.load('assets/lego/firebase_vertexai_lego/winter.webp'),
    rootBundle.load('assets/lego/firebase_vertexai_lego/want0.webp'),
  ]);

  // Convert ByteData to Uint8List for each image with null checks
  final firstImage = imagesData[0].buffer.asUint8List();
  final secondImage = imagesData[1].buffer.asUint8List();

  // Provide a text prompt to include with the images
  final prompt = TextPart("What's different between these pictures?");

  // Prepare images for input
  final imageParts = [
    DataPart('image/jpeg', firstImage),
    DataPart('image/jpeg', secondImage),
  ];

  // To stream generated text output, call generateContentStream with the text and images
  final response = vertexAIModel.generateContentStream([
    Content.multi([prompt, ...imageParts])
  ]);
  await for (final chunk in response) {
    print(chunk.text);
  }

  ////////////////////////////////////////
});

/// Generate text from text and multiple images
T _button05 = T("05", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  // Load both images from assets
  final imagesData = await Future.wait([
    rootBundle.load('assets/lego/firebase_vertexai_lego/winter.webp'),
    rootBundle.load('assets/lego/firebase_vertexai_lego/want0.webp'),
  ]);

  // Convert ByteData to Uint8List for each image with null checks
  final firstImage = imagesData[0].buffer.asUint8List();
  final secondImage = imagesData[1].buffer.asUint8List();

  // Provide a text prompt to include with the images
  final prompt = TextPart("What's different between these pictures?");

  // Prepare images for input
  final imageParts = [
    DataPart('image/jpeg', firstImage),
    DataPart('image/jpeg', secondImage),
  ];

  // To generate text output, call generateContent with the text and images
  final response = await vertexAIModel.generateContent([
    Content.multi([prompt, ...imageParts])
  ]);

  print(response.text);

  ////////////////////////////////////////
});

/// Generate text from text and a video
T _button06 = T("06", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  // Provide a text prompt to include with the video
  final prompt = TextPart("What's in the video?");

  // Prepare video for input
  final video = await File('video0.mp4').readAsBytes();

  // Provide the video as `Data` with the appropriate mimetype
  final videoPart = DataPart('video/mp4', video);

  // To stream generated text output, call generateContentStream with the text and image
  final response = await vertexAIModel.generateContentStream([
    Content.multi([prompt, videoPart])
  ]);
  await for (final chunk in response) {
    print(chunk.text);
  }

  ////////////////////////////////////////
});


T _button07 = T("07", onTap: (BuildContext context) async {
  ///////////////////////////////////////


  ////////////////////////////////////////
});

/// Count tokens and billable characters (text-only input)
T _button08 = T("08", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  final tokenCount = await vertexAIModel.countTokens([Content.text("Write a story about a magic backpack.")]);
  print('Token count: ${tokenCount.totalTokens}, billable characters: ${tokenCount.totalBillableCharacters}');

  ////////////////////////////////////////
});

/// Count tokens and billable characters (text and image input)
T _button09 = T("09", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  final prompt = TextPart("What's in the picture?");
  final image =
  await rootBundle.load('assets/lego/firebase_vertexai_lego/winter.webp');
  final imageBytes = image.buffer.asUint8List();
  final imagePart = DataPart('image/jpeg', imageBytes);

  final tokenCount = await vertexAIModel.countTokens([
    Content.multi([prompt, imagePart])
  ]);
  print('Token count: ${tokenCount.totalTokens}, billable characters: ${tokenCount.totalBillableCharacters}');

  ////////////////////////////////////////
});

T _button10 = T("10", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button11 = T("11", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button12 = T("12", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button13 = T("13", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button14 = T("14", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button15 = T("15", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button16 = T("16", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button17 = T("17", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button18 = T("18", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button19 = T("19", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button20 = T("20", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button21 = T("21", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button22 = T("22", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button23 = T("23", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button24 = T("24", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button25 = T("25", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button26 = T("26", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button27 = T("27", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button28 = T("28", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button29 = T("29", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button30 = T("30", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button31 = T("31", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button32 = T("32", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button33 = T("33", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button34 = T("34", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button35 = T("35", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button36 = T("36", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button37 = T("37", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button38 = T("38", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button39 = T("39", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button40 = T("40", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button41 = T("41", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button42 = T("42", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button43 = T("43", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button44 = T("44", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button45 = T("45", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button46 = T("46", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button47 = T("47", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button48 = T("48", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button49 = T("49", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button50 = T("50", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button51 = T("51", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button52 = T("52", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button53 = T("53", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button54 = T("54", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button55 = T("55", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button56 = T("56", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button57 = T("57", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button58 = T("58", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button59 = T("59", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button60 = T("60", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button61 = T("61", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button62 = T("62", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button63 = T("63", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button64 = T("64", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button65 = T("65", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button66 = T("66", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button67 = T("67", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button68 = T("68", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button69 = T("69", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button70 = T("70", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button71 = T("71", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button72 = T("72", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button73 = T("73", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button74 = T("74", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button75 = T("75", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button76 = T("76", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button77 = T("77", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button78 = T("78", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button79 = T("79", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button80 = T("80", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button81 = T("81", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button82 = T("82", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button83 = T("83", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button84 = T("84", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button85 = T("85", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button86 = T("86", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button87 = T("87", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button88 = T("88", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button89 = T("89", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button90 = T("90", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button91 = T("91", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button92 = T("92", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button93 = T("93", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button94 = T("94", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button95 = T("95", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button96 = T("96", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button97 = T("97", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button98 = T("98", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

T _button99 = T("99", onTap: (BuildContext context) async {
  ////////////////////////////////////////

  ////////////////////////////////////////
});

main() async {
  return buildApp(
      home: FunctionNoteKit(
    title: _noteName,
    button00: _button00,
    button01: _button01,
    button02: _button02,
    button03: _button03,
    button04: _button04,
    button05: _button05,
    button06: _button06,
    button07: _button07,
    button08: _button08,
    button09: _button09,
    button10: _button10,
    button11: _button11,
    button12: _button12,
    button13: _button13,
    button14: _button14,
    button15: _button15,
    button16: _button16,
    button17: _button17,
    button18: _button18,
    button19: _button19,
    button20: _button20,
    button21: _button21,
    button22: _button22,
    button23: _button23,
    button24: _button24,
    button25: _button25,
    button26: _button26,
    button27: _button27,
    button28: _button28,
    button29: _button29,
    button30: _button30,
    button31: _button31,
    button32: _button32,
    button33: _button33,
    button34: _button34,
    button35: _button35,
    button36: _button36,
    button37: _button37,
    button38: _button38,
    button39: _button39,
    button40: _button40,
    button41: _button41,
    button42: _button42,
    button43: _button43,
    button44: _button44,
    button45: _button45,
    button46: _button46,
    button47: _button47,
    button48: _button48,
    button49: _button49,
    button50: _button50,
    button51: _button51,
    button52: _button52,
    button53: _button53,
    button54: _button54,
    button55: _button55,
    button56: _button56,
    button57: _button57,
    button58: _button58,
    button59: _button59,
    button60: _button60,
    button61: _button61,
    button62: _button62,
    button63: _button63,
    button64: _button64,
    button65: _button65,
    button66: _button66,
    button67: _button67,
    button68: _button68,
    button69: _button69,
    button70: _button70,
    button71: _button71,
    button72: _button72,
    button73: _button73,
    button74: _button74,
    button75: _button75,
    button76: _button76,
    button77: _button77,
    button78: _button78,
    button79: _button79,
    button80: _button80,
    button81: _button81,
    button82: _button82,
    button83: _button83,
    button84: _button84,
    button85: _button85,
    button86: _button86,
    button87: _button87,
    button88: _button88,
    button89: _button89,
    button90: _button90,
    button91: _button91,
    button92: _button92,
    button93: _button93,
    button94: _button94,
    button95: _button95,
    button96: _button96,
    button97: _button97,
    button98: _button98,
    button99: _button99,
  ));
}
