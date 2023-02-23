import '../components/backbar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DelForgotPassword1Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for backbar component.
  late BackbarModel backbarModel;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

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
