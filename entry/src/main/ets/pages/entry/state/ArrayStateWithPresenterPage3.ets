import { ColorUtils } from '../../../common/ColorUtils'

/**
 * 状态管理V2版本，还是很给力的
 */
@Entry
@ComponentV2
struct ArrayStateWithPresenterPage {
  @Local presenter: Presenter = new Presenter(["1", "2", "3", "4"])

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
      ShowList({
        arr: this.presenter.arr,
        deleteIndex: (index: number)=>{
          this.presenter.deleteIndex(index)
        }
      })
    }
  }
}

@ComponentV2
struct ShowList {
  @Require @Param arr: string[] = []
  @Event deleteIndex: (index: number) => void = () => {}

  build() {
    Column() {
      ForEach(this.arr, (item: string, index: number) => {
        Text(item)
          .backgroundColor(ColorUtils.getRandomColor())
          .width('100%')
          .padding(8)
          .onClick(()=> {
            this.deleteIndex(index)
          })
      })
    }
  }
}

@ObservedV2
class Presenter {
  @Trace arr: string[]
  private count: number = 0

  constructor(arr: string[]) {
    this.arr = arr
    this.count = this.arr.length
  }

  push() {
    this.arr.push((++this.count).toString())
  }

  reset() {
    // 这样也可以
    this.arr = ["1", "2", "3"]

    // this.arr.length = 0
    // this.arr.push("1", "2", "3")
  }

  delete(type: number) {
    if (type == 1) {
      this.arr.shift()
    } else if (type == 2) {
      this.arr.pop()
    }
  }

  deleteIndex(index: number) {
    this.arr.splice(index, 1)
  }
}
