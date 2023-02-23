import '../backend/api_requests/api_calls.dart';
import '../components/backbar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for backbar component.
  late BackbarModel backbarModel;
  // State field(s) for oldPass widget.
  TextEditingController? oldPassController;
  late bool oldPassVisibility;
  String? Function(BuildContext, String?)? oldPassControllerValidator;
  // State field(s) for newPass widget.
  TextEditingController? newPassController;
  late bool newPassVisibility;
  String? Function(BuildContext, String?)? newPassControllerValidator;
  // State field(s) for confirmPass widget.
  TextEditingController? confirmPassController;
  late bool confirmPassVisibility;
  String? Function(BuildContext, String?)? confirmPassControllerValidator;
  // Stores action output result for [Backend Call - API (Change Password API)] action in Button widget.
  ApiCallResponse? registerResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backbarModel = createModel(context, () => BackbarModel());
    oldPassVisibility = false;
    newPassVisibility = false;
    confirmPassVisibility = false;
  }

  void dispose() {
    backbarModel.dispose();
    oldPassController?.dispose();
    newPassController?.dispose();
    confirmPassController?.dispose();
  }

  /// Additional helper methods are added here.

}
