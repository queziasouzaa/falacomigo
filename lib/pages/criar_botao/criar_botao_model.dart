import '/flutter_flow/flutter_flow_util.dart';
import 'criar_botao_widget.dart' show CriarBotaoWidget;
import 'package:flutter/material.dart';

class CriarBotaoModel extends FlutterFlowModel<CriarBotaoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for NomeDoBotao widget.
  FocusNode? nomeDoBotaoFocusNode;
  TextEditingController? nomeDoBotaoTextController;
  String? Function(BuildContext, String?)? nomeDoBotaoTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeDoBotaoFocusNode?.dispose();
    nomeDoBotaoTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();
  }
}
