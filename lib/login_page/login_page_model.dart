import '../backend/api_requests/api_calls.dart';
import '../components/backbar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for backbar component.
  late BackbarModel backbarModel;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }

    return null;
  }

  // State field(s) for TextField widget.
  TextEditingController? textController2;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (LogIn API)] action in Button widget.
  ApiCallResponse? resultLogin;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backbarModel = createModel(context, () => BackbarModel());
    textController1Validator = _textController1Validator;
    passwordVisibility = false;
    textController2Validator = _textController2Validator;
  }

  void dispose() {
    backbarModel.dispose();
    textController1?.dispose();
    textController2?.dispose();
  }

  /// Additional helper methods are added here.

}
