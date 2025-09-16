import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'teclado_widget.dart' show TecladoWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class TecladoModel extends FlutterFlowModel<TecladoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  AudioPlayer? soundPlayer;
  // State field(s) for Slider widget.
  double? sliderValue1;
  // State field(s) for Slider widget.
  double? sliderValue2;
  // State field(s) for Slider widget.
  double? sliderValue3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
