@Component
@Entry
struct TestWatchPage {
  @State msg: string = "你好，世界"
  build() {
    Column() {
      ShowCard({
        str: this.msg
      })
      Button("点击").onClick(() => {
        this.msg = "点击了"
      })
    }
  }
}

@Component
struct ShowCard {
  @Watch("onValueChanged") @Prop str: string

  // 只调用了一次
  private onValueChanged() {
    console.log('onValueChanged', this.str)
  }

  build() {
    Column() {
      // 只刷新了这一部分
      Text(this.str)
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
  str: string = ""
}

@Extend(Text)
function text1Style() {
  .fontColor(Color.White)
}