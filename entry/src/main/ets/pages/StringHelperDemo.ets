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