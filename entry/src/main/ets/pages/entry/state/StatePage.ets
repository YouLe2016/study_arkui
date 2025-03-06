@Component
export struct StatePage {
  build() {
    Text("StatePage")
  }
}

@Entry
@Preview
@Component
struct StatePagePreview {
  build() {
    Stack() {
      StatePage()
    }
  }
}