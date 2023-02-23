import '../backend/api_requests/api_calls.dart';
import '../components/shopwish_tabbar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WishListModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for shopwishTabbar component.
  late ShopwishTabbarModel shopwishTabbarModel;
  // Stores action output result for [Backend Call - API (Show all Wishlist)] action in GridView widget.
  ApiCallResponse? wishlistResult;
  // Stores action output result for [Backend Call - API (Remove Wishlist)] action in Image widget.
  ApiCallResponse? removeWishlistResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    shopwishTabbarModel = createModel(context, () => ShopwishTabbarModel());
  }

  void dispose() {
    shopwishTabbarModel.dispose();
  }

  /// Additional helper methods are added here.

}
