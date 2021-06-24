# my-project

# SQLiteのデータベースを作成する

```
sqlite3 test.db
CREATE TABLE memos (id INTEGER PRIMARY KEY AUTOINCREMENT, comment)
insert into memos (comment) values ('Hello');
insert into memos (comment) values ('Konitiwa');
select * from memos;
.exit;
```

# コンパイルと実行

```
stack build
stack exec my-project-exe
```

```
id comment
1 "Hello"
2 "Konitiwa"
[Kazu {kazuCount = 2}]
2
```
