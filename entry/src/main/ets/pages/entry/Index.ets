import { router } from '@kit.ArkUI'
import { common, Want } from '@kit.AbilityKit'
import { BusinessError } from '@kit.BasicServicesKit'

@Entry
@Component
struct Index {
  msg: string = '首页'
  ctx: common.UIAbilityContext = getContext(this) as common.UIAbilityContext

  build() {
    Row() {
      Column({ space: 10 }) {
        Text(this.msg)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('跳转编辑页').onClick(() => {
          // 普通跳转，下一个页面可以返回此页面
          router.pushUrl({
            url: "pages/entry/EditPage"
          })
        })

        Button('跳转详情页').onClick(() => {
          router.pushUrl({
            url: "pages/entry/DetailPage"
          })
        })

        Button('跳转OtherAbility').onClick(() => {
          const wantInfo: Want = {
            // 空表示本设备
            deviceId: '',
            // 包名。app.json5
            bundleName: "com.example.myapplication",
            // 模块名。module.json5
            moduleName: 'entry',
            // UIAbility
            abilityName: 'OtherAbility',
            parameters: {
              info: '来自EntryAbility的参数'
            }
          }
          this.ctx.startAbility(wantInfo)
            .then(()=>{
              console.log("跳转成功")
            }).catch((err: BusinessError)=>{
              console.log("跳转失败: " + err)
            })
        })
      }
      .padding(16)
      .width('100%')
    }
    .height('100%')
  }
}

console.log("看一下有没有")

let arr: Array<string> | undefined | null = []
let str: string = ''

console.log(`${arr == undefined}, ${arr == null}`)
console.log(`${arr[11]}`)
str = arr[11]
console.log("str1", str, typeof str)
str = 'undefined'
console.log("str2", str, typeof str)

@Preview
@Component
struct XX {
  build() {
    Index()
  }
}