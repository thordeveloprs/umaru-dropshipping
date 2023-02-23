import '../backend/api_requests/api_calls.dart';
import '../components/backbar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterFormPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for backbar component.
  late BackbarModel backbarModel;
  // State field(s) for TextFieldFullName widget.
  TextEditingController? textFieldFullNameController;
  String? Function(BuildContext, String?)? textFieldFullNameControllerValidator;
  String? _textFieldFullNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Name is required';
    }

    return null;
  }

  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }

    return null;
  }

  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Phone number  is required';
    }

    return null;
  }

  // State field(s) for TextField widget.
  TextEditingController? textController4;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController5;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? textController5Validator;
  // Stores action output result for [Backend Call - API (Register API)] action in Button widget.
  ApiCallResponse? registerResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backbarModel = createModel(context, () => BackbarModel());
    textFieldFullNameControllerValidator =
        _textFieldFullNameControllerValidator;
    textController2Validator = _textController2Validator;
    textController3Validator = _textController3Validator;
    passwordVisibility1 = false;
    passwordVisibility2 = false;
  }

  void dispose() {
    backbarModel.dispose();
    textFieldFullNameController?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    textController5?.dispose();
  }

  /// Additional helper methods are added here.

}
