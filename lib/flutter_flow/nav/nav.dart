import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Color(0xFFF5F5F5),
                child: Image.asset(
                  'assets/images/Umaru_Logo_Image.png',
                  fit: BoxFit.contain,
                ),
              ),
            )
          : NavBarPage(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Color(0xFFF5F5F5),
                    child: Image.asset(
                      'assets/images/Umaru_Logo_Image.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : NavBarPage(),
          routes: [
            FFRoute(
              name: 'SplashScreen',
              path: 'splashScreen',
              builder: (context, params) => SplashScreenWidget(),
            ),
            FFRoute(
              name: 'Home',
              path: 'home',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Home')
                  : HomeWidget(),
            ),
            FFRoute(
              name: 'Menu',
              path: 'menu',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Menu')
                  : MenuWidget(),
            ),
            FFRoute(
              name: 'category_Page1',
              path: 'categoryPage1',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'category_Page1')
                  : CategoryPage1Widget(),
            ),
            FFRoute(
              name: 'FilterPage',
              path: 'filterPage',
              builder: (context, params) => FilterPageWidget(),
            ),
            FFRoute(
              name: 'category_Page',
              path: 'categoryPage',
              builder: (context, params) => CategoryPageWidget(),
            ),
            FFRoute(
              name: 'SalesPage',
              path: 'salesPage',
              builder: (context, params) => SalesPageWidget(),
            ),
            FFRoute(
              name: 'WishList',
              path: 'wishList',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'WishList')
                  : WishListWidget(),
            ),
            FFRoute(
              name: 'product_Detail',
              path: 'productDetail',
              builder: (context, params) => ProductDetailWidget(
                id: params.getParam('id', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Cart_Page',
              path: 'cartPage',
              builder: (context, params) => CartPageWidget(),
            ),
            FFRoute(
              name: 'add_Address_Page',
              path: 'addAddressPage',
              builder: (context, params) => AddAddressPageWidget(),
            ),
            FFRoute(
              name: 'Shippinginfo_page',
              path: 'shippinginfoPage',
              builder: (context, params) => ShippinginfoPageWidget(),
            ),
            FFRoute(
              name: 'success_Screen',
              path: 'successScreen',
              builder: (context, params) => SuccessScreenWidget(),
            ),
            FFRoute(
              name: 'RegisterForm_Page',
              path: 'registerFormPage',
              builder: (context, params) => RegisterFormPageWidget(),
            ),
            FFRoute(
              name: 'LoginPage',
              path: 'loginPage',
              builder: (context, params) => LoginPageWidget(),
            ),
            FFRoute(
              name: 'forgot_Password1',
              path: 'forgotPassword1',
              builder: (context, params) => ForgotPassword1Widget(),
            ),
            FFRoute(
              name: 'forgot_Password',
              path: 'forgotPassword',
              builder: (context, params) => ForgotPasswordWidget(),
            ),
            FFRoute(
              name: 'orders_Page',
              path: 'ordersPage',
              builder: (context, params) => OrdersPageWidget(),
            ),
            FFRoute(
              name: 'order_Details',
              path: 'orderDetails',
              builder: (context, params) => OrderDetailsWidget(),
            ),
            FFRoute(
              name: 'menu_Page1',
              path: 'menuPage1',
              builder: (context, params) => MenuPage1Widget(),
            ),
            FFRoute(
              name: 'my_Account_Page',
              path: 'myAccountPage',
              builder: (context, params) => MyAccountPageWidget(),
            ),
            FFRoute(
              name: 'order_History',
              path: 'orderHistory',
              builder: (context, params) => OrderHistoryWidget(),
            ),
            FFRoute(
              name: 'order_Detail',
              path: 'orderDetail',
              builder: (context, params) => OrderDetailWidget(),
            ),
            FFRoute(
              name: 'review_Page',
              path: 'reviewPage',
              builder: (context, params) => ReviewPageWidget(),
            ),
            FFRoute(
              name: 'delivery_Address',
              path: 'deliveryAddress',
              builder: (context, params) => DeliveryAddressWidget(),
            ),
            FFRoute(
              name: 'shipping_Page',
              path: 'shippingPage',
              builder: (context, params) => ShippingPageWidget(),
            ),
            FFRoute(
              name: 'acc_detail',
              path: 'accDetail',
              builder: (context, params) => AccDetailWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
