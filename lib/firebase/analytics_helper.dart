import 'package:firebase_analytics/firebase_analytics.dart';

class MyAnalyticsHelper {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  Future<void> logEvent({required String name, required String val}) async {
    await analytics.logEvent(name: "${name}_click", parameters: {"Value": val});
    print("Event Sent");
  }

  Future<void> testSetUserId(_value) async {
    await analytics.setUserId(id: _value.toString());
    print("setUserId succeeded");
  }
}
