 
class NotificationHome {
  static int _notifications = 1;
  static int _assignment = 0;

  static int get notifications => _notifications;
  static set notifications(int value) {
    _notifications = value;
  }

  static int get assignment => _assignment;
  static set assignment(int value) {
    _assignment = value;
  }
}
 
  