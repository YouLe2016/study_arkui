@Entry
@Preview
@ComponentV2
struct ObservedV2Page {
  private presenter: Presenter = new Presenter()

  build() {
    RelativeContainer() {
      Column() {
        Text(`姓名: ${this.presenter.person.name}`)
          .onClick(() => {
            this.presenter.changeName()
          })

        Text(`年龄: ${this.presenter.person.age}`)

        Text('地址: ')
        Text(`城市: ${this.presenter.person.address.city}`)
          .onClick(() => {
            this.presenter.changeCity()
          })
        Text(`区号: ${this.presenter.person.address.areaCode}`)

        Text('区县: ')
        ForEach(this.presenter.person.addressArr, (item: Address) => {
          Text(`城市：${item.city}, 区号: ${item.areaCode}`)
        }, (item: Address) => {
          return item.areaCode
        })
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

class Presenter {
  person: Person

  constructor() {
    this.person = new Person()
  }

  changeName() {
    this.person.name = '王五'
  }

  changeCity() {
    this.person.address.city = '上海'
    this.person.addressArr[0].city = '上海新区'
    this.person.addressArr[0].areaCode = '10000'
  }
}

@ObservedV2
class Person {
  @Trace name: string = '张三'
  @Trace age: number = 18
  @Trace address: Address = new Address()
  @Trace addressArr: Address[] = [
    new Address('昌平区', "001"),
    new Address('海淀区', "002"),
  ]
}

@ObservedV2
class Address {
  @Trace city: string
  @Trace areaCode: string

  constructor(city: string = '北京', areaCode: string = '100000') {
    this.city = city
    this.areaCode = areaCode
  }
}