import '../backend/api_requests/api_calls.dart';
import '../components/shopwish_tabbar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllcategoryShopPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for shopwishTabbar component.
  late ShopwishTabbarModel shopwishTabbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    shopwishTabbarModel = createModel(context, () => ShopwishTabbarModel());
  }

  void dispose() {
    shopwishTabbarModel.dispose();
  }

  /// Additional helper methods are added here.

}
