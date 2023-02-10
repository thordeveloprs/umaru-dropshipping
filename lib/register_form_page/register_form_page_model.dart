import '../components/backbar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterFormPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for backbar component.
  late BackbarModel backbarModel;
  // State field(s) for TextFieldFullName widget.
  TextEditingController? textFieldFullNameController;
  String? Function(BuildContext, String?)? textFieldFullNameControllerValidator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backbarModel = createModel(context, () => BackbarModel());
  }

  void dispose() {
    textFieldFullNameController?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    textController5?.dispose();
  }

  /// Additional helper methods are added here.

}
