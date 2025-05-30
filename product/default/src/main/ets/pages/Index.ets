// import { add, EmptyView } from "@ohos/common"
import { add } from '../../../mock/myhsp.mock'
import { MainPage } from '@ohos/home'
import { BreakpointConstants, BreakpointSystem } from '@ohos/common'

@Entry
@Component
struct Index {
  private breakpointSystem: BreakpointSystem = BreakpointSystem.getInstance()
  @StorageProp(BreakpointConstants.CurrentBreakpointKey)
  private currentBreakpoint: string = "加载中……"

  aboutToDisappear() {
    this.breakpointSystem.unregister()
  }

  aboutToAppear(): void {
    const result = add(1, 2)
    console.log(`result: ${result}`)
    this.breakpointSystem.register()
  }

  build() {
    Column() {
      Text("Index")
      Text(this.currentBreakpoint)
      // EmptyView()
      MainPage()
    }
  }
}