// repositories/notification_repo.dart
import '../../../data/network/network_api_service.dart';
import '../../../data/network/network_helper.dart';
import '../../../data/repsonse/api_response.dart';
import '../../../models/notification/notification_model.dart';
import '../../../utils/helper/helper.dart';

class NotificationRepo {
  final NetworkApiServices _apiService;

  NotificationRepo(this._apiService);

  Future<ApiResponse<List<NotificationModel>>> getNotificationsData({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final selected = RadioSelectionManager.getSelectedValue();

      switch (selected) {
        case 0:
          return await getNotificationApiData();
        case 1:
          return await getNotificationDummyData();
        default:
          throw Exception("Invalid data source selected");
      }
    } catch (e) {
      return ApiResponse.error("Failed to load notifications: $e");
    }
  }

  Future<ApiResponse<List<NotificationModel>>> getNotificationApiData() {
    return NetworkHelper.handleApi<List<NotificationModel>>(
      apiCall: _apiService.getApi("notifications"),
      mapSuccess: (json) {
        final list = json is List
            ? json
            : (json as Map<String, dynamic>)['data'] as List;
        return list.map<NotificationModel>((e) => NotificationModel.fromJson(e)).toList();
      },
    );
  }

  Future<ApiResponse<List<NotificationModel>>> getNotificationDummyData() async {
    await Future.delayed(const Duration(seconds: 1)); // simulate API delay

    return ApiResponse.completed([
      // Today's notifications
      NotificationModel(
        id: 1,
        title: "30% Special Discount!",
        description: "Special promotion only valid today.",
        icon: "local_offer",
        dateTime: DateTime.now(),
        isRead: false,
      ),

      // Yesterday's notifications
      NotificationModel(
        id: 2,
        title: "Top Up E-wallet Successfully!",
        description: "You have top up your e-wallet.",
        icon: "account_balance_wallet",
        dateTime: DateTime.now().subtract(Duration(days: 1)),
        isRead: true,
      ),
      NotificationModel(
        id: 3,
        title: "New Service Available!",
        description: "Now you can track order in real-time.",
        icon: "track_changes",
        dateTime: DateTime.now().subtract(Duration(days: 1)),
        isRead: true,
      ),

      // Older notifications
      NotificationModel(
        id: 4,
        title: "Credit Card Connected!",
        description: "Credit card has been linked.",
        icon: "credit_card",
        dateTime: DateTime(2023, 6, 7, 16, 45),
        isRead: true,
      ),
      NotificationModel(
        id: 5,
        title: "Account Setup Successfully!",
        description: "Your account has been created.",
        icon: "person",
        dateTime: DateTime(2023, 6, 7, 9, 20),
        isRead: true,
      ),
      NotificationModel(
        id: 6,
        title: "Order Shipped!",
        description: "Your order #12345 has been shipped.",
        icon: "local_shipping",
        dateTime: DateTime(2023, 6, 6, 14, 30),
        isRead: true,
      ),
      NotificationModel(
        id: 7,
        title: "Payment Received",
        description: "Payment of \$150.00 has been received.",
        icon: "payment",
        dateTime: DateTime(2023, 6, 5, 11, 15),
        isRead: true,
      ),
    ]);
  }


}