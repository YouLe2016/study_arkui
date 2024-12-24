@Entry
@Component
struct AddTaskPage {
  build() {
    Column() {
      Text($r("app.string.createTask"))
        .fontSize(26)
        .fontWeight(FontWeight.Bold)
      Text($r("app.string.title"))
        .fontColor(Color.Black)
        .fontSize(16)
        .titleTextStyle()
      TextInput({
        placeholder: $r("app.string.placeholder_inputTaskName")
      })
        // .borderRadius(0)
        // .backgroundColor(Color.Transparent)
        // ------------------------------------------------
        // .underlineColor(Color.Pink)
        .myShowUnderline()

    }
    .height('100%')
    .width('100%')
    .padding(10)
  }

  @Styles
  titleTextStyle() {
    .backgroundColor(Color.Pink)
  }
}

@Extend(TextInput)
function myShowUnderline() {
  .showUnderline(true)
}