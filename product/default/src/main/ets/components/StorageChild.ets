import { LocalStorageConst } from "../common/LocalStorageConst"

@Component
export struct StorageChild {
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
      Text("StorageChild")
      Text(this.username)
        .fontSize(20)
        .onClick(this.clickUsername)
      Text(this.username2)
        .fontSize(20)
        .fontColor(Color.Green)
        .onClick(this.clickUsername2)
    }
  }
}

@Preview
@Component
struct StorageChildPreview {
  build() {
    StorageChild()
  }
}