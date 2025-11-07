// import '../../../../../data/response/api_response.dart';
// import '../../../../../models/base/error_model.dart';
//
// /// Utility for handling any API response in a uniform way.
// abstract class NetworkHelper {
//   /// Generic wrapper for an API call.
//   /// - [apiCall]  The awaited Future that returns raw JSON (Map or List).
//   /// - [isError]  Returns an error string if the payload is an error; null otherwise.
//   /// - [mapSuccess] Converts a successful payload to the desired type [T].
//   static Future<ApiResponse<T>> handleApi<T>({
//     required Future<dynamic> apiCall,
//     required T Function(dynamic json) mapSuccess,
//   }) async {
//     try {
//       final json = await apiCall;
//
//       // 1 ▪ check for error envelope
//       final errMsg = defaultErrorChecker(json);
//       if (errMsg != null) return ApiResponse.error(errMsg);
//
//       // 2 ▪ map success payload
//       final result = mapSuccess(json);
//       return ApiResponse.completed(result);
//     } catch (e) {
//       return ApiResponse.error(e.toString());
//     }
//   }
//
//   /// Default error checker for payloads that use `ErrorResponseModel`.
//   static String? defaultErrorChecker(dynamic json) {
//     if (json is Map<String, dynamic>) {
//       final err = ErrorResponseModel.fromJson(json);
//       final hasErr = err.successful == false || (err.errors?.isNotEmpty ?? false);
//       if (hasErr) return err.errors?.join('\n') ?? 'Unknown server error';
//     }
//     return null; // not an error
//   }
// }



import '../../models/error/error_model.dart';
import '../repsonse/api_response.dart';

abstract class NetworkHelper {
  /// Generic wrapper for an API call.
  /// - [apiCall]  The awaited Future that returns either raw JSON (Map/List)
  ///               or an already-constructed ApiResponse<T> (e.g. in dummy data).
  /// - [mapSuccess] Converts a successful payload to the desired type [T].
  static Future<ApiResponse<T>> handleApi<T>({
    required Future<dynamic> apiCall,
    required T Function(dynamic json) mapSuccess,
  }) async {
    try {
      final result = await apiCall;

      // ✅ If result is already an ApiResponse<T> (e.g. from mock), return it directly
      if (result is ApiResponse<T>) {
        return result;
      }

      // 1 ▪ Check for API-defined error envelope
      final errMsg = defaultErrorChecker(result);
      if (errMsg != null) return ApiResponse.error(errMsg);

      // 2 ▪ Map success payload
      final mapped = mapSuccess(result);
      return ApiResponse.completed(mapped);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  /// Default error checker for payloads that use `ErrorResponseModel`.
  static String? defaultErrorChecker(dynamic json) {
    if (json is Map<String, dynamic>) {
      final err = ErrorResponseModel.fromJson(json);
      final hasErr = err.successful == false || (err.errors?.isNotEmpty ?? false);
      if (hasErr) return err.errors?.join('\n') ?? 'Unknown server error';
    }
    return null; // ✅ Not an error
  }
}
