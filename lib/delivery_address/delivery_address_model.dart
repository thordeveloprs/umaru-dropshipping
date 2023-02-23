import '../backend/api_requests/api_calls.dart';
import '../components/add_address_app_bar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeliveryAddressModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for add_address_appBar component.
  late AddAddressAppBarModel addAddressAppBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    addAddressAppBarModel = createModel(context, () => AddAddressAppBarModel());
  }

  void dispose() {
    addAddressAppBarModel.dispose();
  }

  /// Additional helper methods are added here.

}
