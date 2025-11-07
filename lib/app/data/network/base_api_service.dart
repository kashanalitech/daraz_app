
abstract class BaseApiServices {
  Future<dynamic> getApi(String url);

  Future<dynamic> postApi(dynamic data, String url);

  Future<dynamic> putApiResponse(dynamic data,String url);
//
//   Future<dynamic> deleteApiResponse(String url);
//
// Future<dynamic> postApiMultiPartResponse(String url, List<XFile> files);
//
//   Future<dynamic> putApiResponse(dynamic data,String url);
//
//   Future<dynamic> deleteApiResponse(String url);
//
// Future<dynamic> postApiMultiPartResponse(String url, List<XFile> files);
}
