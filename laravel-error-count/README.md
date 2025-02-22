## 概要
エラーカウントを取得するShell

## 取得できる結果
```
awk -F'exception":"\\[object\\] \\(' '{for(i=2;i<=NF;i++){split($i,a,"("); print a[1]}}' laravel-2025-01-02.log | sort | uniq -c | sort -nr
```

```
2 InvalidArgumentException
2 Google\\ApiCore\\ApiException
2 Error
1 TypeError
1 ErrorException
```