import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/material.dart';

import '../../../../../../main.dart';
import '../../../../../config/firebase_vertexai_lego/_.dart';
import '../../../../shared_params/firebase_vertexai_lego/_.dart';

@ReadyBeforeRunApp()
Future<void> readyForFirebaseVertexaiLego() async {
  vertexAIModel =
  FirebaseVertexAI.instance.generativeModel(model: vertexAIModelName);
}
