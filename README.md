# blog
Original Data for Github Pages Blog

# 作業工程
## 初期のブログ立ち上げ
- Windows10環境で作業
- Hugoで静的サイトをビルド
- WindowsGitを使用して管理
- GitHubへPush

## 記事ごとのアップロード
- `content/posts`フォルダで、template.mdをコピーして新規記事を作成。mdでもhtmlでも。
	- template冒頭の記事の属性をつけること。
- deploy.batを実行してビルド・両リポジトリへpush

## Hugoテーマ
whiteplainとwhiteplain-light
https://themes.gohugo.io/whiteplain/

このサイトから選べる。
https://themes.gohugo.io/tags/

# リポジトリの設定
公式サイトの説明が詳しい
https://gohugo.io/hosting-and-deployment/hosting-on-github/#step-by-step-instructions

## 自分の場合の設定
全データのリポジトリ
https://github.com/lilacs2039/blog

公開ページ(publicフォルダ)のホスティング
https://github.com/lilacs2039/lilacs2039.github.io


# Favicon
https://www.iconsdb.com/custom-color/integrated-circuit-icon.html
カラーコード：#6dcb8a  
（GitHubアイコンの色）

カラーコードはここで10進数から16進数へ変換した
https://www.peko-step.com/tool/tfcolor.html

# エラー対応
## Error: Error building site: failed to render pages: render of "section" failed:
### 発生時の状況
`hugo -t (theme name)`でビルドを実行したところ、以下のエラーが表示される。
```
Error: Error building site: failed to render pages: render of "section" failed: "（プロジェクトフォルダ）\themes\whiteplain\layouts\section\archives.html:7:21": execute of template failed: template: section\archives.html:7:21: executing "main" at <.Paginate>: error calling Paginate: cannot convert type page.PagesGroup to Pages
```
### 分析
エラーログの読み方参考
https://github.com/eddiewebb/hugo-resume/issues/30#issuecomment-493502414
わかったこと
このエラーメッセージを以下のパートに分けて解釈して、以下のことがわかる。
- `Error: Error building site: failed to render pages: render of "section" failed: `
  - `section`ファイルがレンダリングされなかった。
- `"（プロジェクトフォルダ）\themes\whiteplain\layouts\section\archives.html:7:21":`
  - どのファイルのどの行で失敗したか
- ` execute of template failed: template: section\archives.html:7:21:`
  - どのファイルのどの行で失敗したか
- `executing "main" at <.Paginate>: error`
  - `.Paginate`の実行がエラーで終了した。
- `calling Paginate: cannot convert type page.PagesGroup to Pages`
  - エラーの内容。
  - paginateはページネーションの意。Web制作においては、検索結果一覧など、内容の多いページを複数のWebページに分割し、各ページへのリンクを並べてアクセスしやすくするために設置するもの。

### 対策
`/content/archives`フォルダを除去して再ビルドしたら成功した。現段階はまだアーカイブ関連機能は不要なので棚上げ。
