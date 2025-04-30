/**
 * 用于演示如何使用 @webabcd/harmony-utils
 */

import { router } from '@kit.ArkUI'

@Entry
@Component
struct Index {

  build() {
    Column({space:10}) {
      Button("字符串相关").onClick(() => { router.pushUrl({ url: 'pages/StringHelperDemo' }) })
      Button("加解密相关").onClick(() => { router.pushUrl({ url: 'pages/CryptoHelperDemo' }) })
      Button("路径相关").onClick(() => { router.pushUrl({ url: 'pages/PathHelperDemo' }) })
      Button("日志相关").onClick(() => { router.pushUrl({ url: 'pages/LogHelperDemo' }) })
    }
    .alignItems(HorizontalAlign.Start)
  }
}