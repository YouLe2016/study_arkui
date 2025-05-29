@Component
export struct RelativeContainerMarginAndOffsetTest {
  build() {
    RelativeContainer() {
      Text("margin")
        .id("text1")
        .textStyle()

      // margin的实际位置发生了变化
      Text("2")
        .id("text2")
        .alignRules({
          left: { anchor: "text1", align: HorizontalAlign.End }
        })
        .textStyle()
        .margin({ left: 10, top: 10 })
      Text("22")
        .id("text22")
        .alignRules({
          left: { anchor: "text2", align: HorizontalAlign.End }
        })
        .textStyle()
        .backgroundColor(Color.Brown)

      Text("margin的实际位置发生了变化")
        .alignRules({
          top: { anchor: "text1", align: VerticalAlign.Bottom }
        })
        .offset({ top: 20 })

      Text("offset")
        .id("text11")
        .textStyle()
        .alignRules({
          top: { anchor: "text1", align: VerticalAlign.Bottom }
        })
        .margin({ top: 100 })

      // offset相当于translate，实际位置没有发生变化
      Text("3")
        .id("text3")
        .alignRules({
          left: { anchor: "text11", align: HorizontalAlign.End },
          top: { anchor: "text11", align: VerticalAlign.Top }
        })
        .textStyle()
        .offset({ left: 10, top: 10 })
      Text("33")
        .id("text33")
        .alignRules({
          left: { anchor: "text3", align: HorizontalAlign.End },
          top: { anchor: "text3", align: VerticalAlign.Top }
        })
        .textStyle()
        .backgroundColor(Color.Brown)

      Text("offset相当于translate，实际位置没有发生变化")
        .alignRules({
          top: { anchor: "text11", align: VerticalAlign.Bottom }
        })
        .offset({ top: 20 })
    }
  }
}

@Extend(Text)
function textStyle() {
  .width(100)
  .height(100)
  .textAlign(TextAlign.Center)
  .backgroundColor(Color.Pink)
}

@Preview
@Component
struct RelativeContainerTestPreview {
  build() {
    Stack() {
      RelativeContainerMarginAndOffsetTest()
    }
  }
}