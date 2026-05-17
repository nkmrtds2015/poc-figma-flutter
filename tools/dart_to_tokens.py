#!/usr/bin/env python3
"""lib/theme/app_theme.dart → tokens.json 変換スクリプト (Flutter → Figma 方向)

app_theme.dart の AppColors クラスから色定数を読み取り tokens.json を更新する。
更新後の tokens.json を Figma の Token Studio プラグインで手動 import することで
Figma Variables に反映できる（無料プランの制約により手動 import が必要）。
"""

import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).parent.parent
THEME_FILE = ROOT / "lib" / "theme" / "app_theme.dart"
TOKENS_FILE = ROOT / "tokens.json"


def dart_color_to_hex(dart_color: str) -> str:
    """Color(0xFFRRGGBB) → #RRGGBB"""
    m = re.search(r"Color\(0xFF([0-9A-Fa-f]{6})\)", dart_color)
    if m:
        return f"#{m.group(1).upper()}"
    raise ValueError(f"Cannot parse color: {dart_color}")


def extract_colors_from_dart(dart_source: str) -> dict:
    """AppColors クラスから色定数を抽出する"""
    colors = {}
    pattern = re.compile(
        r"static\s+const\s+Color\s+(\w+)\s*=\s*(Color\(0xFF[0-9A-Fa-f]{6}\))\s*;"
    )
    for m in pattern.finditer(dart_source):
        name = m.group(1)
        color_expr = m.group(2)
        colors[name] = dart_color_to_hex(color_expr)
    return colors


def main():
    if not THEME_FILE.exists():
        print(f"ERROR: {THEME_FILE} not found", file=sys.stderr)
        sys.exit(1)
    if not TOKENS_FILE.exists():
        print(f"ERROR: {TOKENS_FILE} not found", file=sys.stderr)
        sys.exit(1)

    dart_source = THEME_FILE.read_text()
    new_colors = extract_colors_from_dart(dart_source)

    if not new_colors:
        print("ERROR: No colors found in AppColors class", file=sys.stderr)
        sys.exit(1)

    tokens = json.loads(TOKENS_FILE.read_text())
    existing_colors = tokens.get("color", {})

    changed = []
    for name, new_value in new_colors.items():
        if name in existing_colors:
            old_value = existing_colors[name].get("$value", "")
            if old_value != new_value:
                changed.append(f"  {name}: {old_value} → {new_value}")
                existing_colors[name]["$value"] = new_value
        else:
            # 新規トークン
            existing_colors[name] = {"$value": new_value, "$type": "color"}
            changed.append(f"  {name}: (new) {new_value}")

    tokens["color"] = existing_colors
    TOKENS_FILE.write_text(json.dumps(tokens, indent=2, ensure_ascii=False))

    if changed:
        print("✅ tokens.json を更新しました。変更点:")
        for c in changed:
            print(c)
        print()
        print("次のステップ: Figma の Token Studio プラグインで tokens.json を手動 import してください。")
    else:
        print("✅ 変更なし。tokens.json はすでに最新です。")


if __name__ == "__main__":
    main()
