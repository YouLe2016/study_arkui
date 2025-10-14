import prompt from '@ohos.promptAction';

@Entry
@Preview
@ComponentV2
struct ObservedV2Page {
  person: Person = new Person();

  build() {
    RelativeContainer() {
      Column() {
        Text(`姓名: ${this.person.name}`)
          .onClick(() => {
            this.person.name = '李四'
            // 添加Toast提示
            prompt.showToast({ message: `姓名已更新为: ${this.person.name}` })
          })

        Text(`年龄: ${this.person.age}`)

        Text('地址: ')
        Text(`城市: ${this.person.address.city}`)
          .onClick(() => {
            this.person.address.city = '上海'
            /*// 这样写也可以
            const address = this.person.address
            address.city = '上海'*/
          })
        Text(`区号: ${this.person.address.areaCode}`)
      }
      .alignItems(HorizontalAlign.Start)
      .id('CenterMessage')
      .alignRules({
        center: { anchor: '__container__', align: VerticalAlign.Center },
        middle: { anchor: '__container__', align: HorizontalAlign.Center }
      })
    }
    .height('100%')
    .width('100%')
  }
}

@ObservedV2
class Person {
  @Trace name: string = '张三'
  @Trace age: number = 18
  @Trace address: Address = new Address()
}

@ObservedV2
class Address {
  @Trace city: string = '北京'
  @Trace areaCode: string = '100000'
}