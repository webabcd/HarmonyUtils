/**
 * 路径相关
 */

export class PathHelper {

  /**
   * 路径拼接
   */
  static join(...parts: string[]): string {
    let result = '';
    for (let i = 0; i < parts.length; i++) {
      const part = parts[i];

      if (i === 0) {
        // 第一个部分保留开头斜杠（如果有）
        result = part.replace(/\/+$/, '');
      } else {
        // 后续部分移除开头和结尾斜杠
        const cleanPart = part.replace(/^\/+|\/+$/g, '');
        if (cleanPart) {
          result += `/${cleanPart}`;
        }
      }
    }

    // 处理特殊情况（如连续斜杠）
    return result.replace(/\/+/g, '/');
  }

  /**
   * 获取指定路径的父目录
   */
  static getParentDirectory(path: string): string {
    // 移除末尾的斜杠
    path = path.endsWith('/') ? path.slice(0, -1) : path;

    // 使用 '/' 分割路径，然后移除最后一部分
    const parts = path.split('/');
    parts.pop();

    if (parts.length === 0) {
      return '/';
    }

    // 将剩余的部分重新组合成一个路径
    return parts.join('/');
  }
}