// 数据源不变
// 在数据源保持不变的场景中，数据源可以直接采用基本数据类型。例如，在页面加载状态时，可以使用骨架屏列表进行渲染展示。
// 在本示例中，采用数据项item作为键值生成规则，由于数据源simpleList的数组项各不相同，因此能够保证键值的唯一性。
@Entry
@Component
struct ArticleList {
  @State simpleList: Array<number> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];

  build() {
    Scroll(){
      Column() {
        ForEach(this.simpleList, (_: number) => {
          ArticleSkeletonView()
            .margin({ top: 20 })
        }, (item: number) => item.toString())
      }
    }
    .padding(20)
    .width('100%')
    .height('100%')
  }
}

@Builder
function textArea(
  width: number | Resource | string = '100%',
  height: number | Resource | string = '100%'
) {
  Row()
    .width(width)
    .height(height)
    .backgroundColor('#FFF2F3F4')
}

@Component
struct ArticleSkeletonView {
  build() {
    Row() {
      Column() {
        textArea(80, 80)
      }
      .margin({ right: 20 })

      Column() {
        textArea('60%', 20)
        textArea('50%', 20)
      }
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.SpaceAround)
      .height('100%')
    }
    .padding(20)
    .borderRadius(12)
    .backgroundColor('#FFECECEC')
    .height(120)
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

@Preview
@Component
struct XX {
  build() {
    ArticleList()
  }
}