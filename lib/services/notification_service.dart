import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static Future<void> initializeNotification() async {
    await AwesomeNotifications().initialize(
    null,
      [
        NotificationChannel(
          channelGroupKey: 'high_importance_channel',
          channelKey: 'high_importance_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          onlyAlertOnce: true,
          playSound: true,
          criticalAlerts: true,
        )
      ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'high_importance_channel_group',
          channelGroupName: 'Group 1',
        )
      ],
      debug: true,
    );

    await AwesomeNotifications().isNotificationAllowed().then(
          (isAllowed) async {
        if (!isAllowed) {
          await AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );

    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  /// Use this method to detect when a new notification or a schedule is created
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint('onNotificationCreatedMethod');
  }

  /// Use this method to detect every time that a new notification is displayed
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint('onNotificationDisplayedMethod');
  }

  /// Use this method to detect if the user dismissed a notification
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    debugPrint('onDismissActionReceivedMethod');
  }

  /// Use this method to detect when the user taps on a notification or action button
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    debugPrint('onActionReceivedMethod');
    final payload = receivedAction.payload ?? {};
    if (payload["navigate"] == "true") {
      // MainApp.navigatorKey.currentState?.push(
      //   MaterialPageRoute(
      //     builder: (_) => const SecondScreen(),
      //   ),
      // );
    }
  }

  static Future<void> showNotification({
    required final String title,
    required final String body,
    final String? summary,
    final Map<String, String>? payload,
    final ActionType actionType = ActionType.Default,
    final NotificationLayout notificationLayout = NotificationLayout.Default,
    final NotificationCategory? category,
    final String? bigPicture,
    final List<NotificationActionButton>? actionButtons,
    final bool scheduled = false,
    final int? interval,
  }) async {
    assert(!scheduled || (scheduled && interval != null));

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1,
        channelKey: 'high_importance_channel',
        title: title,
        body: body,
        actionType: actionType,
        notificationLayout: notificationLayout,
        summary: summary,
        category: category,
        payload: payload,
        bigPicture: bigPicture,
      ),
      actionButtons: actionButtons,
      schedule: scheduled
          ? NotificationInterval(
        interval: interval,
        timeZone:
        await AwesomeNotifications().getLocalTimeZoneIdentifier(),
        preciseAlarm: true,
      )
          : null,
    );
  }
}










//-----------Implementation of all Notification---------------------

// import 'package:awesome_notification/services/notification_service.dart';
// import 'package:awesome_notification/widgets/notification_button.dart';
// import 'package:awesome_notification/widgets/top_bar.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: Container(
//         decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Theme.of(context).primaryColor,
//                 Colors.grey[200]!,
//               ],
//             )),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const TopBar(title: 'Awesome Notification'),
//             NotificationButton(
//               text: "Normal Notification",
//               onPressed: () async {
//                 await NotificationService.showNotification(
//                   title: "Title of the notification",
//                   body: "Body of the notification",
//                 );
//               },
//             ),
//             NotificationButton(
//               text: "Notification With Summary",
//               onPressed: () async {
//                 await NotificationService.showNotification(
//                   title: "Title of the notification",
//                   body: "Body of the notification",
//                   summary: "Small Summary",
//                   notificationLayout: NotificationLayout.Inbox,
//                 );
//               },
//             ),
//             NotificationButton(
//               text: "Progress Bar Notification",
//               onPressed: () async {
//                 await NotificationService.showNotification(
//                   title: "Title of the notification",
//                   body: "Body of the notification",
//                   summary: "Small Summary",
//                   notificationLayout: NotificationLayout.ProgressBar,
//                 );
//               },
//             ),
//             NotificationButton(
//               text: "Message Notification",
//               onPressed: () async {
//                 await NotificationService.showNotification(
//                   title: "Title of the notification",
//                   body: "Body of the notification",
//                   summary: "Small Summary",
//                   notificationLayout: NotificationLayout.Messaging,
//                 );
//               },
//             ),
//             NotificationButton(
//               text: "Big Image Notification",
//               onPressed: () async {
//                 await NotificationService.showNotification(
//                   title: "Title of the notification",
//                   body: "Body of the notification",
//                   summary: "Small Summary",
//                   notificationLayout: NotificationLayout.BigPicture,
//                   bigPicture:
//                   "https://files.tecnoblog.net/wp-content/uploads/2019/09/emoji.jpg",
//                 );
//               },
//             ),
//             NotificationButton(
//               text: "Action Buttons Notification",
//               onPressed: () async {
//                 await NotificationService.showNotification(
//                     title: "Title of the notification",
//                     body: "Body of the notification",
//                     payload: {
//                       "navigate": "true",
//                     },
//                     actionButtons: [
//                       NotificationActionButton(
//                         key: 'check',
//                         label: 'Check it out',
//                         actionType: ActionType.SilentAction,
//                         color: Colors.green,
//                       )
//                     ]);
//               },
//             ),
//             NotificationButton(
//               text: "Scheduled Notification",
//               onPressed: () async {
//                 await NotificationService.showNotification(
//                   title: "Scheduled Notification",
//                   body: "Notification was fired after 5 seconds",
//                   scheduled: true,
//                   interval: 5,
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//



