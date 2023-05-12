import 'package:gsheets/gsheets.dart';
import 'package:internal/user.dart';

class Userspread {
  static final _credentials=r'''
  {
  "type": "service_account",
  "project_id": "hazel-thunder-372810",
  "private_key_id": "110981d7df6cb70c66dd1e8be4210ad94661eb4a",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCToIrIHHDl9T6l\ncEZTWB4M13TywqkGuRWedBI0ePUWWkU4hYS7wFSWPg2fhLauEo5DQdehYGm2bct+\nEDOko+/DdHVc4b72P8JRTC3qxtdq1XVGSJT1r/U9Hkhgb3BtIcFulPcjm05kzHSW\n2HY9Gi7qVT2zCDYw9DtvI3ZjBM7Li8DkxYSyo7Ys+FXw/lz04if8VEsgafHA/v5V\nhLloNyQ/kbrMXmB3nY0ojLuQFmRTFwIrkeMVBZ7fvoUdsm9xTInBsBxuw5oC6Kwj\n6t3LlI/bwe0yJ4rfQnlHNzcumAUVhlhl4ISxR6RMziiN8Zyd04bvQU5SCZHJQS69\n0s1Cub7PAgMBAAECggEABwDG8Wg7/ASoXjokJxow6FekmH5SFo7bVWML/zyi4vBE\nUVwwG3H4it046zf+xhiWP0WIoGl0I+9m1FbNBFxMgh9sdwwBPl0KIq4nWkUb44yd\nt0hRKXh/4zbXcYLha/Cw5HlUYfZUZf628MLy+1unHX51Fbpn5UzPFvexMYOBLD5x\n++GCheQmcUL8AyTdhgjLoUMXIdT6aeWpgAaM7T8ALAokx5pnoCN7O4H+bChrB7ga\n2/VRjRrbYsIVWwGuSh4gx5B/e3/jiB3Ta//FWd3qQLXLPGmTrD1i8IwEcpyrJj32\np2MvSbh5SJU6oBRGa+3hVnRI9fO1EkT7CNycsugL0QKBgQDKINZ1hZMMko3qyi5c\nksFf5i0PVFxSoe07gGji01INb2lZYi2ttzVTEBUBjX24EZyV0jZb0O2Dl6vIBAa5\nc/8WrsXPJdbfLhtqpRvESJVRM8rgk+pjv7xLvzzWeZrEMbnY98F9s4PFGhwU/1sV\n3srglrTX3M3KnvwWcdWMWCCgvwKBgQC6+Rqglm9bCZ6PotEIkX/G3xAzzs+WgIBG\nhs/J+7UnsLvfuh1k9zTndsp0kr6vF/UVwkYvGRwb+NPgPuENxtrmkg59AwRPhRJD\n8Fy+fDssW24ylibQZZYBkJhD2eUF0s1J4sAaV3t5dx1JtLSCALpVvHzubjIZwh/3\nLscl/x1V8QKBgCnsX67mcpaD+y18m9sVkUgrvKLWU4PMFCFoQ9jwDa+9sPMaGvFR\n85xz1HeK+k1oUbr9a8rlba4Ckl2dACwM9BanT13kskl+Da+z6StwBpBeFrE33MCt\nrwdi9eJiPIh+69YlpRtGVYlXHgX45NKHcDre50lygbiJ+y1IlQtT6AiPAoGAAPG/\nI65+03vh9CHDYoKxnYSE5W4W+FCf1TtbE08VJCUtXbzn5xmkh8K+1QXktqetUjXP\n+u7qiG2iTFCk/FfTxTRZpGH+hJRMelFddozUE65GiTTe71CECG/9hOI12Oiupr/h\nboCgnAVw/W1POBTe3A3+p4mg8SZc2PfAg72dHVECgYEAtqQ0/lY0codXvnFGVMK8\n/DkuaW2KV4XOJ2NW8VvTDp7ASAtynR35yYNzF2JFone9EOSMFXsLu2T96+Pl7Isn\nakq8JtQmKf5HZRFrFJK5bYqZhwZwjgse6T1YmdL1e7Jtp7LDZiF2xawxFBmAM95S\n0mt3uyZiiBbt4gdPAUXZPz4=\n-----END PRIVATE KEY-----\n",
  "client_email": "internalgsheet@hazel-thunder-372810.iam.gserviceaccount.com",
  "client_id": "111578585146593580583",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/internalgsheet%40hazel-thunder-372810.iam.gserviceaccount.com"
}
  ''';
  static final _spreadsheetid = '1KfyL1063E4-PbGdASL9cqSoAowUZCB0MzlG498jrbXQ';
  static final _gsheets = GSheets(_credentials);
  static Worksheet?  _userSheet;

  static Future init( [String use = "AI"] ) async{
    final spreadsheets = await _gsheets.spreadsheet(_spreadsheetid);
    _userSheet = await _getWorkSheet(spreadsheets,title :use);
  }

  static Future<Worksheet> _getWorkSheet(
      Spreadsheet spreadsheet,{
      required String title,}
      )async{
    try {
      return await spreadsheet.addWorksheet(title);
    }catch(e){
         return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future<User?> getById(String regno) async{
    if(_userSheet == null) {
      return null;
    }
      final json = await _userSheet!.values.map.rowByKey(regno,fromColumn: 1);
      return json==null ? null:User.fromJson(json);
    }
  }



