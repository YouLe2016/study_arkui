@ComponentV2
struct TogglePage {
  @Local isOpen: boolean = false;

  build() {
    Column() {
      Toggle({ type: ToggleType.Switch, isOn: this.isOpen })
        .onChange((isOn: boolean) => {
          // 不知道为什么ArkUI如此设计，外部修改也会触发onChange回调。
          // Compose的Switch外部修改是不会回调onCheckedChange
          console.log('switch state: ' + isOn)
          this.isOpen = isOn
        })
      Button('Change', { type: ButtonType.Normal, stateEffect: true })
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .onClick(() => {
          console.log("click button")
          this.isOpen = !this.isOpen;
        })
    }
  }
}

@Entry
@Preview
@ComponentV2
struct TextInputPagePreview {
  build() {
    Column() {
      TogglePage()
    }
  }
}