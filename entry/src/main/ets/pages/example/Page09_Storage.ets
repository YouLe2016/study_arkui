import { LocalStorageConst } from "../../common/LocalStorageConst"
import { StorageChild } from "../../components/StorageChild"

// 初始化方式一
const storage: LocalStorage = new LocalStorage()
storage.setOrCreate(LocalStorageConst.KEY_USERNAME, "小王")
// 会多次执行。每次打开这个页面都会执行一次，返回这个页面还没有测试。
// 进入一个页面有打开和返回两种形式
console.log("LocalStorage 初始化")

// 初始化方式二
// const para: Record<string, number> = { 'PropA': 47 }
// const storage: LocalStorage = new LocalStorage(para)

@Entry(storage)
@Component
export struct Page09_Storage {
  @State message: string = "Page09_Storage"
  @LocalStorageProp(LocalStorageConst.KEY_USERNAME) username: string = "默认值"
  @LocalStorageLink(LocalStorageConst.KEY_USERNAME) username2: string = "默认值"
  clickUsername = () => {
    this.username += 1
  }
  clickUsername2 = () => {
    this.username2 += 2
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(26)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Bold)
      Text(this.username)
        .fontSize(20)
        .onClick(this.clickUsername)
      Text(this.username2)
        .fontSize(20)
        .fontColor(Color.Orange)
        .onClick(this.clickUsername2)
      StorageChild()
    }
  }
}

@Preview
@Component
struct Page09_StoragePreview {
  build() {
    Page09_Storage()
  }
}