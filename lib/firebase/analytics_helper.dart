import 'package:firebase_analytics/firebase_analytics.dart';

class MyAnalyticsHelper {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  Future<void> logEvent(_val) async {
    await analytics
        .logEvent(name: "${_val}_click", parameters: {"Value": _val});
    print("Event Sent");
  }

  Future<void> testSetUserId(_value) async {
    await analytics.setUserId(id: _value.toString());
    print("setUserId succeeded");
  }
}
