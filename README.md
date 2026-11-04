# 臉部特徵點驅動 Live2D

**線上 Demo：** https://brian901106.github.io/face-landmark-live2d/ （桌機版 Chrome／Edge，需允許攝影機權限）

## 成果

在網頁上用攝影機即時偵測 468 個臉部特徵點，換算成頭部角度、眨眼、嘴巴開合等參數，驅動 Live2D 角色，並透過 OBS 串流到 YouTube 直播。
示範影片：[特徵點偵測](https://www.youtube.com/watch?v=id46uL_Yzsk)｜[驅動 Live2D](https://www.youtube.com/watch?v=lX7O4dP1Rkk)｜[Live2D 直播](https://www.youtube.com/watch?v=GYcZCGL6EN4)

## 資料夾結構

```
.
├── index.html    # GitHub Pages 首頁（連到主作品與示範影片）
├── .nojekyll     # 讓 GitHub Pages 不忽略 _開發歷程/ 資料夾
├── src/          # 主作品：臉部特徵點驅動 Live2D（初音未來、黑板背景），可執行
├── 啟動網頁版.bat  # 雙擊即可在本機開啟主作品
└── _開發歷程/
    └── 01_臉部特徵點偵測網頁/      # 第一階段：TF.js Face Landmarks Detection 網頁
```

## 作法重點（`src/src.a2b27638.js` 的 `drawResults`）

- 左右擺頭：比較左右眼角特徵點的深度（z）差。
- 上下點頭：以鼻樑特徵點的垂直位置換算角度。
- 歪頭：左右眼下緣特徵點的高度差。
- 眨眼：上下眼瞼特徵點的距離小於門檻即判定閉眼。
- 嘴巴：上下唇特徵點的距離換算開合程度。
- 眉毛：眉毛與眼睛特徵點的距離換算眉毛高低。
- Cubism 模型載入以 Live2D Cubism SDK for Web 為基礎；特徵點到角色參數的對應為本專案實作。

## 本機執行

網頁 Demo 需要透過 HTTP server 開啟（直接雙擊 HTML 會因瀏覽器安全限制載入失敗），並允許攝影機權限：

```bash
python -m http.server 8000
```

然後用桌機版 Chrome／Edge 前往 http://localhost:8000/src/?model=mediapipe_face_mesh （或直接雙擊 `啟動網頁版.bat`）。

## 使用技術

- 臉部追蹤：TensorFlow.js Face Landmarks Detection、MediaPipe Face Mesh
- Live2D：Cubism SDK for Web
- 直播：OBS Studio、YouTube Live
- 前端：TypeScript、JavaScript、dat.GUI

## 授權說明

Live2D 範例模型等第三方素材的著作權屬於原作者，僅供學習與展示用途。
