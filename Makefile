# ビルド、中間生成ファイル・ログファイルの削除を行う
all: build clean-intermediate-file clean-log-file

# 最新のソースファイルをビルドする
build:
	ls src/*.tex | sort -r | head -1 | xargs -L1 latexmk -output-directory=pdf
	rm -f pdf/*.aux pdf/*.dvi pdf/*.fdb_latexmk pdf/*.fls pdf/*.synctex.gz pdf/*.log
	rm -f src/*.aux src/*.dvi src/*.fdb_latexmk src/*.fls src/*.synctex.gz src/*.log src/*.pdf

# すべてのソースファイルをビルドする
build-all:
	ls src/*.tex | xargs -L1 latexmk -output-directory=pdf
	make clean-intermediate-file
	make clean-log-file

# 最新のソースファイルをコピーし、VS Codeで開く
copy:
	chmod +x .scripts/copy.sh
	.scripts/copy.sh

# 最新のソースファイルを VS Code で開く
open:
	ls src/*.tex | sort -r | head -1 | xargs -L1 code

# ビルド時の中間生成ファイルの削除
clean-intermediate-file:
	rm -f pdf/*.aux pdf/*.dvi pdf/*.fdb_latexmk pdf/*.fls pdf/*.synctex.gz

# ビルド時のログファイルの削除
clean-log-file:
	rm -f pdf/*.log

# ビルド時に生成したすべてのファイルを削除
clean: clean-intermediate-file clean-log-file
	rm -f pdf/*.pdf

# 自作コマンド
# 最新のtexとpdfを削除する
remove:
	ls src/*.tex | sort -r | head -1 | xargs -L1 rm -f
	ls pdf/*.pdf | sort -r | head -1 | xargs -L1 rm -f