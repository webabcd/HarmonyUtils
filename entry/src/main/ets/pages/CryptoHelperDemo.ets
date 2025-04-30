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