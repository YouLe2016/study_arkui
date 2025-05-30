export class BreakpointConstants {
  /**
   * 当前断点常量
   */
  static readonly CurrentBreakpointKey: string = 'CurrentBreakpoint'

  /**
   * 断点名称：SM。表示折叠屏
   */
  static readonly Breakpoint_SM: string = 'sm'
  /**
   * 断点名称：MD。表示手机
   */
  static readonly Breakpoint_MD: string = 'md'
  /**
   * 断点名称：LG。表示平板
   */
  static readonly Breakpoint_LG: string = 'lg'

  /**
   * 断点数组
   */
  static readonly BreakpointValues: string[] = ['320vp', '600vp', '840vp']

  /**
   * SM断点列数
   */
  static readonly Column_SM = 4
  /**
   * MD断点列数
   */
  static readonly Column_MD = 8
  /**
   * LG断点列数
   */
  static readonly Column_LG = 12


  /**
   * SM断点字体大小
   */
  static readonly FontSize_SM = 14
  /**
   * MD断点字体大小
   */
  static readonly FontSize_MD = 16
  /**
   * LG断点字体大小
   */
  static readonly FontSize_LG = 18

  /**
   * SM断点范围
   */
  static readonly Range_SM: string = '(320vp<=width<=600vp)'
  /**
   * MD断点范围
   */
  static readonly Range_MD: string = '(600vp<width<=840vp)'
  /**
   * LG断点范围
   */
  static readonly Range_LG: string = '(840vp<width)'
}
