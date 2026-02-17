Touhou Save Data Switcher (th13–th20)
====================================

## 概要
- 東方原作（th13からth20までの整数作品）のセーブデータフォルダ（`ShanghaiAlice` 直下の `thxx`）を main/sub の2系統で切り替えるためのバッチです。
- `thxx_main_prep.bat` / `thxx_sub_prep.bat` を実行すると、`thxx` フォルダを入れ替えます。

## 前提
- Windows

## 使い方
1. （初回のみ）以下を `ShanghaiAlice` 直下に配置します。
   - `th13_main_prep.bat` 〜 `th20_main_prep.bat`
   - `th13_sub_prep.bat`  〜 `th20_sub_prep.bat`
   - `stash_main` フォルダ
   - `stash_sub`  フォルダ

   例：`C:\Users\<ユーザー名>\AppData\Roaming\ShanghaiAlice\`

2. sub に切り替え：`ShanghaiAlice` 直下で `thXX_sub_prep.bat` を実行します。
3. main に切り替え：`ShanghaiAlice` 直下で `thXX_main_prep.bat` を実行します。

## 補足
- 初回状態では、`ShanghaiAlice\thxx` が main 扱いです。
- `stash_sub\thxx` が空のまま sub に切り替えてゲームを起動すると、新規セーブが生成されます。  
  既存 main から分岐したい場合は、`stash_sub\thxx` にコピーしてから切り替えてください。

## 注意
- 誤上書き防止のため、ゲーム未起動時に実行してください。
- フォルダ移動（move）で切り替えるため、ファイルを使用中だと失敗します。  
  失敗した場合は、`thxx` や `thxx\replay` を開いているエクスプローラ等を閉じて再実行してください。
- セーブデータは自己責任で運用してください。必要なら事前にバックアップしてください。
