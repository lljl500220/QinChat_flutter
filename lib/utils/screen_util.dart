// screen_util.dart
class ScreenUtil {
  static bool shouldUsePortraitLayout(double width, double height, [double ratio = 1.5]) {
    if (width < 600) return true; // 如果屏幕宽度小于600像素，则总是采用竖屏布局
    // 否则，基于高宽比来判断
    return height / width > ratio;
  }
}
