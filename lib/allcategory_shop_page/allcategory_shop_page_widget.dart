import '../backend/api_requests/api_calls.dart';
import '../components/shopwish_tabbar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'allcategory_shop_page_model.dart';
export 'allcategory_shop_page_model.dart';

class AllcategoryShopPageWidget extends StatefulWidget {
  const AllcategoryShopPageWidget({Key? key}) : super(key: key);

  @override
  _AllcategoryShopPageWidgetState createState() =>
      _AllcategoryShopPageWidgetState();
}

class _AllcategoryShopPageWidgetState extends State<AllcategoryShopPageWidget> {
  late AllcategoryShopPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllcategoryShopPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.shopwishTabbarModel,
                updateCallback: () => setState(() {}),
                child: ShopwishTabbarWidget(
                  apptitlewishshop: 'Shop',
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 33, 15, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FutureBuilder<ApiCallResponse>(
                          future: UmaruMallGroup.allCategoryListCall.call(
                            categoryId: 0,
                            token: FFAppState().token,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            final gridViewAllCategoryListResponse =
                                snapshot.data!;
                            return Builder(
                              builder: (context) {
                                final category =
                                    UmaruMallGroup.allCategoryListCall
                                            .categorylist(
                                              gridViewAllCategoryListResponse
                                                  .jsonBody,
                                            )
                                            ?.map((e) => e)
                                            .toList()
                                            ?.toList() ??
                                        [];
                                return GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 18,
                                    mainAxisSpacing: 18,
                                    childAspectRatio: 1,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: category.length,
                                  itemBuilder: (context, categoryIndex) {
                                    final categoryItem =
                                        category[categoryIndex];
                                    return InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'category_Page',
                                          queryParams: {
                                            'catID': serializeParam(
                                              getJsonField(
                                                categoryItem,
                                                r'''$.id''',
                                              ),
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 8,
                                              color: Color(0x11000000),
                                              offset: Offset(0, 4),
                                              spreadRadius: 0,
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10.5, 0, 0),
                                              child: Container(
                                                width: 41,
                                                height: 43,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Image.network(
                                                  getJsonField(
                                                    categoryItem,
                                                    r'''$.image''',
                                                  ),
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 9, 0, 0),
                                                    child: Text(
                                                      getJsonField(
                                                        categoryItem,
                                                        r'''$.name''',
                                                      ).toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
