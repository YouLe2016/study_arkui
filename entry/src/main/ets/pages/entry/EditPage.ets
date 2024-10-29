@Entry
@Component
struct EditPage {
  @State message: string = '编辑页面';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('text')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}