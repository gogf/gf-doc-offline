
# gtime

通用时间管理模块，封装了常用的时间/日期相关的方法。并支持自定义的日期格式化语法，格式化语法灵感来源于`PHP`的`date`函数语法 ( http://php.net/manual/zh/function.date.php )。

> `gtime`的时间格式语法对于熟悉PHP的开发者来说非常友好。

**使用方式**：
```go
import "github.com/gogf/gf/os/gtime"
```

**接口文档**： 

https://godoc.org/github.com/gogf/gf/os/gtime

**时间格式**：

`gtime`模块最大的特点是支持自定义的时间格式，以下是支持的时间格式语法列表：

格式 | 说明 | 返回值示例
-- | -- | --
**日** | -- | --
`d` | 月份中的第几天，有前导零的 2 位数字 | 01 到 31
`D` | 星期中的第几天，文本表示，3 个字母 | Mon 到 Sun
`N` | ISO-8601 格式数字表示的星期中的第几天 | 1（表示星期一）到 7（表示星期天）
`j` | 月份中的第几天，没有前导零 | 1 到 31
`l` | ("L"的小写字母)星期几，完整的文本格式 | Sunday 到 Saturday
`S` | 每月天数后面的英文后缀，2 个字符 | st，nd，rd 或者 th。可以和 j 一起用
`w` | 星期中的第几天，数字表示 | 0（表示星期天）到 6（表示星期六）
`z` | 年份中的第几天 | 0 到 365
**周** | -- | --
`W` | ISO-8601   格式年份中的第几周，每周从星期一开始 | 例如：42（当年的第 42 周）
**月** | -- | --
`F` | 月份，完整的文本格式 | January 到 December
`m` | 数字表示的月份，有前导零 | 01 到 12
`M` | 三个字母缩写表示的月份 | Jan 到 Dec
`n` | 数字表示的月份，没有前导零 | 1 到 12
`t` | 指定的月份有几天 | 28 到 31
**年** | -- | --
`Y` | 4 位数字完整表示的年份 | 例如：1999 或 2003
`y` | 2 位数字表示的年份 | 例如：99 或 03
**时间** | -- | --
`a` | 小写的上午和下午值 | am 或 pm
`A` | 大写的上午和下午值 | AM 或 PM
`g` | 小时，12 小时格式，没有前导零 | 1 到 12
`G` | 小时，24 小时格式，没有前导零 | 0 到 23
`h` | 小时，12 小时格式，有前导零 | 01 到 12
`H` | 小时，24 小时格式，有前导零 | 00 到 23
`i` | 有前导零的分钟数 | 00 到 59
`s` | 秒数，有前导零 | 00 到 59
`u` | 毫秒数(3位) | 例如：000, 123, 239
`U` | UNIX时间戳(秒) | 例如：1559648183
**时区** | -- | --
`O` | 与UTC相差的小时数 | 例如：+0200
`P` | 与UTC的差别，小时和分钟之间有冒号分隔 | 例如：+02:00
`T` | 时区缩写 | 例如：UTC，GMT，CST
**日期** | -- | --
`c` | ISO 8601 格式的日期 | 例如：2004-02-12T15:19:21+00:00
`r` | RFC 822 格式的日期 | 例如：Thu, 21 Dec 2000 16:01:07 +0200

