import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start UmaruMall Group Code

class UmaruMallGroup {
  static String baseUrl = 'https://www.umarudropshippingdev.gcc-demo.com';
  static Map<String, String> headers = {
    'Content_type': 'application/json',
  };
  static RegisterAPICall registerAPICall = RegisterAPICall();
  static ForgotPasswordAPICall forgotPasswordAPICall = ForgotPasswordAPICall();
  static LogInAPICall logInAPICall = LogInAPICall();
  static BearerTOKENGenerationCall bearerTOKENGenerationCall =
      BearerTOKENGenerationCall();
  static ChangePasswordAPICall changePasswordAPICall = ChangePasswordAPICall();
  static AllCategoryListCall allCategoryListCall = AllCategoryListCall();
  static CategoryProductCall categoryProductCall = CategoryProductCall();
  static ProductIDCall productIDCall = ProductIDCall();
  static ProfileViewAPICall profileViewAPICall = ProfileViewAPICall();
  static ProfileEditCall profileEditCall = ProfileEditCall();
  static OrderlistAPICall orderlistAPICall = OrderlistAPICall();
  static OrderDetailsCall orderDetailsCall = OrderDetailsCall();
  static AddressApiCall addressApiCall = AddressApiCall();
  static EditAddressAPICall editAddressAPICall = EditAddressAPICall();
  static AddToCartCall addToCartCall = AddToCartCall();
  static CartListCall cartListCall = CartListCall();
  static PlaceOrderForCODCall placeOrderForCODCall = PlaceOrderForCODCall();
  static VariationProductAPICall variationProductAPICall =
      VariationProductAPICall();
  static ShowAllWishlistCall showAllWishlistCall = ShowAllWishlistCall();
  static AddToWishlistCall addToWishlistCall = AddToWishlistCall();
  static RemoveWishlistCall removeWishlistCall = RemoveWishlistCall();
  static HomeCall homeCall = HomeCall();
  static ReviewsAPICall reviewsAPICall = ReviewsAPICall();
}

class RegisterAPICall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? password = '',
    String? phone = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Register API',
      apiUrl: '${UmaruMallGroup.baseUrl}/wp-json/api/v1/register',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruMallGroup.headers,
      },
      params: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ForgotPasswordAPICall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Forgot Password API',
      apiUrl: '${UmaruMallGroup.baseUrl}/wp-json/api/v1/forget-password',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruMallGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'email': email,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LogInAPICall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'LogIn API',
      apiUrl: '${UmaruMallGroup.baseUrl}/wp-json/api/v1/login',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruMallGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'username': username,
        'password': password,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class BearerTOKENGenerationCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Bearer TOKEN generation',
      apiUrl: '${UmaruMallGroup.baseUrl}/wp-json/jwt-auth/v1/token',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruMallGroup.headers,
      },
      params: {
        'username': "testing1@yopmail.com",
        'password': "test@12345",
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ChangePasswordAPICall {
  Future<ApiCallResponse> call({
    int? userId,
    String? oldPassword = '',
    String? newPassword = '',
    String? confirmPassword = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Change Password API',
      apiUrl: '${UmaruMallGroup.baseUrl}/wp-json/api/v1/change-password',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruMallGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'user_id': userId,
        'old_password': oldPassword,
        'new_password': newPassword,
        'confirm_password': confirmPassword,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AllCategoryListCall {
  Future<ApiCallResponse> call({
    int? categoryId,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'All Category List',
      apiUrl: '${UmaruMallGroup.baseUrl}/wp-json/api/v1/category-list',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruMallGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'category_id': categoryId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic categorylist(dynamic response) => getJsonField(
        response,
        r'''$.category_list''',
        true,
      );
}

class CategoryProductCall {
  Future<ApiCallResponse> call({
    int? categoryId,
    int? page,
    int? minPrice,
    int? maxPrice,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Category Product',
      apiUrl: '${UmaruMallGroup.baseUrl}/wp-json/api/v1/category-product',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruMallGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'category_id': categoryId,
        'page': page,
        'min_price': minPrice,
        'max_price': maxPrice,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic result(dynamic response) => getJsonField(
        response,
        r'''$.result''',
        true,
      );
}

class ProductIDCall {
  Future<ApiCallResponse> call({
    int? productId,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Product ID',
      apiUrl: '${UmaruMallGroup.baseUrl}/wp-json/api/v1/product-details',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruMallGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'product_id': productId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic result(dynamic response) => getJsonField(
        response,
        r'''$.result''',
      );
}

class ProfileViewAPICall {
  Future<ApiCallResponse> call({
    int? userId,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Profile view API',
      apiUrl: '${UmaruMallGroup.baseUrl}/wp-json/api/v1/view-profile',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruMallGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'user_id': userId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ProfileEditCall {
  Future<ApiCallResponse> call({
    int? userId,
    String? firstName = '',
    String? lastName = '',
    String? displayName = '',
    String? email = '',
    String? phone = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Profile Edit',
      apiUrl: '${UmaruMallGroup.baseUrl}/wp-json/api/v1/edit-profile',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruMallGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'user_id': userId,
        'first_name': firstName,
        'last_name': lastName,
        'display_name': displayName,
        'email': email,
        'phone': phone,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class OrderlistAPICall {
  Future<ApiCallResponse> call({
    int? userId,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Orderlist API',
      apiUrl: '${UmaruMallGroup.baseUrl}/wp-json/api/v1/order-list',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruMallGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'user_id': userId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic orderlist(dynamic response) => getJsonField(
        response,
        r'''$.order_list''',
        true,
      );
}

class OrderDetailsCall {
  Future<ApiCallResponse> call({
    int? userId,
    int? orderId,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Order Details',
      apiUrl: '${UmaruMallGroup.baseUrl}/wp-json/api/v1/order-details',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruMallGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'user_id': userId,
        'order_id': orderId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic lineItem(dynamic response) => getJsonField(
        response,
        r'''$.order_data.line_items''',
        true,
      );
  dynamic shippinginfo(dynamic response) => getJsonField(
        response,
        r'''$.order_data.shipping_address''',
      );
}

class AddressApiCall {
  Future<ApiCallResponse> call({
    int? userId,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Address Api',
      apiUrl: '${UmaruMallGroup.baseUrl}/wp-json/api/v1/address-list',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruMallGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'user_id': userId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class EditAddressAPICall {
  Future<ApiCallResponse> call({
    int? userId,
    String? firstName = '',
    String? lastName = '',
    String? company = '',
    String? address1 = '',
    String? address2 = '',
    String? city = '',
    String? state = '',
    String? country = '',
    int? postcode,
    String? email = '',
    String? phone = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Edit Address API',
      apiUrl: '${UmaruMallGroup.baseUrl}/wp-json/api/v1/update-address',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruMallGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'user_id': userId,
        'first_name': firstName,
        'last_name': lastName,
        'company': company,
        'address_1': address1,
        'address_2': address2,
        'city': city,
        'state': state,
        'country': country,
        'postcode': postcode,
        'email': email,
        'phone': phone,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddToCartCall {
  Future<ApiCallResponse> call({
    int? productId,
    int? quantity,
    int? userId,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Add to cart',
      apiUrl: '${UmaruMallGroup.baseUrl}/wp-json/api/v1/add-to-cart',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruMallGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'product_id': productId,
        'quantity': quantity,
        'user_id': userId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CartListCall {
  Future<ApiCallResponse> call({
    int? userId,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Cart list',
      apiUrl: '${UmaruMallGroup.baseUrl}/wp-json/api/v1/cart-list',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruMallGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'user_id': userId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic cartList(dynamic response) => getJsonField(
        response,
        r'''$.cart_list''',
        true,
      );
}

class PlaceOrderForCODCall {
  Future<ApiCallResponse> call({
    int? userId,
    String? paymentMethod = '',
    String? paymentMethodTitle = '',
    String? newVariable = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Place order For COD',
      apiUrl: '${UmaruMallGroup.baseUrl}/wp-json/api/v1/place-order',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruMallGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'user_id': userId,
        'payment_method': paymentMethod,
        'payment_method_title': paymentMethodTitle,
        'status': newVariable,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class VariationProductAPICall {
  Future<ApiCallResponse> call({
    int? productId,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Variation Product API',
      apiUrl: '${UmaruMallGroup.baseUrl}/wp-json/api/v1/product-details',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruMallGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'product_id': productId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ShowAllWishlistCall {
  Future<ApiCallResponse> call({
    int? userId,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Show all Wishlist',
      apiUrl: '${UmaruMallGroup.baseUrl}/wp-json/api/v1/wishlist-list',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruMallGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'user_id': userId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic wishlist(dynamic response) => getJsonField(
        response,
        r'''$.wishlist''',
        true,
      );
}

class AddToWishlistCall {
  Future<ApiCallResponse> call({
    int? userId,
    int? productId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Add to Wishlist',
      apiUrl: '${UmaruMallGroup.baseUrl}/wp-json/api/v1/wishlist-add',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruMallGroup.headers,
      },
      params: {
        'user_id': userId,
        'product_id': productId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RemoveWishlistCall {
  Future<ApiCallResponse> call({
    int? userId,
    int? productId,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Remove Wishlist',
      apiUrl: '${UmaruMallGroup.baseUrl}/wp-json/api/v1/wishlist-remove',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruMallGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'user_id': userId,
        'product_id': productId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class HomeCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Home',
      apiUrl: '${UmaruMallGroup.baseUrl}/wp-json/api/v1/home',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruMallGroup.headers,
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic bestselling(dynamic response) => getJsonField(
        response,
        r'''$.best_sellling''',
        true,
      );
  dynamic newarrival(dynamic response) => getJsonField(
        response,
        r'''$.new_arrival''',
        true,
      );
  dynamic saleProduct(dynamic response) => getJsonField(
        response,
        r'''$.saleProduct''',
        true,
      );
}

class ReviewsAPICall {
  Future<ApiCallResponse> call({
    int? userId,
    int? productId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Reviews API',
      apiUrl:
          '${UmaruMallGroup.baseUrl}/wp-json/wc/v3/products/reviews?consumer_key=ck_57f24d115353944c4649fddd165b8aff72a2195e&consumer_secret=cs_a1ac3269229c0798b8d9da76276a64a9146f9dfb',
      callType: ApiCallType.GET,
      headers: {
        ...UmaruMallGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic reviewlist(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

/// End UmaruMall Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
