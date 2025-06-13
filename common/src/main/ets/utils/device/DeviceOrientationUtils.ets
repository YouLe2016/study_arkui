import { common } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';

export class DeviceOrientationUtils {
  private static instance: DeviceOrientationUtils;

  private constructor() {
  }

  public static getInstance(): DeviceOrientationUtils {
    if (!DeviceOrientationUtils.instance) {
      DeviceOrientationUtils.instance = new DeviceOrientationUtils();
    }
    return DeviceOrientationUtils.instance;
  }

  public setOrientation(uiContext: UIContext, orientation: DeviceOrientation) {
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

  public async getOrientation(uiContext: UIContext): Promise<DeviceOrientation> {
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
}

export enum DeviceOrientation {
  PORTRAIT = '竖屏',
  LANDSCAPE = '横屏'
}