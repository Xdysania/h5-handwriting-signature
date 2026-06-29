# H5 手写签名优化 Demo

Nota Sign H5 手绘签名画布演示：逻辑画布 2W、双指缩放平移、笔迹边界裁剪导出。

## 在线预览（GitHub Pages）

### 第一次部署

1. 在终端登录 GitHub（只需一次）：

```bash
gh auth login
```

选择：`GitHub.com` → `HTTPS` → `Login with a web browser`，按提示在浏览器完成授权。

2. 执行一键部署：

```bash
cd "/Users/fadada/Desktop/AI代码存放处/h5-handwriting-signature"
./deploy.sh
```

3. 部署成功后，手机/电脑访问：

**https://\<你的GitHub用户名\>.github.io/h5-handwriting-signature/**

（Pages 通常 1~2 分钟后生效）

### 后续更新

修改 HTML 后执行：

```bash
git add .
git commit -m "update"
git push
```

## 本地使用

直接双击 `index.html` 或 `h5-handwriting-signature.html` 即可打开。

## 功能

- 单指手写签名
- 双指缩放（50% ~ 100%）与平移
- 逻辑画布宽度为可视区 2 倍
- 完成时按笔迹边界裁剪，不受视角缩放影响
