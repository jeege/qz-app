final String api = 'https://api-qn.ccsxhd.com';
final String apiXj = 'https://3z0f9o27whr6zhy2c66z.guoguoapps.com';

const String dbName = 'test';
const String createHistoryTable = '''
        CREATE TABLE history_table (
            id INTEGER PRIMARY KEY, 
            imgUrl TEXT, 
            movieUrl TEXT, 
            title TEXT)
          ''';