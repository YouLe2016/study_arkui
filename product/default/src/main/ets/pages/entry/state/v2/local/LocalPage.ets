@Entry
@ComponentV2
struct LocalPage {
  @Local message: string = 'Hello World';
  @Local person: LocalPerson = new LocalPerson();

  build() {
    Column() {
      Text(this.message)
        .fontSize(26)
        .onClick(() => {
          this.message = 'Message'
        })
      Blank().height(10)
      Column() {
        Text("用户：")
        Text(`姓名：${this.person.name}`)
          .onClick(() => {
            this.person.name = "新名"
            console.debug("fdafsfas")
          })
        Text(`年龄：${this.person.age}`)
          .onClick(() => {
            const p = new LocalPerson();
            p.age = this.person.age + 1
            this.person = p
          })

      }
      .backgroundColor("#eeeeee")
      .borderRadius(5)
      .padding({
        left: 20, right: 20, top: 10, bottom: 10
      })
      .alignItems(HorizontalAlign.Start)
    }
    .height('100%')
    .width('100%')
  }
}

class LocalPerson {
  name: string = '张三'
  age: number = 18
}