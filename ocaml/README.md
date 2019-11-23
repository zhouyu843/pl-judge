# OCaml演習問題
このREADMEを全部読んでから演習を始めてください。

## 環境構築
- `opam`を更新
  ```
  opam update && opam upgrade
  ```
- ビルドツールの`dune`を入れる
  ```
  opam install dune
  ```
- 単体テスト用のライブラリ`alcotest`を入れる
  ```
  opam install alcotest
  ```

## テストを実行する
`<your-path-to>/pl-judge/ocaml`で
```
dune runtest
```
実行に成功した場合、
```
> dune runtest
section1_test alias tests/runtest (exit 86)
(cd _build/default/tests && ./section1_test.exe)
Testing Section1_Test.
This run has ID `9B59F54A-4E18-4204-9032-5FAF2E64E624`.
[ERROR]             is_older                            0   Case: 101A.
[ERROR]             is_older                            1   Case: 101B.
[ERROR]             is_older                            2   Case: 101C.

...

-- is_older.000 [Case: 101A.] Failed --
in ...
[failure] TODO: is_older

The full test results are available in `...`.
86 errors! in 0.024s. 86 tests run.
```
のような出力が確認できるはず。

## 演習問題を解く
`exercises`下に`section*.ml`のファイルに問題が書かれてある。
例えばセクション１の問題１は以下のテンプレート関数が用意されてある。
``` ocaml
let is_older (_ : date) (_ : date) : bool =
  todo "is_older"
;;
```
答えるときに、まずパラメータのところの`_`を適切な変数名に入れ替え、
``` ocaml
let is_older (date1 : date) (date2 : date) : bool =
  todo "is_older"
;;
```
`todo ...`を消して、答えを埋めてください。
``` ocaml
let is_older (date1 : date) (date2 : date) : bool =
  true (* あなたの答え *)
;;
```
再びテストを実行したら、通ったテストケースは`[OK]`になるはず。
```
> dune runtest
section1_test alias tests/runtest (exit 84)
(cd _build/default/tests && ./section1_test.exe)
Testing Section1_Test.
This run has ID `5B936A77-2368-4A49-BB1A-65DC4EAD494B`.
[ERROR]             is_older                            0   Case: 101A.
[ERROR]             is_older                            1   Case: 101B.
[OK]                is_older                            2   Case: 101C.
[ERROR]             is_older                            3   Case: 101D.
[OK]                is_older                            4   Case: 101E.
[ERROR]             number_in_month                     0   Case: 102A.

...

-- is_older.000 [Case: 101A.] Failed --
in ...
--------------------------------------------------------------------------------
ASSERT 
--------------------------------------------------------------------------------
[failure] Error : expecting
false, got
true.

The full test results are available in `...`.
84 errors! in 0.026s. 86 tests run.
```

### テストの読み方
`exercises/section*.ml`の対応するテストは`tests/section*_test.ml`に書いてある。
先の例だと、
``` ocaml
let suite01 =
  let compare' = compare bool in
  "is_older" (* テスト対象 *)
  , [ quick_test "101A" (* タグ *) (fun _ ->
          compare'
            false (* 期待する出力 *)
            (is_older d010101 d010101)) (* 実際の出力 *)
    ; quick_test "101B" (fun _ ->
          compare'
            false
            (is_older d030303 d010101))

...

```
`d010101`のような変数は`tests/test_data.ml`に定義されている。

### 注意
- `exercises/section*.ml`以外のファイルは変更しないでください
- テンプレート関数の型は変更しないでください（テストと整合とれず、コンパイルエラーになるため）
- 再帰関数を使いたい場合は、適宜`rec`を追加してください
