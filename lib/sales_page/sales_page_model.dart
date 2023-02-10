import '../components/app_bar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SalesPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for appBar component.
  late AppBarModel appBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
  }

  void dispose() {}

  /// Additional helper methods are added here.

}
