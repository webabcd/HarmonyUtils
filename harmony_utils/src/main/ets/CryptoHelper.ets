/**
 * 加解密相关
 */

import { cryptoFramework } from '@kit.CryptoArchitectureKit';
import * as model from "./Model";
import { StringHelper } from './StringHelper';

export class CryptoHelper {

  /**
   * md5
   */
  static md5(str: string, encoding: model.Encoding = 'hex'): string {
    let md = cryptoFramework.createMd('MD5');
    md.updateSync({
      data: StringHelper.stringToUint8Array(str)
    });
    let dataBlob = md.digestSync();
    let result = StringHelper.uint8ArrayToString(dataBlob.data, encoding);

    return result;
  }
}



