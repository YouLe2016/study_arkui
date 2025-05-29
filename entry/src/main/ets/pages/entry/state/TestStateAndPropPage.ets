@Component
export struct TestStateAndPropPage {
  @State counter: Counter = new Counter(0)

  build() {
    Column() {
      // ShowComponent({
      //   count: this.counter.count
      // })
      ShowComponent2({
        count: this.counter
      })
      Button("添加").onClick(() => {
        this.counter = new Counter(this.counter.count + 1)
      })
    }
  }
}

class Counter {
  count: number

  constructor(count: number) {
    this.count = count
  }
}

@Component
struct ShowComponent {
  @Prop count: number

  build() {
    Text(this.count.toString())
  }
}

@Component
struct ShowComponent2 {
  @Prop count: Counter

  build() {
    if (this.method()){
      Text(this.count.count.toString())
    }
  }

  private method() {
    if (this.count.count % 2 == 0) {
      console.log("sssssss " + this.count.count + ", " + 0)
    } else {
      console.log("sssssss " + this.count.count + ", " + 1)
    }
    return true
  }
}

@Entry
@Preview
@Component
struct TestStateAndPropPagePreview {
  build() {
    Stack() {
      TestStateAndPropPage()
    }
  }
}