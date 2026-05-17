import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/card_widget.dart';

// Generated from Figma: Frame 1 (1227x900px) — 横長2カラムレイアウト
// File key: WP1rgKnAzi23pGRGvcBQqG
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // Figma canvas is 1227px wide — use as layout reference scale
  static const double _figmaWidth = 1227;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scale = screenWidth / _figmaWidth;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenWidth,
          height: 900 * scale,
          child: Stack(
            children: [
              // タイトルテキスト (x:111, y:91, 295x118)
              Positioned(
                left: 111 * scale,
                top: 91 * scale,
                width: 295 * scale,
                height: 118 * scale,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'PoC - Figma - Flutter',
                    style: AppTextStyles.title.copyWith(
                      fontSize: 28 * scale,
                      letterSpacing: -0.56 * scale,
                    ),
                  ),
                ),
              ),

              // Rectangle 2: ヘッダー (x:434, y:85, 573x124, #0AFF0A)
              Positioned(
                left: 434 * scale,
                top: 85 * scale,
                child: FigmaCard(
                  color: AppColors.header,
                  width: 573 * scale,
                  height: 124 * scale,
                ),
              ),

              // Rectangle 1/デフォルト (x:40, y:396, 541x385, #D9D9D9)
              Positioned(
                left: 40 * scale,
                top: 396 * scale,
                child: FigmaCard(
                  color: AppColors.cardDefault,
                  width: 541 * scale,
                  height: 385 * scale,
                ),
              ),

              // Rectangle 1 (x:613, y:396, 542x385, #FE0F0F) — 横並び右カラム
              Positioned(
                left: 613 * scale,
                top: 396 * scale,
                child: FigmaCard(
                  color: AppColors.cardVariant,
                  width: 542 * scale,
                  height: 385 * scale,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
