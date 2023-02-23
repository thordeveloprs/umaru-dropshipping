import '../components/app_bar2_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReviewPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for appBar_2 component.
  late AppBar2Model appBar2Model;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBar2Model = createModel(context, () => AppBar2Model());
  }

  void dispose() {
    appBar2Model.dispose();
  }

  /// Additional helper methods are added here.

}
