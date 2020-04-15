final String api = 'https://api-qn.ccsxhd.com';
final String apiXj = 'https://60901975hrz65e2i6345.xiangxiangapps.com';

const String dbName = 'test';
const String createHistoryTable = '''
        CREATE TABLE history_table (
            id INTEGER PRIMARY KEY, 
            imgUrl TEXT, 
            movieUrl TEXT, 
            title TEXT)
          ''';