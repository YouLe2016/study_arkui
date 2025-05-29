@Entry
@Component
struct Index {
  @State message: string = 'Common Module';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(32)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.message = 'Welcome';
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}