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
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tokenResult =
          await UmaruMallGroup.bearerTOKENGenerationCall.call();
      if ((_model.tokenResult?.succeeded ?? true)) {
        setState(() {
          FFAppState().token = getJsonField(
            (_model.tokenResult?.jsonBody ?? ''),
            r'''$.token''',
          ).toString().toString();
        });
        _model.homeResuly = await UmaruMallGroup.homeCall.call();
        setState(() {
          _model.isLoading = false;
        });
        setState(() {
          FFAppState().products = functions
              .getpagenumbers(UmaruMallGroup.homeCall
                  .newarrival(
                    (_model.homeResuly?.jsonBody ?? ''),
                  )!
                  .toList())
              .toList();
        });
        setState(() {
          FFAppState().products2 = functions
              .getpagenumbers(UmaruMallGroup.homeCall
                  .saleProduct(
                    (_model.homeResuly?.jsonBody ?? ''),
                  )!
                  .toList())
              .toList();
        });
      } else {
        setState(() {
          _model.isLoading = false;
        });
      }
    });
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (!_model.isLoading)
                  SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    14, 0, 14, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Image.asset(
                                          'assets/images/Vector.png',
                                          width: 20.3,
                                          height: 21,
                                          fit: BoxFit.contain,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Image.asset(
                                          'assets/images/Umaru_Logo_Image.png',
                                          width: 134,
                                          height: 67,
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            context.pushNamed('Cart_Page');
                                          },
                                          child: Image.asset(
                                            'assets/images/bag_(2)_1.png',
                                            width: 17.4,
                                            height: 23.7,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: InkWell(
                                onTap: () async {
                                  context.pushNamed('AllcategoryShopPage');
                                },
                                child: Image.asset(
                                  'assets/images/Screen_Shot_2022-12-02_at_2.09_2.png',
                                  width: double.infinity,
                                  height: 143,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 31, 0, 0),
                          child: Text(
                            'Best Seller',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF0F3253),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                                child: Builder(
                                  builder: (context) {
                                    final bestseller = (UmaruMallGroup.homeCall
                                                .bestselling(
                                                  (_model.homeResuly
                                                          ?.jsonBody ??
                                                      ''),
                                                )
                                                ?.map((e) => e)
                                                .toList()
                                                ?.toList() ??
                                            [])
                                        .take(4)
                                        .toList();
                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 13,
                                        mainAxisSpacing: 13,
                                        childAspectRatio: 1,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: bestseller.length,
                                      itemBuilder: (context, bestsellerIndex) {
                                        final bestsellerItem =
                                            bestseller[bestsellerIndex];
                                        return Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(14, 0, 0, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'product_Detail',
                                                    queryParams: {
                                                      'productID':
                                                          serializeParam(
                                                        getJsonField(
                                                          bestsellerItem,
                                                          r'''$.id''',
                                                        ),
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                                .fromSTEB(25,
                                                                    10, 25, 0),
                                                        child: Container(
                                                          width: 100,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Image.network(
                                                            getJsonField(
                                                              bestsellerItem,
                                                              r'''$.image''',
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(5, 18,
                                                                    0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                getJsonField(
                                                                  bestsellerItem,
                                                                  r'''$.name''',
                                                                )
                                                                    .toString()
                                                                    .maybeHandleOverflow(
                                                                      maxChars:
                                                                          25,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Color(
                                                                          0xFF050404),
                                                                      fontSize:
                                                                          11.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
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
                                                                    5, 4, 5, 5),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              getJsonField(
                                                                bestsellerItem,
                                                                r'''$.price''',
                                                              ).toString(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Color(
                                                                        0xFF050404),
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                'FCFA',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
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
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.78, 0.14),
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    if (FFAppState()
                                                            .isWishlist ==
                                                        false)
                                                      InkWell(
                                                        onTap: () async {
                                                          _model.addwishlistResult =
                                                              await UmaruMallGroup
                                                                  .addToWishlistCall
                                                                  .call(
                                                            userId:
                                                                getJsonField(
                                                              FFAppState()
                                                                  .userdata,
                                                              r'''$.id''',
                                                            ),
                                                            productId:
                                                                getJsonField(
                                                              bestsellerItem,
                                                              r'''$.id''',
                                                            ),
                                                          );
                                                          if (getJsonField(
                                                                (_model.addwishlistResult
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.status''',
                                                              ) ==
                                                              '1') {
                                                            setState(() {
                                                              FFAppState()
                                                                      .isWishlist =
                                                                  true;
                                                            });
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  getJsonField(
                                                                    (_model.addwishlistResult
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
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  getJsonField(
                                                                    (_model.addwishlistResult
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
                                                        child: SvgPicture.asset(
                                                          'assets/images/Vector_(1).svg',
                                                          width: 10,
                                                          height: 9,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    if (FFAppState()
                                                            .isWishlist ==
                                                        true)
                                                      InkWell(
                                                        onTap: () async {
                                                          _model.removeWishlistResult =
                                                              await UmaruMallGroup
                                                                  .removeWishlistCall
                                                                  .call(
                                                            userId:
                                                                getJsonField(
                                                              FFAppState()
                                                                  .userdata,
                                                              r'''$.id''',
                                                            ),
                                                            productId:
                                                                getJsonField(
                                                              bestsellerItem,
                                                              r'''$.id''',
                                                            ),
                                                            token: FFAppState()
                                                                .token,
                                                          );
                                                          if (getJsonField(
                                                                (_model.addwishlistResult
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.status''',
                                                              ) ==
                                                              '1') {
                                                            setState(() {
                                                              FFAppState()
                                                                      .isWishlist =
                                                                  false;
                                                            });
                                                            ScaffoldMessenger
                                                                    .of(context)
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
                                                            ScaffoldMessenger
                                                                    .of(context)
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
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: InkWell(
                            onTap: () async {
                              context.pushNamed('AllcategoryShopPage');
                            },
                            child: Image.asset(
                              'assets/images/6a05df173eb166ed04da736727a3aa29.png',
                              width: double.infinity,
                              height: 152.4,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 31, 0, 18),
                              child: Text(
                                'New Arrivals',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF0F3253),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: 500,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Builder(
                            builder: (context) {
                              final newArrivalChild =
                                  FFAppState().products.toList();
                              return Container(
                                width: double.infinity,
                                height: 200,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 50),
                                      child: PageView.builder(
                                        controller:
                                            _model.pageViewController1 ??=
                                                PageController(
                                                    initialPage: min(
                                                        0,
                                                        newArrivalChild.length -
                                                            1)),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: newArrivalChild.length,
                                        itemBuilder:
                                            (context, newArrivalChildIndex) {
                                          final newArrivalChildItem =
                                              newArrivalChild[
                                                  newArrivalChildIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 0, 15, 0),
                                            child: Builder(
                                              builder: (context) {
                                                final aa = functions
                                                    .getproduct(
                                                        UmaruMallGroup.homeCall
                                                            .newarrival(
                                                              (_model.homeResuly
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!
                                                            .toList(),
                                                        newArrivalChildIndex)
                                                    .toList();
                                                return GridView.builder(
                                                  padding: EdgeInsets.zero,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 10,
                                                    mainAxisSpacing: 10,
                                                    childAspectRatio: 1,
                                                  ),
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: aa.length,
                                                  itemBuilder:
                                                      (context, aaIndex) {
                                                    final aaItem = aa[aaIndex];
                                                    return Stack(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(14,
                                                                      0, 0, 0),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'product_Detail',
                                                                queryParams: {
                                                                  'productID':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      aaItem,
                                                                      r'''$.id''',
                                                                    ),
                                                                    ParamType
                                                                        .int,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        5,
                                                                    color: Color(
                                                                        0x12000000),
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            0),
                                                                    spreadRadius:
                                                                        1,
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            25,
                                                                            10,
                                                                            25,
                                                                            0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          100,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        getJsonField(
                                                                          aaItem,
                                                                          r'''$.image''',
                                                                        ),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            18,
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
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              aaItem,
                                                                              r'''$.name''',
                                                                            ).toString().maybeHandleOverflow(
                                                                                  maxChars: 25,
                                                                                  replacement: '…',
                                                                                ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            maxLines:
                                                                                1,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
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
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              5,
                                                                              4,
                                                                              5,
                                                                              5),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            getJsonField(
                                                                              aaItem,
                                                                              r'''$.price''',
                                                                            ).toString(),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: Color(0xFF050404),
                                                                                  fontSize: 10,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              'FCFA',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    fontSize: 10,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.78, 0.14),
                                                          child: Container(
                                                            width: 24,
                                                            height: 24,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius: 2,
                                                                  color: Color(
                                                                      0x3E000000),
                                                                  offset:
                                                                      Offset(0,
                                                                          -1),
                                                                )
                                                              ],
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                if (FFAppState()
                                                                        .isWishlist ==
                                                                    false)
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      _model.addwishlistResultt = await UmaruMallGroup
                                                                          .addToWishlistCall
                                                                          .call(
                                                                        userId:
                                                                            getJsonField(
                                                                          FFAppState()
                                                                              .userdata,
                                                                          r'''$.id''',
                                                                        ),
                                                                        productId:
                                                                            getJsonField(
                                                                          aaItem,
                                                                          r'''$.id''',
                                                                        ),
                                                                      );
                                                                      if (getJsonField(
                                                                            aaItem,
                                                                            r'''$.status''',
                                                                          ) ==
                                                                          '1') {
                                                                        setState(
                                                                            () {
                                                                          FFAppState().isWishlist =
                                                                              true;
                                                                        });
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              getJsonField(
                                                                                aaItem,
                                                                                r'''$.message''',
                                                                              ).toString(),
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).textColor,
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              getJsonField(
                                                                                aaItem,
                                                                                r'''$.message''',
                                                                              ).toString(),
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).textColor,
                                                                          ),
                                                                        );
                                                                      }

                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      'assets/images/Vector_(1).svg',
                                                                      width: 10,
                                                                      height: 9,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                if (FFAppState()
                                                                        .isWishlist ==
                                                                    true)
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      _model.removeWishlistResultt = await UmaruMallGroup
                                                                          .removeWishlistCall
                                                                          .call(
                                                                        userId:
                                                                            getJsonField(
                                                                          FFAppState()
                                                                              .userdata,
                                                                          r'''$.id''',
                                                                        ),
                                                                        productId:
                                                                            getJsonField(
                                                                          aaItem,
                                                                          r'''$.id''',
                                                                        ),
                                                                        token: FFAppState()
                                                                            .token,
                                                                      );
                                                                      if (getJsonField(
                                                                            aaItem,
                                                                            r'''$.status''',
                                                                          ) ==
                                                                          '1') {
                                                                        setState(
                                                                            () {
                                                                          FFAppState().isWishlist =
                                                                              false;
                                                                        });
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              getJsonField(
                                                                                aaItem,
                                                                                r'''$.message''',
                                                                              ).toString(),
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).textColor,
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              getJsonField(
                                                                                aaItem,
                                                                                r'''$.message''',
                                                                              ).toString(),
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).textColor,
                                                                          ),
                                                                        );
                                                                      }

                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/love.png',
                                                                      width: 10,
                                                                      height: 9,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0.7),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 10),
                                        child: smooth_page_indicator
                                            .SmoothPageIndicator(
                                          controller: _model
                                                  .pageViewController1 ??=
                                              PageController(
                                                  initialPage: min(
                                                      0,
                                                      newArrivalChild.length -
                                                          1)),
                                          count: newArrivalChild.length,
                                          axisDirection: Axis.horizontal,
                                          onDotClicked: (i) {
                                            _model.pageViewController1!
                                                .animateToPage(
                                              i,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                          },
                                          effect: smooth_page_indicator
                                              .ExpandingDotsEffect(
                                            expansionFactor: 3,
                                            spacing: 8,
                                            radius: 16,
                                            dotWidth: 12,
                                            dotHeight: 9,
                                            dotColor: Color(0xFF8EC2E0),
                                            activeDotColor: Color(0xFF1C86C2),
                                            paintStyle: PaintingStyle.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
                              child: Text(
                                'On sale Products',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF0F3253),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: 500,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Builder(
                            builder: (context) {
                              final proList = FFAppState().products2.toList();
                              return Container(
                                width: double.infinity,
                                height: 200,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 50),
                                      child: PageView.builder(
                                        controller: _model
                                                .pageViewController2 ??=
                                            PageController(
                                                initialPage:
                                                    min(0, proList.length - 1)),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: proList.length,
                                        itemBuilder: (context, proListIndex) {
                                          final proListItem =
                                              proList[proListIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 0, 15, 0),
                                            child: Builder(
                                              builder: (context) {
                                                final cc = functions
                                                    .getproduct(
                                                        UmaruMallGroup.homeCall
                                                            .saleProduct(
                                                              (_model.homeResuly
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!
                                                            .toList(),
                                                        proListIndex)
                                                    .toList();
                                                return GridView.builder(
                                                  padding: EdgeInsets.zero,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 10,
                                                    mainAxisSpacing: 10,
                                                    childAspectRatio: 1,
                                                  ),
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: cc.length,
                                                  itemBuilder:
                                                      (context, ccIndex) {
                                                    final ccItem = cc[ccIndex];
                                                    return Stack(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(14,
                                                                      0, 0, 0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius: 5,
                                                                  color: Color(
                                                                      0x12000000),
                                                                  offset:
                                                                      Offset(
                                                                          0, 0),
                                                                  spreadRadius:
                                                                      1,
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          25,
                                                                          10,
                                                                          25,
                                                                          0),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'product_Detail',
                                                                        queryParams:
                                                                            {
                                                                          'productID':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              ccItem,
                                                                              r'''$.id''',
                                                                            ),
                                                                            ParamType.int,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          100,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        getJsonField(
                                                                          ccItem,
                                                                          r'''$.image''',
                                                                        ),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            18,
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
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              ccItem,
                                                                              r'''$.name''',
                                                                            ).toString().maybeHandleOverflow(
                                                                                  maxChars: 25,
                                                                                  replacement: '…',
                                                                                ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            maxLines:
                                                                                1,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
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
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            4,
                                                                            5,
                                                                            5),
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
                                                                            ccItem,
                                                                            r'''$.price''',
                                                                          ).toString(),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Color(0xFF050404),
                                                                                fontSize: 10,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            'FCFA',
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontSize: 10,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.78, 0.14),
                                                          child: Container(
                                                            width: 24,
                                                            height: 24,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius: 2,
                                                                  color: Color(
                                                                      0x3E000000),
                                                                  offset:
                                                                      Offset(0,
                                                                          -1),
                                                                )
                                                              ],
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                if (FFAppState()
                                                                        .isWishlist ==
                                                                    false)
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      _model.addwishlistResult1 = await UmaruMallGroup
                                                                          .addToWishlistCall
                                                                          .call(
                                                                        userId:
                                                                            getJsonField(
                                                                          FFAppState()
                                                                              .userdata,
                                                                          r'''$.id''',
                                                                        ),
                                                                        productId:
                                                                            getJsonField(
                                                                          ccItem,
                                                                          r'''$.id''',
                                                                        ),
                                                                      );
                                                                      if (getJsonField(
                                                                            ccItem,
                                                                            r'''$.status''',
                                                                          ) ==
                                                                          '1') {
                                                                        setState(
                                                                            () {
                                                                          FFAppState().isWishlist =
                                                                              true;
                                                                        });
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              getJsonField(
                                                                                (_model.addwishlistResult1?.jsonBody ?? ''),
                                                                                r'''$.message''',
                                                                              ).toString(),
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).textColor,
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              getJsonField(
                                                                                ccItem,
                                                                                r'''$.message''',
                                                                              ).toString(),
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).textColor,
                                                                          ),
                                                                        );
                                                                      }

                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      'assets/images/Vector_(1).svg',
                                                                      width: 10,
                                                                      height: 9,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                if (FFAppState()
                                                                        .isWishlist ==
                                                                    true)
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      _model.removeWishlistResult1 = await UmaruMallGroup
                                                                          .removeWishlistCall
                                                                          .call(
                                                                        userId:
                                                                            getJsonField(
                                                                          FFAppState()
                                                                              .userdata,
                                                                          r'''$.id''',
                                                                        ),
                                                                        productId:
                                                                            getJsonField(
                                                                          ccItem,
                                                                          r'''$.id''',
                                                                        ),
                                                                        token: FFAppState()
                                                                            .token,
                                                                      );
                                                                      if (getJsonField(
                                                                            ccItem,
                                                                            r'''$.status''',
                                                                          ) ==
                                                                          '1') {
                                                                        setState(
                                                                            () {
                                                                          FFAppState().isWishlist =
                                                                              false;
                                                                        });
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              getJsonField(
                                                                                ccItem,
                                                                                r'''$.message''',
                                                                              ).toString(),
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).textColor,
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              getJsonField(
                                                                                ccItem,
                                                                                r'''$.message''',
                                                                              ).toString(),
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).textColor,
                                                                          ),
                                                                        );
                                                                      }

                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/love.png',
                                                                      width: 10,
                                                                      height: 9,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0.7),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 10),
                                        child: smooth_page_indicator
                                            .SmoothPageIndicator(
                                          controller: _model
                                                  .pageViewController2 ??=
                                              PageController(
                                                  initialPage: min(
                                                      0, proList.length - 1)),
                                          count: proList.length,
                                          axisDirection: Axis.horizontal,
                                          onDotClicked: (i) {
                                            _model.pageViewController2!
                                                .animateToPage(
                                              i,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                          },
                                          effect: smooth_page_indicator
                                              .ExpandingDotsEffect(
                                            expansionFactor: 3,
                                            spacing: 8,
                                            radius: 16,
                                            dotWidth: 12,
                                            dotHeight: 9,
                                            dotColor: Color(0xFF8EC2E0),
                                            activeDotColor: Color(0xFF1C86C2),
                                            paintStyle: PaintingStyle.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                if (_model.isLoading)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    child: custom_widgets.CustomLoader(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
