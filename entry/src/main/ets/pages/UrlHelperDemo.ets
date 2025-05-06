import { UrlHelper } from '@webabcd/harmony-utils'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct UrlHelperDemo {

  @State message:string = ''

  aboutToAppear(): void {
    this.message += `url 编码: ${UrlHelper.encode('http://a.b.c/?x= 参数&y==')}\n`
    this.message += `url 解码: ${UrlHelper.decode(UrlHelper.encode('http://a.b.c/?x= 参数&y=='))}\n`
    this.message += `获取 url 参数: ${UrlHelper.query('http://a.b.c/?x=abc', "x")}\n`
  }

  build() {
    Column({space:10}) {
      Button("返回").onClick(() => { router.back() })

      Text(this.message)
    }
    .alignItems(HorizontalAlign.Start)
  }
}