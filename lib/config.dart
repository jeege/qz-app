final String api = 'https://api-qn.ccsxhd.com';
final String apiXj = 'https://103.219.176.60';

const String dbName = 'test';
const String createHistoryTable = '''
        CREATE TABLE history_table (
            id INTEGER PRIMARY KEY, 
            imgUrl TEXT, 
            movieUrl TEXT, 
            title TEXT)
          ''';
