import { ColorUtils } from '../../../common/ColorUtils'

@Entry
@Component
struct ArrayStateWithPresenterPage {
  @State private presenter: Presenter = new Presenter()

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
        arr: this.presenter.arr
      })
    }
  }
}

@Component
struct ShowList {
  @ObjectLink arr: ObservedArray<string>

  build() {
    Column() {
      ForEach(this.arr, (item: string) => {
        Text(item)
          .backgroundColor(ColorUtils.getRandomColor())
          .width('100%')
          .padding(8)
          .onClick(()=> {
            const index = this.arr.indexOf(item)
            // TypeError: Callable is false。
            // 自定义的ObservedArray不支持splice
            this.arr.splice(index, 1)
          })
      })
    }
  }
}

@Observed
class Presenter {
  @Track
  arr: ObservedArray<string>
  private count: number

  constructor() {
    this.arr = new ObservedArray<string>(...["1", "2", "3", "4"])
    this.count = this.arr.length
  }

  push() {
    this.arr.push((++this.count).toString())
  }

  reset() {
    // 这样是不行的
    // this.arr = ["1", "2", "3"]

    // 这样也是可以的
    this.arr = new ObservedArray<string>(...["1", "2", "3"])

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
}

@Observed
class ObservedArray<T> extends Array<T> {
  // 不可以定义构造函数，会导致splice操作报异常TypeError: Callable is false。
  // constructor(args: T[]) {
  //   super(...args);
  // }
}