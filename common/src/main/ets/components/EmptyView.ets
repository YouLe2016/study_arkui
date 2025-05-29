@Component
export struct EmptyView {
  build() {
    Stack() {
      Text("页面空空如也！！")
        .fontSize(24)
        .fontWeight(FontWeight.Medium)
    }
    .width("100%")
    .height("100%")
  }
}

@Preview
@Component
struct EmptyViewPreview {
  build() {
    EmptyView()
  }
}