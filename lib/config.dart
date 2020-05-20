final String api = 'https://api-qn.ccsxhd.com';
final String apiXj = 'https://z6y6plo29y1h796el5sv.lagoapps.com';

const String dbName = 'test';
const String createHistoryTable = '''
        CREATE TABLE history_table (
            id INTEGER PRIMARY KEY, 
            imgUrl TEXT, 
            movieUrl TEXT, 
            title TEXT)
          ''';