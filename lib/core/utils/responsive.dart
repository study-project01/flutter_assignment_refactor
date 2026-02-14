import 'package:flutter/material.dart';

/// 반응형 디자인 breakpoint
/// - mobile: ~599
/// - tablet: 600~1023
/// - desktop: 1024~
class Breakpoints {
  static const double tablet = 600;
  static const double desktop = 1024;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < tablet;

  static bool isTablet(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return w >= tablet && w < desktop;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= desktop;

  static bool useBottomNav(BuildContext context) => isMobile(context);

  static bool useNavigationRail(BuildContext context) =>
      isTablet(context) || isDesktop(context);

  /// 데스크톱에서 컨텐츠 최대 너비
  static const double contentMaxWidth = 800;

  /// 로그인/회원가입 폼 최대 너비
  static const double formMaxWidth = 480;
}
