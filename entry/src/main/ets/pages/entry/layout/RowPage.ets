@Component
export struct RowPage {
  build() {
    Row(){
      Column(){
        Text("a").backgroundColor(Color.Black)
          .height(70)
        Text("b").backgroundColor(Color.Gray)
          // todo: 还没有解决
          // 这两个写法都不行，会使左边的Column高于右边的Column
          // .height('100%')
          // .layoutWeight(1)
      }
      Column(){
        Text("c").backgroundColor(Color.Blue)
          .height(80)
        Text("d").backgroundColor(Color.Brown)
          .height(80)
      }
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