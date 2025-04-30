export type Encoding = 'base64' | 'hex' | 'utf-8';

export enum LogLevel {
  DEBUG,
  INFO,
  WARN,
  ERROR,
  FATAL,
  NONE
}

export enum Base64Type {

  /**
   * 编码字符集 A-Z, a-z, 0-9, + /
   * 填充符 =
   */
  BASIC,

  /**
   * 在 BASIC 的基础上，每 76 个字符插入一个回车换行符（CRLF）
   * CRLF 就是 \r\n
   */
  MIME,

  /**
   * 编码字符集 A-Z, a-z, 0-9, - _
   * 无填充符
   */
  BASIC_URL_SAFE,

  /**
   * 在 BASIC_URL_SAFE 的基础上，每 76 个字符插入一个回车换行符（CRLF）
   * CRLF 就是 \r\n
   */
  MIME_URL_SAFE
}
