@Component
@Entry
struct TestWatchPage {
  @State bean: ShowCardBean = new ShowCardBean("你好，世界")
  build() {
    Column() {
      ShowCard({
        bean: this.bean
      })
      Button("点击").onClick(() => {
        // 跟上一次结果相同
        this.bean.str = "点击了"
      })
    }
  }
}

@Component
struct ShowCard {
  @Watch("onValueChanged") @Prop bean: ShowCardBean

  // 只调用了一次
  private onValueChanged() {
    console.log('onValueChanged', this.bean.str)
  }

  build() {
    Column() {
      // 只刷新了这一部分
      Text(this.bean.str)
        .text1Style()
        .backgroundColor(this.getRandomColor())
    }
    .padding(16)
    .backgroundColor(this.getRandomColor())
  }

  // 生成一个随机颜色
  private getRandomColor() {
    return "#" + Math.floor(Math.random() * 0xffffff).toString(16)
  }
}

class ShowCardBean {
  str: string

  constructor(str: string) {
    this.str = str
  }
}

@Extend(Text)
function text1Style() {
  .fontColor(Color.White)
}