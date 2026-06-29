#!/bin/bash
# 一键推送到 GitHub 并开启 Pages 在线预览
set -e

REPO_NAME="h5-handwriting-signature"
cd "$(dirname "$0")"

if ! gh auth status &>/dev/null; then
  echo "请先登录 GitHub："
  echo "  gh auth login"
  echo ""
  echo "按提示选择：GitHub.com → HTTPS → Login with a web browser"
  exit 1
fi

USERNAME=$(gh api user -q .login)
echo "当前 GitHub 用户: $USERNAME"

# 创建远程仓库并推送（若已存在则只推送）
if ! git remote get-url origin &>/dev/null; then
  gh repo create "$REPO_NAME" --public --source=. --remote=origin --push
else
  git push -u origin main
fi

# 开启 GitHub Pages（从 main 分支根目录）
gh api -X POST "repos/${USERNAME}/${REPO_NAME}/pages" \
  -f build_type=legacy \
  -f 'source[branch]=main' \
  -f 'source[path]=/' 2>/dev/null || \
gh api -X PUT "repos/${USERNAME}/${REPO_NAME}/pages" \
  -f build_type=legacy \
  -f 'source[branch]=main' \
  -f 'source[path]=/' 2>/dev/null || true

PREVIEW_URL="https://${USERNAME}.github.io/${REPO_NAME}/"
echo ""
echo "=========================================="
echo "  推送完成！"
echo "  在线预览地址（约 1~2 分钟后生效）："
echo "  $PREVIEW_URL"
echo "=========================================="
echo ""
echo "手机直接打开上述链接即可预览。"
