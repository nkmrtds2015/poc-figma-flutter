import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/card_widget.dart';

// Generated from Figma: Frame 1 (778x1259px)
// File key: WP1rgKnAzi23pGRGvcBQqG
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // Figma canvas is 778px wide — use as layout reference scale
  static const double _figmaWidth = 778;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scale = screenWidth / _figmaWidth;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenWidth,
          height: 1259 * scale,
          child: Stack(
            children: [
              // Rectangle 2: ヘッダー (x:107, y:61, 611x124, #0AFF0A)
              Positioned(
                left: 107 * scale,
                top: 61 * scale,
                child: FigmaCard(
                  color: AppColors.header,
                  width: 611 * scale,
                  height: 124 * scale,
                ),
              ),

              // タイトルテキスト (x:117, y:209, 295x118)
              Positioned(
                left: 117 * scale,
                top: 209 * scale,
                width: 295 * scale,
                height: 118 * scale,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'タイトル',
                    style: AppTextStyles.title.copyWith(
                      fontSize: 34 * scale,
                      letterSpacing: -0.68 * scale,
                    ),
                  ),
                ),
              ),

              // Rectangle 1/デフォルト (x:107, y:443, 541x385, #D9D9D9)
              Positioned(
                left: 107 * scale,
                top: 443 * scale,
                child: FigmaCard(
                  color: AppColors.cardDefault,
                  width: 541 * scale,
                  height: 385 * scale,
                ),
              ),

              // Rectangle 1/バリアント2 (x:84, y:874, 582x315, #FE0F0F)
              Positioned(
                left: 84 * scale,
                top: 874 * scale,
                child: FigmaCard(
                  color: AppColors.cardVariant,
                  width: 582 * scale,
                  height: 315 * scale,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
