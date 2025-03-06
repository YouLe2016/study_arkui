import { ColorUtils } from '../../../common/ColorUtils'

/**
 * 没有页面，已替换成 ArrayStateWithPresenterPage.ets。
 *
 * UU跑腿项目中我们用的这种方式
 */
@Entry
@Component
struct ArrayStateWithPresenterPage {
  @State arr: string[] = ["1", "2", "3", "4"]
  private presenter = new Presenter(this.arr)

  build() {
    Column() {
      Row(){
        Button("添加").onClick(()=>{
          this.presenter.push()
        })
        Button("shift").onClick(() => {
          this.presenter.delete(1)
        })
        Button("pop").onClick(() => {
          this.presenter.delete(2)
        })
        Button("重置").onClick(() => {
          this.presenter.reset()
        })
      }
      ForEach(this.arr, (item: string) => {
        Text(item)
          .backgroundColor(ColorUtils.getRandomColor())
          .width('100%')
          .padding(8)
      })
    }
  }
}

class Presenter {
  arr: string[]
  count: number

  constructor(arr: string[]) {
    this.arr = arr
    this.count = this.arr.length
  }

  push() {
    this.arr.push((++this.count).toString())
  }

  reset() {
    // 这样是不行的
    // this.arr = ["1", "2", "3"]

    this.arr.length = 0
    this.arr.push("1", "2", "3")
  }

  delete(type: number) {
    if (type == 1) {
      this.arr.shift()
    } else if (type == 2) {
      this.arr.pop()
    }
  }
}