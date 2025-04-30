/**
 * 日志相关
 */

import hilog from '@ohos.hilog';
import * as model from './Model';

export class LogHelper {
  static DOMAIN: number = 0x0000;
  static TAG: string = 'webabcd';

  /**
   * 打印日志的级别
   * 如需全部打印则设置为 model.LogLevel.DEBUG
   *
   */
  static LOGLEVEL: model.LogLevel = model.LogLevel.DEBUG

  // 注：在 release 版本的 app 中不会打印 DEBUG 级别的日志
  public static d(message: string): void {
    if (LogHelper.LOGLEVEL <= model.LogLevel.DEBUG) {
      hilog.debug(LogHelper.DOMAIN, LogHelper.TAG, message);
    }
  }

  public static i(message: string): void {
    if (LogHelper.LOGLEVEL <= model.LogLevel.INFO) {
      hilog.info(LogHelper.DOMAIN, LogHelper.TAG, message);
    }
  }

  public static w(message: string): void {
    if (LogHelper.LOGLEVEL <= model.LogLevel.WARN) {
      hilog.warn(LogHelper.DOMAIN, LogHelper.TAG, message);
    }
  }

  public static e(message: string): void {
    if (LogHelper.LOGLEVEL <= model.LogLevel.ERROR) {
      hilog.error(LogHelper.DOMAIN, LogHelper.TAG, message);
    }
  }

  public static f(message: string): void {
    if (LogHelper.LOGLEVEL <= model.LogLevel.FATAL) {
      hilog.fatal(LogHelper.DOMAIN, LogHelper.TAG, message);
    }
  }
}