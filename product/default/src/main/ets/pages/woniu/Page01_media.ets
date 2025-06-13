import { DeviceOrientation, DeviceOrientationUtils } from '@ohos/common';

type MediaQueryResult = "横屏" | "竖屏" | "";

@Entry
@Component
struct Page01_media {
  private message: string = '媒体查询技术';

  @State private mediaQueryResult: MediaQueryResult = '';
  private isLandscape = false

  private deviceOrientationUtils: DeviceOrientationUtils = DeviceOrientationUtils.getInstance();

  aboutToAppear(): void {
    console.log("aboutToAppear")
    this.deviceOrientationUtils.register(this.getUIContext(), (orientation: DeviceOrientation) => {
      this.mediaQueryResult = orientation
    })
  }

  aboutToDisappear() {
    this.deviceOrientationUtils.unregister()
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
        this.deviceOrientationUtils.setOrientation(
          this.getUIContext(),
          this.isLandscape ? DeviceOrientation.LANDSCAPE : DeviceOrientation.PORTRAIT
        )
      })
    }
    .height('100%')
    .width('100%')
    .padding(16)
  }
}