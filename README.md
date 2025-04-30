# @webabcd/harmony-utils 的 demo
用于演示如何使用 @webabcd/harmony-utils

## 简介
[harmony-utils](https://ohpm.openharmony.cn/#/cn/detail/@webabcd%2Fharmony-utils)
简单易用的 HarmonyOS 工具库，包括字符串相关，加解密相关，路径相关，日志相关等

## 下载安装
`ohpm i @webabcd/harmony-utils`

## 功能详解
| 类 | 介绍 |
|---|---|
| StringHelper | 字符串相关 |
| CryptoHelper | 加解密相关 |
| PathHelper | 路径相关 |
| LogHelper | 日志相关 |

## StringHelper 的示例代码
```
import { StringHelper } from '@webabcd/harmony-utils'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct StringHelperDemo {

  @State message:string = ''

  aboutToAppear(): void {
    this.message += `string to base64: ${StringHelper.stringToBase64('abcd')}\n`
    this.message += `string to hex: ${StringHelper.stringToHex('abcd')}\n`
    this.message += `base64 to string: ${StringHelper.base64ToString('YWJjZA==')}\n`
    this.message += `hex to string: ${StringHelper.hexToString('61626364')}\n`

    let arrayBuffer = StringHelper.stringToUint8Array("abcd").buffer
    this.message += `ArrayBuffer to string: ${StringHelper.arrayBufferToString(arrayBuffer)}\n`
    this.message += `ArrayBuffer to base64: ${StringHelper.arrayBufferToString(arrayBuffer, 'base64')}\n`
    this.message += `ArrayBuffer to hex: ${StringHelper.arrayBufferToString(arrayBuffer, 'hex')}\n`
  }

  build() {
    Column({space:10}) {
      Button("返回").onClick(() => { router.back() })

      Text(this.message)
    }
    .alignItems(HorizontalAlign.Start)
  }
}
```

## CryptoHelper 的示例代码
```
import { CryptoHelper } from '@webabcd/harmony-utils'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct CryptoHelperDemo {

  @State message:string = ''

  aboutToAppear(): void {
    this.message += `md5: ${CryptoHelper.md5("abc")}\n`
  }

  build() {
    Column({space:10}) {
      Button("返回").onClick(() => { router.back() })

      Text(this.message)
    }
    .alignItems(HorizontalAlign.Start)
  }
}
```

## PathHelper 的示例代码
```
import { PathHelper } from '@webabcd/harmony-utils'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct PathHelperDemo {

  @State message:string = ''

  aboutToAppear(): void {
    this.message += `路径拼接: ${PathHelper.join("/aa", "bb", "/cc", "dd.xx")}\n`
    this.message += `获取指定路径的父目录: ${PathHelper.getParentDirectory('/aa/bb/cc')}\n`
  }

  build() {
    Column({space:10}) {
      Button("返回").onClick(() => { router.back() })

      Text(this.message)
    }
    .alignItems(HorizontalAlign.Start)
  }
}
```

## LogHelper 的示例代码
```
import { log, model } from '@webabcd/harmony-utils'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct LogHelperDemo {

  @State message:string = '请看 HiLog 日志'

  aboutToAppear(): void {
    log.LOGLEVEL = model.LogLevel.DEBUG
    log.d("dddddd")
    log.i("iiiiii")
    log.w("wwwwww")
    log.e("eeeeee")
    log.f("ffffff")
  }

  build() {
    Column({space:10}) {
      Button("返回").onClick(() => { router.back() })

      Text(this.message)
    }
    .alignItems(HorizontalAlign.Start)
  }
}
```