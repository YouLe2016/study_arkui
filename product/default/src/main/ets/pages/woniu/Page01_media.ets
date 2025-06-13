// import mediaquery from '@ohos.mediaquery';
import { mediaquery, window } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';

type MediaQueryResult = "横屏" | "竖屏" | "";

@Entry
@Component
struct Page01_media {
  private message: string = '媒体查询技术';

  @State
  @Watch("mediaQueryResultChanged")
  private mediaQueryResult: MediaQueryResult = '';
  private isLandscape = false

  // 当设备横屏时条件成立
  private listener: mediaquery.MediaQueryListener = this.getUIContext()
    .getMediaQuery()
    .matchMediaSync('(orientation: landscape)');

  private onPortrait(mediaQueryResult: mediaquery.MediaQueryResult) {
    const result = mediaQueryResult.matches as boolean
    // 【注意】这里会调用2次
    // Fix: 现在只会调用一次了，似乎已经修复了。很奇怪啊。2025-06-13
    console.log("onPortrait: isLandscape=" + result)

    // 当满足媒体查询条件时，触发回调
    if (result) { // 若设备为横屏状态，更改相应的页面布局
      this.mediaQueryResult = '横屏';
    } else {
      this.mediaQueryResult = '竖屏';
    }
  }

  private mediaQueryResultChanged() {
    console.log("mediaQueryResultChanged: " + this.mediaQueryResult)
  }

  // 改变设备横竖屏状态函数
  private changeOrientation(isLandscape: boolean) {
    // 获取UIAbility实例的上下文信息
    let context: common.UIAbilityContext = this.getUIContext()
      .getHostContext() as common.UIAbilityContext;
    // 调用该接口手动改变设备横竖屏状态
    window.getLastWindow(context)
      .then((lastWindow) => {
        lastWindow.setPreferredOrientation(
          isLandscape ? window.Orientation.LANDSCAPE : window.Orientation.PORTRAIT
        )
      });
  }

  aboutToAppear(): void {
    console.log("aboutToAppear")
    // 绑定当前应用实例
    // 绑定回调函数
    this.listener.on('change', (mediaQueryResult: mediaquery.MediaQueryResult) => {
      this.onPortrait(mediaQueryResult)
    });
  }

  aboutToDisappear() {
    // 解绑listener中注册的回调函数
    this.listener.off('change');
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.message = 'Welcome';
        })
      Text(this.mediaQueryResult)
      Button("切换").onClick(() => {
        this.isLandscape = !this.isLandscape;
        this.changeOrientation(this.isLandscape);
      })
    }
    .height('100%')
    .width('100%')
    .padding(16)
  }
}