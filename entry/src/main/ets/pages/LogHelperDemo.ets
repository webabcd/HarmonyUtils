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