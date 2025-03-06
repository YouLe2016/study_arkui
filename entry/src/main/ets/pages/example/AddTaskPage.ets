import { LengthMetrics } from '@kit.ArkUI'
import { TaskModel } from '../../viewmodel/TaskModel'

@Entry
@ComponentV2
struct AddTaskPage {
  @Local bean: TaskModel = new TaskModel()
  private selectedDate: Date = new Date()

  showCalendarPickerDialog = () => {
    CalendarPickerDialog.show({
      selected: this.selectedDate,
      acceptButtonStyle: {
        fontColor: '#2787d9',
        fontSize: '16fp',
        backgroundColor: '#f7f7f7',
        borderRadius: 10
      },
      cancelButtonStyle: {
        fontColor: Color.Red,
        fontSize: '16fp',
        backgroundColor: '#f7f7f7',
        borderRadius: 10
      },
      onAccept: (date: Date) => {
        // 当弹出框再次弹出时显示选中的是上一次确定的日期
        this.selectedDate = date
        console.log(date.toString())
        console.log(date.toDateString())
        console.log(date.toLocaleDateString())
        console.log(date.toTimeString())
        console.log(date.toLocaleTimeString())
      }
    })
  }

  log = ()=> {
    console.log(`title = ${this.bean.title}`)
  }

  build() {
    Column() {
      Text($r("app.string.createTask"))
        .fontSize(26)
        .fontWeight(FontWeight.Bold)
        .onClick(this.log)

      Text($r("app.string.title"))
        .fontColor('#666666')
        .fontSize(16)
        .titleCommonStyle()
      TextInput({
        placeholder: $r("app.string.placeholder_inputTitle"),
        text: $$this.bean.title
      }).myShowUnderline()

      Text($r("app.string.date"))
        .titleTextStyle()
      TextInput({
        placeholder: $r("app.string.placeholder_inputDate")
      })
        .myShowUnderline()
        .onClick(this.showCalendarPickerDialog)

      Text($r("app.string.time"))
        .titleTextStyle()
      Row(){
        TextInput({
          placeholder: $r("app.string.placeholder_inputTime_start")
        }).myShowUnderline()
          .layoutWeight(1)
        Blank(10)
        TextInput({
          placeholder: $r("app.string.placeholder_inputTime_end")
        }) .myShowUnderline()
          .layoutWeight(1)
      }

      Text($r("app.string.description"))
        .titleTextStyle()
      TextInput({
        placeholder: $r("app.string.placeholder_inputDescription"),
        text: $$this.bean.description
      }) .myShowUnderline()

      Text($r("app.string.type"))
        .titleTextStyle()
      Row() {
        Radio({ value: 'type1', group: 'typeGroup' })
        Text("类型1")
        Blank().width(10)
        Radio({ value: 'type2', group: 'typeGroup' })
        Text("类型2")
      }
      .margin({ top: 10 })
      .width('100%')
      .justifyContent(FlexAlign.Start)

      Text($r("app.string.tag"))
        .titleTextStyle()

      Flex({
        wrap: FlexWrap.Wrap,
        space: {
          main: LengthMetrics.vp(5)
        },
      }) {
        Text("工作")
          .fontSize(12)
          .fontColor(Color.White)
          .backgroundColor(Color.Brown)
          .padding({ left: 4, right: 4, top: 4, bottom: 4})

        Text("娱乐")
          .fontSize(12)
          .fontColor(Color.White)
          .backgroundColor(Color.Gray)
          .padding({ left: 4, right: 4, top: 4, bottom: 4})
      }
      .margin({ top: 10 })
      .width('100%')
    }
    .height('100%')
    .width('100%')
    .padding(16)
  }

  // titleCommonStyle()方法，原来的位置
}

// 感觉放在外面更方便啊
@Styles
function titleCommonStyle() {
  // .backgroundColor(Color.Pink)
  // .align(Alignment.Start)

  // 设置Flex布局中的子元素的对齐方式
  .alignSelf(ItemAlign.Start)
  .margin({ top: 16 })
}

@Extend(Text)
function titleTextStyle(
  fontColor: ResourceColor = '#666666',
  fontSize: number | string | Resource = 16
) {
  // Error: Property 'titleCommonStyle' does not exist on type 'TextAttribute'.
  // .titleCommonStyle()

  .alignSelf(ItemAlign.Start)
  .margin({ top: 16 })
  .fontColor(fontColor)
  .fontSize(fontSize)
}

@Extend(TextInput)
function myShowUnderline() {
  // .borderRadius(0)
  // .backgroundColor(Color.Transparent)
  // ------------------------------------------------
  // .backgroundColor(Color.Pink)
  .fontColor('#333333')
  .fontSize(14)
  .showUnderline(true)
  .underlineColor('#666666')
  .placeholderColor('#ff120f99')
  .placeholderFont({
    size: 14,
  })
  .padding({ top: 8, bottom: 8 })
}


@Preview
@Component
struct AddTaskPagePreview {
  build() {
    Stack() {
      AddTaskPage()
    }
  }
}