import { FormatDateConst } from "./FormatDateConst";

export class FormatDateUtils {
  /**
   * 获取时间
   * @param dateType
   * @param time
   * @param withDefault
   * @returns
   */
  public static getDate(dateType: FormatDateConst, time: string, withDefault: Boolean = true): Date | null {
    let result: Date | null = null
    if (time == null || time.length == 0) {
      result = new Date()
    } else {
      result = FormatDateUtils.parseDate(time, dateType);
      if (result == null && withDefault) {
        result = new Date()
      }
    }
    return result
  }

  /**
   * 获取时间
   * @param dateType
   * @param timeString
   * @returns
   */
  public static getLongTime(dateType: FormatDateConst, timeString: string): number {
    return FormatDateUtils.getDate(dateType, timeString)?.getTime() ?? 0
  }

  public static getTimeDefault(dateType: FormatDateConst): string {
    return FormatDateUtils.getTime(dateType, new Date().getTime())
  }

  /**
   * 获取时间
   *
   * @param dateType
   * @param time
   * @return
   */
  public static getTime(pattern: FormatDateConst, time: number): string {
    let date = new Date(time)
    let result = FormatDateUtils.formatDate(date, pattern)
    return result
  }

  /**
   * 格式化时间
   * @param pattern
   * @param date
   * @returns
   */
  public static getTimeWithDate(pattern: FormatDateConst, date: Date): string {
    let result = FormatDateUtils.formatDate(date, pattern)
    return result
  }
  /**
   * 获取当前时间
   *
   * @param dateType
   * @return
   */
  public static getNowTime(pattern: FormatDateConst): string {
    let date = new Date()
    let result = FormatDateUtils.formatDate(date, pattern)
    return result
  }

  /**
   * 转换时间至 00:00 格式
   */
  static formatTime(time: number): string {
    let buffer: string[] = [];
    buffer.push(FormatDateUtils.format(Math.floor(time / 60)));
    buffer.push(':');
    buffer.push(FormatDateUtils.format(time % 60));
    return buffer.join('');
  }

  /**
   * 格式化时间
   *
   * @returns 格式化后的时间字符串
   * @param time 时间（以分钟为单位的整数）
   */
  static format(time: number): string {
    return time >= 10 ? String(time) : `0${time}`;
  }

  static getSubscribeOrderTimeStr(sysTime: string, subscribeTime: string): string {
    let subscribeDate = FormatDateUtils.convertStringToDate(subscribeTime);
    let currentDate = FormatDateUtils.convertStringToDate(sysTime)
    if (subscribeDate == null || currentDate == null) {
      return subscribeTime;
    }
    let timeDifference = subscribeDate.getTime() - currentDate.getTime()
    if (timeDifference < 0) {
      return FormatDateUtils.getTime(FormatDateConst.MM_dd_HHmm, subscribeDate.getTime());
    } else {
      const noonStrings = ["今天", "明天", "后天"];
      const gc = new Date(subscribeDate);
      // 先设置成UTC时间，UTC会和东八区差8个小时，所以16点以后不用偏移
      gc.setUTCHours(16, 0, 0, 0);
      // 判断时间是否跨天，如果跨天了，那么0点肯定比预约时间晚
      let offset = 0;
      if (gc.getTime() > subscribeDate.getTime()) {
        offset = 1;
      } else {
        offset = 0;
      }
      const diff = gc.getTime() - currentDate.getTime();
      let daysTime = diff / (1000 * 60 * 60 * 24) - offset;
      let daysDiff = Math.trunc(daysTime);
      if (daysTime - daysDiff > 0) {
        daysDiff += 1;
      }
      if (daysDiff < noonStrings.length) {
        const hh_mm = FormatDateUtils.getTime(FormatDateConst.HHmm, subscribeDate.getTime());
        return `${noonStrings[daysDiff]} ${hh_mm}`;
      } else {
        return FormatDateUtils.getTime(FormatDateConst.MM_dd_HHmm, subscribeDate.getTime());
      }
    }
  }

  private static convertStringToDate(time?: string): Date | null {
    let result: Date | null = null;
    if (time) {
      const formats = [
        FormatDateConst.yyyy_MM_dd_HHmmss,
        FormatDateConst.yyyy_MM_dd_HHmm,
        FormatDateConst.yyyy_MM_dd
      ];
      for (const format of formats) {
        try {
          result = FormatDateUtils.getDate(format, time, false);
          if (result) {
            break;
          }
        } catch (e) {
        }
      }
      if (!result) {
        // 如果所有格式都失败了，则返回当前时间
        result = new Date();
      }
    } else {
      // 如果输入的时间为空，则返回当前时间
      result = new Date();
    }
    return result;
  }

  static timeDifference(bigTime: string, smallTime: string): number {
    let bigTimeLong = FormatDateUtils.getLongTime(FormatDateConst.yyyy_MM_dd_HHmmss, bigTime)
    let smallTimeLong = FormatDateUtils.getLongTime(FormatDateConst.yyyy_MM_dd_HHmmss, smallTime)
    return ((bigTimeLong - smallTimeLong) / 1000)
  }


  /**
   * 格式化时间
   * 调用formatDate(strDate, 'yyyy-MM-dd');
   * @param strDate（中国标准时间、时间戳等）
   * @param strFormat（返回格式）
   */
  static formatDate(strDate: Date, strFormat: string = 'yyyy-MM-dd'): string{
    if (!strDate) {
      return "";
    }
    const dict: Record<string, string> = {
      "yyyy": strDate.getFullYear() + "",
      "M": strDate.getMonth() + 1 + "",
      "d": strDate.getDate() + "",
      "H": strDate.getHours() + "",
      "m": strDate.getMinutes() + "",
      "s": strDate.getSeconds() + "",
      "MM": ('' + (strDate.getMonth() + 101)).substr(1),
      "dd": ('' + (strDate.getDate() + 100)).substr(1),
      "HH": ('' + (strDate.getHours() + 100)).substr(1),
      "mm": ('' + (strDate.getMinutes() + 100)).substr(1),
      "ss": ('' + (strDate.getSeconds() + 100)).substr(1),
    };
    return strFormat.replace(/(yyyy|MM?|dd?|HH?|mm?|ss?)/g, (match) => {
      return dict[match[0]];
    });
  }

  /**
   * 解析格式化时间字符串为Date对象
   * 调用parseDate('2023-10-05', 'yyyy-MM-dd');
   * @param dateString 时间字符串（如 "2023-10-05"）
   * @param strFormat 匹配的格式（如 "yyyy-MM-dd"）
   * @returns Date对象（解析失败返回null）
   */
  static parseDate(dateString: string, strFormat: string = 'yyyy-MM-dd'): Date | null {
    if (!dateString) return null;

    // 将格式转换为正则表达式（处理特殊字符）
    const formatRegex = strFormat
      .replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&') // 转义正则特殊字符
      .replace(/yyyy/g, '(\\d{4})')
      .replace(/MM/g, '(\\d{2})')
      .replace(/dd/g, '(\\d{2})')
      .replace(/HH/g, '(\\d{2})')
      .replace(/mm/g, '(\\d{2})')
      .replace(/ss/g, '(\\d{2})')
      .replace(/M/g, '(\\d{1,2})')
      .replace(/d/g, '(\\d{1,2})')
      .replace(/H/g, '(\\d{1,2})')
      .replace(/m/g, '(\\d{1,2})')
      .replace(/s/g, '(\\d{1,2})');

    const regex = new RegExp(`^${formatRegex}$`);
    const match = dateString.match(regex);

    if (!match) return null;

    // 提取日期组件
    const components: Record<string, number> = { };
    const formatParts = strFormat.match(/(yyyy|MM?|dd?|HH?|mm?|ss?)/g) || [];

    formatParts.forEach((part, index) => {
      const value = parseInt(match[index + 1], 10);
      switch (part) {
        case 'yyyy': components.year = value; break;
        case 'MM':
        case 'M': components.month = value - 1; break; // 月份从0开始
        case 'dd':
        case 'd': components.day = value; break;
        case 'HH':
        case 'H': components.hours = value; break;
        case 'mm':
        case 'm': components.minutes = value; break;
        case 'ss':
        case 's': components.seconds = value; break;
      }
    });

    return new Date(
      components.year,
      components.month,
      components.day,
      components.hours,
      components.minutes,
      components.seconds
    );
  }
}