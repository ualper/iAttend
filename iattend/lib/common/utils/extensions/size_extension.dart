import 'package:iattend/common/utils/screen_size_util.dart';

extension SizeExtension on num {
  /// Screen Width Extension Value
  double get sw => ScreenSizeUtil.screenWidth * this;

  /// Screen Height Extension Value
  double get sh => ScreenSizeUtil.screenHeight * this;
}
