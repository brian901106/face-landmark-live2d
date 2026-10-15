@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo 正在啟動本機網頁伺服器：http://localhost:8000/src/?model=mediapipe_face_mesh
echo 關閉這個視窗即可停止伺服器。
start "" "http://localhost:8000/src/?model=mediapipe_face_mesh"
python -m http.server 8000
