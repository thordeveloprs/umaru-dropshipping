import '../backend/api_requests/api_calls.dart';
import '../components/backbar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPasswordModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for backbar component.
  late BackbarModel backbarModel;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Forgot Password API)] action in Button widget.
  ApiCallResponse? forgotResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backbarModel = createModel(context, () => BackbarModel());
  }

  void dispose() {
    backbarModel.dispose();
    textController?.dispose();
  }

  /// Additional helper methods are added here.

}
