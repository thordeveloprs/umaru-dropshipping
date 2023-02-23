import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Bearer TOKEN generation)] action in Home widget.
  ApiCallResponse? tokenResult;
  // Stores action output result for [Backend Call - API (Home)] action in Home widget.
  ApiCallResponse? homeResuly;
  // Stores action output result for [Backend Call - API (Add to Wishlist)] action in Image widget.
  ApiCallResponse? addwishlistResult;
  // Stores action output result for [Backend Call - API (Remove Wishlist)] action in Image widget.
  ApiCallResponse? removeWishlistResult;
  // State field(s) for PageView widget.
  PageController? pageViewController1;
  // Stores action output result for [Backend Call - API (Add to Wishlist)] action in Image widget.
  ApiCallResponse? addwishlistResultt;
  // Stores action output result for [Backend Call - API (Remove Wishlist)] action in Image widget.
  ApiCallResponse? removeWishlistResultt;
  // State field(s) for PageView widget.
  PageController? pageViewController2;
  // Stores action output result for [Backend Call - API (Add to Wishlist)] action in Image widget.
  ApiCallResponse? addwishlistResult1;
  // Stores action output result for [Backend Call - API (Remove Wishlist)] action in Image widget.
  ApiCallResponse? removeWishlistResult1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
