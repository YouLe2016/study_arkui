@Component
export struct ArrayStateWithPresenterPage {
  @State arr: string[] = ["1", "2", "3", "4"]
  count: number = 4

  build() {
    Column() {
      Row(){
        Button("添加").onClick(() => {
          this.arr.push((++this.count).toString())
        })
        Button("删除").onClick(() => {
          this.arr.shift()
        })
        Button("重置").onClick(() => {
          this.arr = ["1", "2", "3"]
        })
      }
      ForEach(this.arr, (item: string) => {
        Text(item)
          .backgroundColor(this.getRandomColor())
          .width('100%')
          .padding(8)
      })
    }
  }

  getRandomColor(): string {
    return `rgba(${Math.floor(Math.random() * 256)}, ${Math.floor(Math.random() * 256)}, ${Math.floor(Math.random() * 256)}, 0.3)`
  }
}

@Entry
@Preview
@Component
struct StatePagePreview {
  build() {
    Stack() {
      ArrayStateWithPresenterPage()
    }
  }
}