# 臉部特徵點驅動 Live2D

這是我在國立臺北科技大學修習專題指導教授開設的「電腦動畫」課程時完成的成果。
當時AI agent概念尚未出現因此以python完成

> 本 repo 是 2022 年當時作品的重新建置版本：整理資料夾結構、移除未使用的模型與建置產物，並確認在現行瀏覽器上可以正常執行。

## 成果

在網頁上用攝影機即時偵測 468 個臉部特徵點，換算成頭部角度、眨眼、嘴巴開合等參數，驅動 Live2D 角色，並透過 OBS 串流到 YouTube 直播。
示範影片：[特徵點偵測](https://www.youtube.com/watch?v=id46uL_Yzsk)｜[驅動 Live2D](https://www.youtube.com/watch?v=lX7O4dP1Rkk)｜[直播](https://www.youtube.com/watch?v=GYcZCGL6EN4)

## 資料夾結構

```
.
├── src/          # 主作品：臉部特徵點驅動 Live2D（初音未來、黑板背景），可執行
├── report/       # 說明頁（心得、評分項目、示範影片）
│   ├── 01_臉部特徵點偵測.html
│   ├── 02_特徵點驅動Live2D.html
│   └── 03_Live2D直播.html
├── 啟動網頁版.bat  # 雙擊即可在本機開啟主作品
└── _開發歷程/
    ├── 01_臉部特徵點偵測網頁/      # 第一階段：TF.js Face Landmarks Detection 網頁
    └── 03_Live2D直播_OBS綠幕/     # 延伸：MediaPipe＋One Euro Filter 驅動 Hiyori，綠幕背景供 OBS 直播
```

## 作法重點（直播版 `_開發歷程/03_Live2D直播_OBS綠幕/facedetect.js`、`parameter.js`）

- 頭部角度：用 3 個特徵點構成平面的法向量，換算成頭部三軸旋轉角；有校正按鈕，把目前姿勢設為零點。
- 眨眼／嘴巴：眼瞼、嘴唇上下特徵點的距離除以臉寬正規化。
- 以 One Euro Filter 平滑頭部角度與眨眼值，減少抖動。
- Cubism 模型載入沿用學長的版本；特徵點到角色參數的對應與平滑由我負責。

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

Live2D 範例模型等第三方素材的著作權屬於原作者，只用於課程學習。
