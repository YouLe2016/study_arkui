@Entry
@Component
@Preview
struct LayoutPage {
  build() {
    Column() {
      Text("这是一个Row组件")
      Row(){
        Text("test1")
        Text("test2")
      }
      .backgroundColor(Color.Pink)
    }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Green)
  }
}