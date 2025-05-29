@Component
@Preview
struct RelativeContainerPage2 {
  build() {
    Stack(){
      RelativeContainer() {
        Text("row1")
          .id('row1')
          .textStyle()
          .backgroundColor('#a3cf62')
          .alignRules({
          })

        Text("row2")
          .id('row2')
          .textStyle()
          .backgroundColor('#00ae9d')
          .alignRules({
            right: { anchor: '__container__', align: HorizontalAlign.End }
          })
          .offset({
            x: -40,
            y: -20
          })

        Text("row3")
          .id('row3')
          .textStyle()
          .width('')
          .backgroundColor('#ff601cb1')
          .alignRules({
            top: { anchor: 'row1', align: VerticalAlign.Bottom },
            left: { anchor: 'row1', align: HorizontalAlign.Start },
            right: { anchor: 'row2', align: HorizontalAlign.Start }
          })
          .offset({
            x: -10,
            y: -20
          })

        Text("row4")
          .textStyle()
          .width('')
          .backgroundColor('#6699FF')
          .alignRules({
            top: { anchor: 'row3', align: VerticalAlign.Bottom },
            left: { anchor: 'row1', align: HorizontalAlign.Center },
            right: { anchor: '__container__', align: HorizontalAlign.End }
          })
          .offset({
            x: -15,
            y: 10
          })
      }
      .height(300)
      .width(300)
      .border({ width: 2, color: '#6699FF' })
    }
    .height('100%')
    .width('100%')
  }
}

@Extend(Text)
function textStyle() {
  .width(100)
  .height(100)
  .textAlign(TextAlign.Center)
}