import { RouterConst } from '../common/RouterConst';
import { RouterUtils } from '../utils/RouterUtils';

@Entry
@Component
struct HomePage {
  build() {
    Scroll() {
      Column() {
        Button($r('app.string.AddTask06')).onClick(() => {
          RouterUtils.openPage(RouterConst.PATH_ADD_TASK)
        })
        Button($r('app.string.Storage09')).onClick(() => {
          RouterUtils.openPage(RouterConst.PATH_STORAGE)
        })
      }
      .height('100%')
      .width('100%')
    }
  }
}