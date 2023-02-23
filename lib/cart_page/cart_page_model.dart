import '../backend/api_requests/api_calls.dart';
import '../components/app_bar_widget.dart';
import '../components/count_controller_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for appBar component.
  late AppBarModel appBarModel;
  // Stores action output result for [Backend Call - API (Add to Wishlist)] action in Image widget.
  ApiCallResponse? addwishlistResult;
  // Stores action output result for [Backend Call - API (Remove Wishlist)] action in Image widget.
  ApiCallResponse? removeWishlistResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
  }

  void dispose() {
    appBarModel.dispose();
  }

  /// Additional helper methods are added here.

}
