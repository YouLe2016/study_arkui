@Entry
@Component
struct EditPage {
  @State message: string = '编辑页面';

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
        Text(this.message)
          .id('text')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .alignRules({
            center: { anchor: '__container__', align: VerticalAlign.Center },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
      }
      .height('100%')
      .width('100%')
    }
  }
}