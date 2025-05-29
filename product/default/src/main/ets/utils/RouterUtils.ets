import { router } from "@kit.ArkUI"

export class  RouterUtils {
  static openPage(path: string) {
    router.pushUrl({
      url: path
    })
  }
}