@Component
struct AddTaskPage {
  build() {
    Column() {
      Text($r("app.string.createTask"))
        .fontSize(26)
        .fontWeight(FontWeight.Bold)

      Text($r("app.string.title"))
        .fontColor('#666666')
        .fontSize(16)
        .titleCommonStyle()
      TextInput({
        placeholder: $r("app.string.placeholder_inputTitle")
      }).myShowUnderline()

      Text($r("app.string.date"))
        .titleTextStyle()
      TextInput({
        placeholder: $r("app.string.placeholder_inputDate")
      })
        .myShowUnderline()

      Text($r("app.string.time"))
        .titleTextStyle()
      TextInput({
        placeholder: $r("app.string.placeholder_inputTime")
      }) .myShowUnderline()

      Text($r("app.string.description"))
        .titleTextStyle()
      TextInput({
        placeholder: $r("app.string.placeholder_inputDescription")
      }) .myShowUnderline()

    }
    .height('100%')
    .width('100%')
    .padding(16)
  }

  // 感觉放在外面更方便啊
  // @Styles
  // titleCommonStyle() {
  //   // .backgroundColor(Color.Pink)
  //   // .align(Alignment.Start)
  //   // 设置Flex布局中的子元素的对齐方式
  //   .alignSelf(ItemAlign.Start)
  //   .margin({ top: 16 })
  // }
}

@Styles
function titleCommonStyle() {
  // .backgroundColor(Color.Pink)
  // .align(Alignment.Start)

  // 设置Flex布局中的子元素的对齐方式
  .alignSelf(ItemAlign.Start)
  .margin({ top: 16 })
}

@Extend(Text)
function titleTextStyle(
  fontColor: ResourceColor = '#666666',
  fontSize: number | string | Resource = 16
) {
  // Error: Property 'titleCommonStyle' does not exist on type 'TextAttribute'.
  // .titleCommonStyle()

  .alignSelf(ItemAlign.Start)
  .margin({ top: 16 })
  .fontColor(fontColor)
  .fontSize(fontSize)
}

@Extend(TextInput)
function myShowUnderline() {
  // .borderRadius(0)
  // .backgroundColor(Color.Transparent)
  // ------------------------------------------------
  // .backgroundColor(Color.Pink)

  .showUnderline(true)
  .underlineColor('#666666')
  .placeholderColor('#ff120f99')
  .padding({ top: 8, bottom: 8 })
}

@Entry
@Preview
@Component
struct AddTaskPagePreview {
  build() {
    Stack() {
      AddTaskPage()
    }
  }
}