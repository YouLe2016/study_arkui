// import { add, EmptyView } from "@ohos/common"
import { add } from '../../../mock/myhsp.mock'
import { MainPage } from '@ohos/home'

@Entry
@Component
struct Index {
  aboutToAppear(): void {
    const result = add(1, 2)
    console.log(`result: ${result}`)
  }

  build() {
    Column() {
      Text("Index")
      // EmptyView()
      MainPage()
    }
  }
}