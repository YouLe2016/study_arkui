@Component
export struct RowPage {
  @State rightColumnHeight: Length = 0;

  build() {
    Row(){
      Column(){
        Text("a").backgroundColor(Color.Black)
          .height(70)
        Text("b").backgroundColor(Color.Gray)
          // 这两个写法都不行，会使左边的Column高于右边的Column
          // .height('100%')
          // .layoutWeight(1)

          // 解决问题：
          // 1. Column 的 onSizeChange + constraintSize(minHeight)
          // 2. Text 的 constraintSize(minHeight) + layoutWeight(1)
          .constraintSize({ minHeight: 30 })
          .layoutWeight(1)
      }
      .constraintSize({ minHeight: this.rightColumnHeight })
      Column(){
        Stack() {
          Text("c").backgroundColor(Color.Blue)
            .height(80)
            .width('100%')
            .textAlign(TextAlign.End)
        }.margin({ left: 10, right: 10 })
        Text("d").backgroundColor(Color.Brown)
          .height(80)
      }.onSizeChange((_: SizeOptions, newValue: SizeOptions) => {
        const height = newValue.height
        if (height) {
          this.rightColumnHeight = height
        }
      }).layoutWeight(1)
    }
  }
}

@Preview
@Component
struct RowPagePreview {
  build() {
    Stack(){
      RowPage()
    }
    .height(240)
  }
}