import '../backend/api_requests/api_calls.dart';
import '../components/app_bar2_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderDetailModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Order Details)] action in order_Detail widget.
  ApiCallResponse? orderDetailResult;
  // Model for appBar_2 component.
  late AppBar2Model appBar2Model;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBar2Model = createModel(context, () => AppBar2Model());
  }

  void dispose() {
    appBar2Model.dispose();
  }

  /// Additional helper methods are added here.

}
