@Entry
@Component
struct Index {
  @State info: Info = new Info()

  build() {
    Column() {
      Column({ space: 10 }) {
        Text(this.info.name)
        CardViewShow({
          msgBean: this.info.msg
        })
        Button("修改 info.name").onClick(() => {
          this.info.name = '修改'
        })
        Button("修改 bean").onClick(() => {
          this.info.msg = new Message('修改')
        })
        Button("修改 info.msg.content").onClick(() => {
          this.info.msg.content = '修改11'
        })
      }

      CardView({
        info: this.info,
        clickListener: (msg) => {
          // AlertDialog.show({
          //   message: this.info.msg.content
          // })
          console.log('msg', msg)
          // this.info.msg.content = msg
          console.log('this.info.msg.content', this.info.msg.content)
        },
        msgClickListener: (msg) => {

        }
      })
    }
    .justifyContent(FlexAlign.SpaceAround)
    .height('100%')
  }
}

@Component
struct CardViewShow {
  @ObjectLink msgBean: Message
  build() {
    Text(JSON.stringify(this.msgBean))
  }
}

@Component
struct CardView {
  @Prop info: Info
  clickListener?: (msg: string) => void
  msgClickListener?: (msg: string) => void

  build() {
    Row() {
      Column({ space: 10 }) {
        Text(this.info?.name)
        Text(JSON.stringify(this.info.msg))
        Button("修改 info.name").onClick(() => {
          this.info.name = 'CardView 修改'
        })
        Button("修改 info.msg.content").onClick(() => {
          this.info.msg.content = 'CardView 修改'
          this.clickListener?.('CardView 修改')
        })
      }
      .padding(16)
      .width('100%')
    }
  }}

@Observed
class Info {
  name: string
  msg: Message = new Message()

  constructor(name: string = 'Info') {
    this.name = name
  }
}

@Observed
class Message {
  id: string = '123'
  content: string

  constructor(content: string = 'Message') {
    this.content = content
  }
}