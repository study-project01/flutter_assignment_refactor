import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/utils/responsive.dart';

/// 반응형 컨텐츠 래퍼
/// - 모바일: 전체 너비
/// - 태블릿/데스크톱: 최대 너비 제한, 가운데 정렬
class ResponsiveContainer extends StatelessWidget {
  const ResponsiveContainer({
    super.key,
    required this.child,
    this.maxWidth = Breakpoints.contentMaxWidth,
    this.padding,
  });

  final Widget child;
  final double maxWidth;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: padding != null ? Padding(padding: padding!, child: child) : child,
      ),
    );
  }
}
