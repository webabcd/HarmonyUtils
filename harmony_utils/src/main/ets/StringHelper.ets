/**
 * 字符串相关
 */

import { buffer, util } from "@kit.ArkTS";
import * as model from "./Model";

export class StringHelper {

  static isNull(str: string | undefined | null): boolean {
    return str === undefined || str === null;
  }

  static isEmpty(str: string | undefined | null): boolean {
    return str === undefined || str === null || str.length === 0;
  }

  static isBlank(str: string | undefined | null): boolean {
    if (StringHelper.isEmpty(str)) {
      return true;
    }
    return str!.trim().length === 0;
  }

  static arrayBufferToUint8Array(arrayBuffer: ArrayBuffer): Uint8Array {
    return new Uint8Array(arrayBuffer);
  }
  static uint8ArrayToArrayBuffer(uint8Array: Uint8Array): ArrayBuffer {
    return uint8Array.buffer;
  }

  static stringToUint8Array(str: string): Uint8Array {
    const encoder = new util.TextEncoder();
    const uint8Array = encoder.encodeInto(str);
    return uint8Array;
  }

  static uint8ArrayToString(uint8Array: Uint8Array, encoding: model.Encoding): string {
    if (encoding === 'base64') {
      return StringHelper.uint8ArrayToBase64(uint8Array)
    } else if (encoding === 'hex') {
      return StringHelper.uint8ArrayToHex(uint8Array)
    } else { // utf-8
      return buffer.from(uint8Array).toString('utf-8')
    }
  }

  static arrayBufferToString(arrayBuffer: ArrayBuffer | ArrayBufferLike, encoding: model.Encoding = 'utf-8'): string {
    if (encoding === 'base64') {
      return StringHelper.uint8ArrayToBase64(new Uint8Array(arrayBuffer))
    } else if (encoding === 'hex') {
      return StringHelper.uint8ArrayToHex(new Uint8Array(arrayBuffer))
    } else { // utf-8
      return buffer.from(arrayBuffer).toString('utf-8')
    }
  }

  static uint8ArrayToBase64(uint8Array: Uint8Array, type: model.Base64Type = 0): string {
    const base64Helper = new util.Base64Helper();
    return base64Helper.encodeToStringSync(uint8Array, Number(type));
  }

  static stringToBase64(str: string, type: model.Base64Type = 0): string {
    const uint8Array = StringHelper.stringToUint8Array(str)
    return StringHelper.uint8ArrayToBase64(uint8Array, type)
  }

  static base64ToUint8Array(base64: string, type: model.Base64Type = 0): Uint8Array {
    const base64Helper = new util.Base64Helper();
    return base64Helper.decodeSync(base64, Number(type));
  }

  static base64ToString(base64: string, type: model.Base64Type = 0): string {
    const uint8Array = StringHelper.base64ToUint8Array(base64)
    return StringHelper.arrayBufferToString(uint8Array.buffer)
  }

  static stringToHex(str: string): string {
    const uint8Array = StringHelper.stringToUint8Array(str)
    return StringHelper.uint8ArrayToHex(uint8Array)
  }

  static hexToString(str: string): string {
    const arrayBuffer = buffer.from(str, 'hex').buffer;
    return StringHelper.arrayBufferToString(arrayBuffer, "utf-8")
  }

  static uint8ArrayToHex(uint8Array: Uint8Array): string {
    return buffer.from(uint8Array).toString('hex');
  }
}