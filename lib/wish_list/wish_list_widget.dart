import '../backend/api_requests/api_calls.dart';
import '../components/shopwish_tabbar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'wish_list_model.dart';
export 'wish_list_model.dart';

class WishListWidget extends StatefulWidget {
  const WishListWidget({Key? key}) : super(key: key);

  @override
  _WishListWidgetState createState() => _WishListWidgetState();
}

class _WishListWidgetState extends State<WishListWidget> {
  late WishListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WishListModel());
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
                  apptitlewishshop: 'Wishlist',
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(14, 26, 14, 0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: UmaruMallGroup.showAllWishlistCall.call(
                            userId: getJsonField(
                              FFAppState().userdata,
                              r'''$.id''',
                            ),
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
                            final gridViewShowAllWishlistResponse =
                                snapshot.data!;
                            return Builder(
                              builder: (context) {
                                final wishlistChild =
                                    UmaruMallGroup.showAllWishlistCall
                                            .wishlist(
                                              gridViewShowAllWishlistResponse
                                                  .jsonBody,
                                            )
                                            ?.map((e) => e)
                                            .toList()
                                            ?.toList() ??
                                        [];
                                return InkWell(
                                  onTap: () async {
                                    _model.wishlistResult = await UmaruMallGroup
                                        .showAllWishlistCall
                                        .call(
                                      userId: getJsonField(
                                        FFAppState().userdata,
                                        r'''$.id''',
                                      ),
                                      token: FFAppState().token,
                                    );
                                    if (getJsonField(
                                          (_model.wishlistResult?.jsonBody ??
                                              ''),
                                          r'''$.status''',
                                        ) ==
                                        '1') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            getJsonField(
                                              (_model.wishlistResult
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.message''',
                                            ).toString(),
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .textColor,
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            getJsonField(
                                              (_model.wishlistResult
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.message''',
                                            ).toString(),
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .textColor,
                                        ),
                                      );
                                    }

                                    setState(() {});
                                  },
                                  child: GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 30,
                                      childAspectRatio: 1,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: wishlistChild.length,
                                    itemBuilder: (context, wishlistChildIndex) {
                                      final wishlistChildItem =
                                          wishlistChild[wishlistChildIndex];
                                      return Stack(
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: InkWell(
                                                  onTap: () async {
                                                    context.pushNamed(
                                                        'product_Detail');
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 5,
                                                          color:
                                                              Color(0x12000000),
                                                          offset: Offset(0, 0),
                                                          spreadRadius: 1,
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      25,
                                                                      10,
                                                                      25,
                                                                      0),
                                                          child: Image.asset(
                                                            'assets/images/image_61.png',
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.315,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(13,
                                                                      0, 13, 0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            15,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        'Product name goes here',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        maxLines:
                                                                            1,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFF050404),
                                                                              fontSize: 11.5,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            3,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      getJsonField(
                                                                        wishlistChildItem,
                                                                        r'''$.original_price''',
                                                                      ).toString(),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFF050404),
                                                                            fontSize:
                                                                                10,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        'FCFA',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                0.79, 0.31),
                                            child: Container(
                                              width: 24,
                                              height: 24,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 2,
                                                    color: Color(0x3E000000),
                                                    offset: Offset(0, -1),
                                                  )
                                                ],
                                                shape: BoxShape.circle,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  if (FFAppState().isWishlist ==
                                                      true)
                                                    InkWell(
                                                      onTap: () async {
                                                        _model.removeWishlistResult =
                                                            await UmaruMallGroup
                                                                .removeWishlistCall
                                                                .call(
                                                          userId: getJsonField(
                                                            FFAppState()
                                                                .userdata,
                                                            r'''$.id''',
                                                          ),
                                                          productId:
                                                              getJsonField(
                                                            wishlistChildItem,
                                                            r'''$.ID''',
                                                          ),
                                                          token: FFAppState()
                                                              .token,
                                                        );
                                                        if (getJsonField(
                                                              wishlistChildItem,
                                                              r'''$.status''',
                                                            ) ==
                                                            '1') {
                                                          setState(() {
                                                            FFAppState()
                                                                    .isWishlist =
                                                                false;
                                                          });
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                getJsonField(
                                                                  (_model.removeWishlistResult
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.message''',
                                                                ).toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .textColor,
                                                            ),
                                                          );
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                getJsonField(
                                                                  (_model.removeWishlistResult
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.message''',
                                                                ).toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .textColor,
                                                            ),
                                                          );
                                                        }

                                                        setState(() {});
                                                      },
                                                      child: Image.asset(
                                                        'assets/images/love.png',
                                                        width: 10,
                                                        height: 9,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
