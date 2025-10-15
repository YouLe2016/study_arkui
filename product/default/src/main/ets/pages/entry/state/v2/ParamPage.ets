@Entry
@ComponentV2
struct LocalPage {
  @Local message: string = 'Hello World';
  person: ParamPerson = new ParamPerson();

  build() {
    Column() {
      Text(this.message)
        .fontSize(26)
        .onClick(() => {
          this.message = 'Message'
        })
      Blank().height(10)

      PersonComponent({
        message: this.message,
        person: this.person,
        callback: {
          onClickName: () => {
            this.person.name = "新名"
          },
          onClickAge: (age: number) => {
            this.person.age = age + 1
          },
          onClickMessage: () => {
            this.message = "欢迎"
          }
        }
      })
        .backgroundColor("#eeeeee")
        .borderRadius(5)
        .padding({
          left: 20,
          right: 20,
          top: 10,
          bottom: 10
        })
    }
    .height('100%')
    .width('100%')
  }
}

@ComponentV2
struct PersonComponent {
  @Param message: string = "abc"
  @Param @Require person: ParamPerson
  @Event callback: PersonComponentCallback

  build() {
    Column() {
      Text(this.message)
        .onClick(this.callback.onClickMessage)
      Text("用户：")
      Text(`姓名：${this.person.name}`)
        .onClick(this.callback.onClickName)
      Text(`年龄：${this.person.age}`)
        .onClick(() => {
          this.callback.onClickAge(this.person.age)
        })
    }
    .alignItems(HorizontalAlign.Start)
  }
}

interface PersonComponentCallback {
  onClickName: () => void
  onClickAge: (age: number) => void
  onClickMessage: () => void
}

@ObservedV2
class ParamPerson {
  @Trace name: string = '张三'
  @Trace age: number = 18
}