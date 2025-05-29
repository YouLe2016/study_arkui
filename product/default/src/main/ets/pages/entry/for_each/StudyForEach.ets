@Entry
@Component
struct StudyForEach {
  //@State simpleList: Array<string> = ['one', 'two', 'three'];
  @State simpleList: Array<string> = ['one', 'two', 'two', 'three'];

  build() {
    Column() {
      Text('点击修改第3个数组项的值')
        .fontSize(24)
        .fontColor(Color.Red)
        .onClick(() => {
          this.simpleList[2] = this.simpleList[2] + '1';
        })
      ForEach(this.simpleList, (item: string, index: number) => {
        Row() {
          Badge({
            count: 1,
            position: BadgePosition.RightTop,
            style: { badgeSize: 16, badgeColor: '#FA2A2D' }
          }) {
            Text(`${index+1}`).width(80).height(80)
              .textAlign(TextAlign.Center)
          }

          PageItem({ item: item })
        }
      }, (item: string) => item)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Pink)
  }
}

@Component
struct PageItem {
  @Prop item: string
  build() {
    Text(this.item)
      .padding({
        top: 8, bottom: 8
      })
      .layoutWeight(1)
      .fontSize(24)
      .fontColor(Color.White)
      .backgroundColor(Color.Orange)
  }
}

@Preview
@Component
struct XX {
  build() {
    StudyForEach()
  }
}