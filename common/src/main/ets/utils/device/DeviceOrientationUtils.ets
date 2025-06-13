import { common } from '@kit.AbilityKit';
import { mediaquery, window } from '@kit.ArkUI';

export class DeviceOrientationUtils {
  private static instance: DeviceOrientationUtils;

  private constructor() {
  }

  static getInstance(): DeviceOrientationUtils {
    if (!DeviceOrientationUtils.instance) {
      DeviceOrientationUtils.instance = new DeviceOrientationUtils();
    }
    return DeviceOrientationUtils.instance;
  }

  setOrientation(uiContext: UIContext, orientation: DeviceOrientation) {
    // 获取UIAbility实例的上下文信息
    const context = uiContext.getHostContext() as common.UIAbilityContext;
    // 调用该接口手动改变设备横竖屏状态
    window.getLastWindow(context)
      .then((lastWindow) => {
        lastWindow.setPreferredOrientation(
          orientation == DeviceOrientation.LANDSCAPE ? window.Orientation.LANDSCAPE : window.Orientation.PORTRAIT
        )
      });
  }

  async getOrientation(uiContext: UIContext): Promise<DeviceOrientation> {
    // 获取UIAbility实例的上下文信息
    const context = uiContext.getHostContext() as common.UIAbilityContext;
    // 调用该接口手动改变设备横竖屏状态
    const lastWindow = await window.getLastWindow(context)
    let orientation = lastWindow.getPreferredOrientation()
    if (orientation == window.Orientation.LANDSCAPE) {
      return DeviceOrientation.LANDSCAPE
    } else {
      return DeviceOrientation.PORTRAIT
    }
  }

  private listener?: mediaquery.MediaQueryListener

  /**
   * 需要监听屏幕方向变化时调用。注意：记得调用unregister()
   *
   * @param uiContext
   * @param callback
   */
  register(uiContext: UIContext, callback: (orientation: DeviceOrientation) => void) {
    // 绑定当前应用实例
    // 绑定回调函数
    // 当设备横屏时条件成立
    this.listener = uiContext.getMediaQuery().matchMediaSync('(orientation: landscape)');
    // 绑定回调函数
    this.listener.on('change', (mediaQueryResult: mediaquery.MediaQueryResult) => {
      const result = mediaQueryResult.matches as boolean
      // 【注意】这里会调用2次
      // Fix: 现在只会调用一次了，我并没有改似乎已经修复了，很奇怪啊！2025-06-13
      console.log("onPortrait: isLandscape=" + result)

      // 当满足媒体查询条件时，触发回调
      if (result) {
        callback(DeviceOrientation.LANDSCAPE)
      } else {
        callback(DeviceOrientation.PORTRAIT)
      }
    });
  }

  unregister() {
    // 解绑listener中注册的回调函数
    this.listener?.off('change');
    this.listener = undefined
  }
}

export enum DeviceOrientation {
  PORTRAIT = '竖屏',
  LANDSCAPE = '横屏'
}