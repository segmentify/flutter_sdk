/// Currency enum
/// This enum is used to define the currency type.
enum CurrencyTypes {
  AED,
  AFN,
  ALL,
  AMD,
  ANG,
  AOA,
  ARS,
  AUD,
  AWG,
  AZN,
  BAM,
  BBD,
  BDT,
  BGN,
  BHD,
  BIF,
  BMD,
  BND,
  BOB,
  BRL,
  BSD,
  BTN,
  BWP,
  BYN,
  BZD,
  CAD,
  CDF,
  CHF,
  CLP,
  CNY,
  COP,
  CRC,
  CUC,
  CUP,
  CVE,
  CZK,
  DJF,
  DKK,
  DOP,
  DZD,
  EGP,
  ERN,
  ETB,
  EUR,
  FJD,
  FKP,
  GBP,
  GEL,
  GGP,
  GHS,
  GIP,
  GMD,
  GNF,
  GTQ,
  GYD,
  HKD,
  HNL,
  HRK,
  HTG,
  HUF,
  IDR,
  ILS,
  IMP,
  INR,
  IQD,
  IRR,
  ISK,
  JEP,
  JMD,
  JOD,
  JPY,
  KES,
  KGS,
  KHR,
  KMF,
  KPW,
  KRW,
  KWD,
  KYD,
  KZT,
  LAK,
  LBP,
  LKR,
  LRD,
  LSL,
  LYD,
  MAD,
  MDL,
  MGA,
  MKD,
  MMK,
  MNT,
  MOP,
  MRU,
  MUR,
  MVR,
  MWK,
  MXN,
  MYR,
  MZN,
  NAD,
  NGN,
  NIO,
  NOK,
  NPR,
  NZD,
  OMR,
  PAB,
  PEN,
  PGK,
  PHP,
  PKR,
  PLN,
  PYG,
  QAR,
  RON,
  RSD,
  RUB,
  RWF,
  SAR,
  SBD,
  SCR,
  SDG,
  SEK,
  SGD,
  SHP,
  SLL,
  SOS,
  SRD,
  STN,
  SVC,
  SYP,
  SZL,
  THB,
  TJS,
  TMT,
  TND,
  TOP,
  TRY,
  TTD,
  TVD,
  TWD,
  TZS,
  UAH,
  UGX,
  USD,
  UYU,
  UZS,
  VEF,
  VND,
  VUV,
  WST,
  XAF,
  XCD,
  XDR,
  XOF,
  XPF,
  YER,
  ZAR,
  ZMW,
  ZWD
}

String getCurrencyType(CurrencyTypes type) {
  switch (type) {
    case CurrencyTypes.AED:
      return 'AED';
    case CurrencyTypes.AFN:
      return 'AFN';
    case CurrencyTypes.ALL:
      return 'ALL';
    case CurrencyTypes.AMD:
      return 'AMD';
    case CurrencyTypes.ANG:
      return 'ANG';
    case CurrencyTypes.AOA:
      return 'AOA';
    case CurrencyTypes.ARS:
      return 'ARS';
    case CurrencyTypes.AUD:
      return 'AUD';
    case CurrencyTypes.AWG:
      return 'AWG';
    case CurrencyTypes.AZN:
      return 'AZN';
    case CurrencyTypes.BAM:
      return 'BAM';
    case CurrencyTypes.BBD:
      return 'BBD';
    case CurrencyTypes.BDT:
      return 'BDT';
    case CurrencyTypes.BGN:
      return 'BGN';
    case CurrencyTypes.BHD:
      return 'BHD';
    case CurrencyTypes.BIF:
      return 'BIF';
    case CurrencyTypes.BMD:
      return 'BMD';
    case CurrencyTypes.BND:
      return 'BND';
    case CurrencyTypes.BOB:
      return 'BOB';
    case CurrencyTypes.BRL:
      return 'BRL';
    case CurrencyTypes.BSD:
      return 'BSD';
    case CurrencyTypes.BTN:
      return 'BTN';
    case CurrencyTypes.BWP:
      return 'BWP';
    case CurrencyTypes.BYN:
      return 'BYN';
    case CurrencyTypes.BZD:
      return 'BZD';
    case CurrencyTypes.CAD:
      return 'CAD';
    case CurrencyTypes.CDF:
      return 'CDF';
    case CurrencyTypes.CHF:
      return 'CHF';
    case CurrencyTypes.CLP:
      return 'CLP';
    case CurrencyTypes.CNY:
      return 'CNY';
    case CurrencyTypes.COP:
      return 'COP';
    case CurrencyTypes.CRC:
      return 'CRC';
    case CurrencyTypes.CUC:
      return 'CUC';
    case CurrencyTypes.CUP:
      return 'CUP';
    case CurrencyTypes.CVE:
      return 'CVE';
    case CurrencyTypes.CZK:
      return 'CZK';
    case CurrencyTypes.DJF:
      return 'DJF';
    case CurrencyTypes.DKK:
      return 'DKK';
    case CurrencyTypes.DOP:
      return 'DOP';
    case CurrencyTypes.DZD:
      return 'DZD';
    case CurrencyTypes.EGP:
      return 'EGP';
    case CurrencyTypes.ERN:
      return 'ERN';
    case CurrencyTypes.ETB:
      return 'ETB';
    case CurrencyTypes.EUR:
      return 'EUR';
    case CurrencyTypes.FJD:
      return 'FJD';
    case CurrencyTypes.FKP:
      return 'FKP';
    case CurrencyTypes.GBP:
      return 'GBP';
    case CurrencyTypes.GEL:
      return 'GEL';
    case CurrencyTypes.GGP:
      return 'GGP';
    case CurrencyTypes.GHS:
      return 'GHS';
    case CurrencyTypes.GIP:
      return 'GIP';
    case CurrencyTypes.GMD:
      return 'GMD';
    case CurrencyTypes.GNF:
      return 'GNF';
    case CurrencyTypes.GTQ:
      return 'GTQ';
    case CurrencyTypes.GYD:
      return 'GYD';
    case CurrencyTypes.HKD:
      return 'HKD';
    case CurrencyTypes.HNL:
      return 'HNL';
    case CurrencyTypes.HRK:
      return 'HRK';
    case CurrencyTypes.HTG:
      return 'HTG';
    case CurrencyTypes.HUF:
      return 'HUF';
    case CurrencyTypes.IDR:
      return 'IDR';
    case CurrencyTypes.ILS:
      return 'ILS';
    case CurrencyTypes.IMP:
      return 'IMP';
    case CurrencyTypes.INR:
      return 'INR';
    case CurrencyTypes.IQD:
      return 'IQD';
    case CurrencyTypes.IRR:
      return 'IRR';
    case CurrencyTypes.ISK:
      return 'ISK';
    case CurrencyTypes.JEP:
      return 'JEP';
    case CurrencyTypes.JMD:
      return 'JMD';
    case CurrencyTypes.JOD:
      return 'JOD';
    case CurrencyTypes.JPY:
      return 'JPY';
    case CurrencyTypes.KES:
      return 'KES';
    case CurrencyTypes.KGS:
      return 'KGS';
    case CurrencyTypes.KHR:
      return 'KHR';
    case CurrencyTypes.KMF:
      return 'KMF';
    case CurrencyTypes.KPW:
      return 'KPW';
    case CurrencyTypes.KRW:
      return 'KRW';
    case CurrencyTypes.KWD:
      return 'KWD';
    case CurrencyTypes.KYD:
      return 'KYD';
    case CurrencyTypes.KZT:
      return 'KZT';
    case CurrencyTypes.LAK:
      return 'LAK';
    case CurrencyTypes.LBP:
      return 'LBP';
    case CurrencyTypes.LKR:
      return 'LKR';
    case CurrencyTypes.LRD:
      return 'LRD';
    case CurrencyTypes.LSL:
      return 'LSL';
    case CurrencyTypes.LYD:
      return 'LYD';
    case CurrencyTypes.MAD:
      return 'MAD';
    case CurrencyTypes.MDL:
      return 'MDL';
    case CurrencyTypes.MGA:
      return 'MGA';
    case CurrencyTypes.MKD:
      return 'MKD';
    case CurrencyTypes.MMK:
      return 'MMK';
    case CurrencyTypes.MNT:
      return 'MNT';
    case CurrencyTypes.MOP:
      return 'MOP';
    case CurrencyTypes.MRU:
      return 'MRU';
    case CurrencyTypes.MUR:
      return 'MUR';
    case CurrencyTypes.MVR:
      return 'MVR';
    case CurrencyTypes.MWK:
      return 'MWK';
    case CurrencyTypes.MXN:
      return 'MXN';
    case CurrencyTypes.MYR:
      return 'MYR';
    case CurrencyTypes.MZN:
      return 'MZN';
    case CurrencyTypes.NAD:
      return 'NAD';
    case CurrencyTypes.NGN:
      return 'NGN';
    case CurrencyTypes.NIO:
      return 'NIO';
    case CurrencyTypes.NOK:
      return 'NOK';
    case CurrencyTypes.NPR:
      return 'NPR';
    case CurrencyTypes.NZD:
      return 'NZD';
    case CurrencyTypes.OMR:
      return 'OMR';
    case CurrencyTypes.PAB:
      return 'PAB';
    case CurrencyTypes.PEN:
      return 'PEN';
    case CurrencyTypes.PGK:
      return 'PGK';
    case CurrencyTypes.PHP:
      return 'PHP';
    case CurrencyTypes.PKR:
      return 'PKR';
    case CurrencyTypes.PLN:
      return 'PLN';
    case CurrencyTypes.PYG:
      return 'PYG';
    case CurrencyTypes.QAR:
      return 'QAR';
    case CurrencyTypes.RON:
      return 'RON';
    case CurrencyTypes.RSD:
      return 'RSD';
    case CurrencyTypes.RUB:
      return 'RUB';
    case CurrencyTypes.RWF:
      return 'RWF';
    case CurrencyTypes.SAR:
      return 'SAR';
    case CurrencyTypes.SBD:
      return 'SBD';
    case CurrencyTypes.SCR:
      return 'SCR';
    case CurrencyTypes.SDG:
      return 'SDG';
    case CurrencyTypes.SEK:
      return 'SEK';
    case CurrencyTypes.SGD:
      return 'SGD';
    case CurrencyTypes.SHP:
      return 'SHP';
    case CurrencyTypes.SLL:
      return 'SLL';
    case CurrencyTypes.SOS:
      return 'SOS';
    case CurrencyTypes.SRD:
      return 'SRD';
    case CurrencyTypes.STN:
      return 'STN';
    case CurrencyTypes.SVC:
      return 'SVC';
    case CurrencyTypes.SYP:
      return 'SYP';
    case CurrencyTypes.SZL:
      return 'SZL';
    case CurrencyTypes.THB:
      return 'THB';
    case CurrencyTypes.TJS:
      return 'TJS';
    case CurrencyTypes.TMT:
      return 'TMT';
    case CurrencyTypes.TND:
      return 'TND';
    case CurrencyTypes.TOP:
      return 'TOP';
    case CurrencyTypes.TRY:
      return 'TRY';
    case CurrencyTypes.TTD:
      return 'TTD';
    case CurrencyTypes.TVD:
      return 'TVD';
    case CurrencyTypes.TWD:
      return 'TWD';
    case CurrencyTypes.TZS:
      return 'TZS';
    case CurrencyTypes.UAH:
      return 'UAH';
    case CurrencyTypes.UGX:
      return 'UGX';
    case CurrencyTypes.USD:
      return 'USD';
    case CurrencyTypes.UYU:
      return 'UYU';
    case CurrencyTypes.UZS:
      return 'UZS';
    case CurrencyTypes.VEF:
      return 'VEF';
    case CurrencyTypes.VND:
      return 'VND';
    case CurrencyTypes.VUV:
      return 'VUV';
    case CurrencyTypes.WST:
      return 'WST';
    case CurrencyTypes.XAF:
      return 'XAF';
    case CurrencyTypes.XCD:
      return 'XCD';
    case CurrencyTypes.XDR:
      return 'XDR';
    case CurrencyTypes.XOF:
      return 'XOF';
    case CurrencyTypes.XPF:
      return 'XPF';
    case CurrencyTypes.YER:
      return 'YER';
    case CurrencyTypes.ZAR:
      return 'ZAR';
    case CurrencyTypes.ZMW:
      return 'ZMW';
    case CurrencyTypes.ZWD:
      return 'ZWD';
    default:
      throw Exception('Currency type is not defined.');
  }
}
