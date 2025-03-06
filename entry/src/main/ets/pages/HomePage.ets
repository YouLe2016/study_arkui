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
        Button($r('app.string.array_state_page')).onClick(() => {
          RouterUtils.openPage(RouterConst.PATH_ArrayStatePage)
        })
        Button($r('app.string.array_state_withP_page')).onClick(() => {
          RouterUtils.openPage(RouterConst.PATH_ArrayStateWithPresenterPage)
        })
      }
      .height('100%')
      .width('100%')
    }
  }
}