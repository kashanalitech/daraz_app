import 'package:get/get.dart';

import '../../../data/repsonse/api_response.dart';
import '../../../data/repsonse/status.dart';
import '../../../models/notification/notification_model.dart';
import '../repo/notification_repo.dart';

// controllers/notification_controller.dart
class NotificationController extends GetxController {
  final NotificationRepo _repo = Get.find<NotificationRepo>();

  var notificationsResponse = ApiResponse<List<NotificationModel>>(Status.loading, null, null).obs;

  @override
  void onInit() {
    fetchNotificationsData();
    super.onInit();
  }

  Future<void> fetchNotificationsData() async {
    notificationsResponse.value = ApiResponse.loading();
    var response = await _repo.getNotificationsData();
    notificationsResponse.value = response;
  }

  String formatDate(DateTime? dateTime) {
    if (dateTime == null) return '';

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final notificationDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

    if (notificationDate == today) {
      return 'Today';
    } else if (notificationDate == yesterday) {
      return 'Yesterday';
    } else {
      final months = [
        'January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'
      ];
      return '${months[dateTime.month - 1]} ${dateTime.day}, ${dateTime.year}';
    }
  }

  Map<String, List<NotificationModel>> get groupedNotifications {
    final data = notificationsResponse.value.data ?? [];
    if (data.isEmpty) return {};

    // Sort newest → oldest
    data.sort((a, b) => b.dateTime!.compareTo(a.dateTime!));

    final Map<String, List<NotificationModel>> grouped = {};

    for (var n in data) {
      String heading = formatDate(n.dateTime);
      grouped.putIfAbsent(heading, () => []).add(n);
    }

    return grouped;
  }




  @override
  void onClose() {
    print("🧹 NotificationController destroyed");
    super.onClose();
  }
}