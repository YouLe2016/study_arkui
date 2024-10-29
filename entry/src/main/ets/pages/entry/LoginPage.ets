// 这两个包都可以，还是调用这行。下面是新版写法
// import router from '@ohos.router';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct LoginPage {
  @State message: string = '登录页面';

  build() {
    Row() {
      Column({ space: 10 }) {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('跳转首页').onClick(() => {
          router.replaceUrl({
            url: "pages/Index"
          })
        })
      }
      .width('100%')
      .backgroundColor(Color.Orange)
    }
    .height('100%')
    .backgroundColor(Color.Pink)
  }
}