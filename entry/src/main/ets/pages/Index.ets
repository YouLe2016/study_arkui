import { add, EmptyView } from "@ohos/common"

@Component
export struct Index {
  aboutToAppear(): void {
    const result = add(1, 2)
    console.log(`result: ${result}`)
  }

  build() {
    Column() {
      Text("Index")
      EmptyView()
    }
  }
}

@Preview
@Component
struct IndexPreview {
  build() {
    Index()
  }
}