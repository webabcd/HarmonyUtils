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