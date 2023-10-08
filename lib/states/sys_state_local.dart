import 'package:flutter/foundation.dart';

//这个类是用来管理系统状态的
class SysStateLocal extends ChangeNotifier {
  double sysWidth;
  double sysHeight;

  SysStateLocal({required this.sysWidth, required this.sysHeight});
}
