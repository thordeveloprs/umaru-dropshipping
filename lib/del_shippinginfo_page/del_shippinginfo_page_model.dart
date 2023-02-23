import '../components/add_address_app_bar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DelShippinginfoPageModel extends FlutterFlowModel {
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
