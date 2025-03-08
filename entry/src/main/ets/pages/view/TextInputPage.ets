@ComponentV2
struct TextInputPage {
  @Local message: string = 'Hello World';

  // 这种写法有点意思，感觉和vue有点像。一般都是在控件那部分写回调方法，调用普通函数
  clickButton = () => {
    this.message = 'Hello World';
  }

  build() {
    Column() {
      TextInput( {
        text: this.message,
        placeholder: '请输入内容',
      }).onChange((value: string) => {
        console.info(value);
        this.message = value
      })
        .onFocus(() => {
          console.info('获取焦点');
        })
      Button('Ok', { type: ButtonType.Normal, stateEffect: true })
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .onClick(this.clickButton)
    }
  }
}

@Entry
@Preview
@Component
struct TextInputPagePreview {
  build() {
    Column() {
      TextInputPage()
    }
  }
}