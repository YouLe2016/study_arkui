import { mediaquery } from '@kit.ArkUI';
import { BreakpointConstants } from '../constants/BreakpointConstants';

export class BreakpointSystem {
  private static instance: BreakpointSystem;

  private constructor() {
  }

  public static getInstance(): BreakpointSystem {
    if (!BreakpointSystem.instance) {
      BreakpointSystem.instance = new BreakpointSystem();
    }
    return BreakpointSystem.instance;
  }

  private smListener?: mediaquery.MediaQueryListener
  private mdListener?: mediaquery.MediaQueryListener
  private lgListener?: mediaquery.MediaQueryListener

  private onBreakpointChanged(breakpoint: string, mediaQueryResult: mediaquery.MediaQueryResult) {
    const result = mediaQueryResult.matches as boolean
    console.log("onBreakpointChanged: key=" + breakpoint + ', result = ' + result)
    if (result) {
      this.updateCurrentBreakpoint(breakpoint)
    }
  }

  private currentBreakpoint: string = ''

  private updateCurrentBreakpoint(breakpoint: string) {
    if (this.currentBreakpoint == breakpoint) {
      return
    }
    AppStorage.setOrCreate<string>(BreakpointConstants.CurrentBreakpointKey, breakpoint)
  }

  register() {
    this.smListener = mediaquery.matchMediaSync(BreakpointConstants.Range_SM)
    this.smListener.on('change', (mediaQueryResult: mediaquery.MediaQueryResult) => {
      this.onBreakpointChanged(BreakpointConstants.Breakpoint_SM, mediaQueryResult)
    });
    this.mdListener = mediaquery.matchMediaSync(BreakpointConstants.Range_MD)
    this.mdListener.on('change', (mediaQueryResult: mediaquery.MediaQueryResult) => {
      this.onBreakpointChanged(BreakpointConstants.Breakpoint_MD, mediaQueryResult)
    })
    this.lgListener = mediaquery.matchMediaSync(BreakpointConstants.Range_LG)
    this.lgListener.on('change', (mediaQueryResult: mediaquery.MediaQueryResult) => {
      this.onBreakpointChanged(BreakpointConstants.Breakpoint_LG, mediaQueryResult)
    })
  }

  unregister() {
    this.smListener?.off('change')
    this.smListener = undefined
    this.mdListener?.off('change')
    this.mdListener = undefined
    this.lgListener?.off('change')
    this.lgListener = undefined
  }
}
