@Entry
@Component
struct EditPage {
  @State show: boolean = true;

  aboutToAppear(): void {
    console.log("EditPage aboutToAppear")
  }

  onPageShow(): void {
    console.log("EditPage onPageShow")
  }
  onPageHide(): void {
    console.log("EditPage onPageHide")
  }

  aboutToDisappear(): void {
    console.log("EditPage aboutToDisappear")
  }

  logBuild() {
    console.log("EditPage build")
    return true
  }

  onBackPress(): boolean | void {
    console.log("EditPage onBackPress")
  }

  build() {
    if (this.logBuild()){
      RelativeContainer() {
        Text('编辑页面')
          .id('title')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })

        Button('切换子组件显示隐藏状态')
          .id('btn')
          .fontWeight(FontWeight.Bold)
          .alignRules({
            top: { anchor: 'title', align: VerticalAlign.Bottom },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
          .onClick((e) => {
            this.show = !this.show
          })

        if (this.show) {
          EditShowComponent()
            .id('show-view')
            .alignRules({
              top: { anchor: 'btn', align: VerticalAlign.Bottom },
              middle: { anchor: '__container__', align: HorizontalAlign.Center }
            })
            .margin({
              top: 16
            })
        }
      }
      .height('100%')
      .width('100%')
    }
  }
}

@Component
struct EditShowComponent {
  aboutToAppear(): void {
    console.log("EditPage ShowComponent aboutToAppear")
  }

  aboutToDisappear(): void {
    console.log("EditPage ShowComponent aboutToDisappear")
  }

  logBuild() {
    console.log("EditPage ShowComponent build")
    return true
  }

  build() {
    if (this.logBuild()) {
      Text("EditPage ShowComponent")
    }
  }
}