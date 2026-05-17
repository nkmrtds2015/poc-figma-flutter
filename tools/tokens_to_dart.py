#!/usr/bin/env python3
"""tokens.json → lib/theme/app_theme.dart 変換スクリプト (Figma → Flutter 方向)"""

import json
import sys
from pathlib import Path

ROOT = Path(__file__).parent.parent
TOKENS_FILE = ROOT / "tokens.json"
OUTPUT_FILE = ROOT / "lib" / "theme" / "app_theme.dart"


def hex_to_dart_color(hex_color: str) -> str:
    hex_color = hex_color.lstrip("#")
    return f"Color(0xFF{hex_color.upper()})"


def main():
    if not TOKENS_FILE.exists():
        print(f"ERROR: {TOKENS_FILE} not found", file=sys.stderr)
        sys.exit(1)

    tokens = json.loads(TOKENS_FILE.read_text())
    colors = tokens.get("color", {})
    typography = tokens.get("typography", {})
    meta = tokens.get("$metadata", {})

    title_style = typography.get("title", {})
    font_family = title_style.get("fontFamily", {}).get("$value", "Inter")
    font_weight = title_style.get("fontWeight", {}).get("$value", 600)
    font_size = title_style.get("fontSize", {}).get("$value", 34)
    line_height = title_style.get("lineHeight", {}).get("$value", 1.1)
    letter_spacing = title_style.get("letterSpacing", {}).get("$value", -0.68)

    dart = f"""import 'package:flutter/material.dart';

// AUTO-GENERATED — DO NOT EDIT MANUALLY
// Source: tokens.json (Figma file: {meta.get('figmaFileKey', '')})
// Generated: {meta.get('generatedAt', '')}
// To regenerate: python3 tools/tokens_to_dart.py

class AppColors {{
"""
    for name, token in colors.items():
        value = token.get("$value", "#000000")
        desc = token.get("$description", "")
        comment = f"  // {desc}\n" if desc else ""
        dart += f"{comment}  static const Color {name} = {hex_to_dart_color(value)};\n"

    dart += f"""}}

class AppTextStyles {{
  static const TextStyle title = TextStyle(
    fontFamily: '{font_family}',
    fontWeight: FontWeight.w{font_weight},
    fontSize: {float(font_size)},
    height: {float(line_height)},
    letterSpacing: {float(letter_spacing)},
    color: AppColors.titleText,
  );
}}

class AppTheme {{
  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.light(
          primary: AppColors.header,
          surface: AppColors.background,
        ),
      );
}}
"""

    OUTPUT_FILE.parent.mkdir(parents=True, exist_ok=True)
    OUTPUT_FILE.write_text(dart)
    print(f"✅ Generated: {OUTPUT_FILE}")


if __name__ == "__main__":
    main()
