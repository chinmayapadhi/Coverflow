import Qt 4.7
import "MusicDatabase.js" as MLib

// Use MusicDatabase75 to create a database with ~75 albums, or MusicDatabase300 to create a database with ~300 albums
import "MusicDatabase75.js" as MLibRawData
//import "MusicDatabase300.js" as MLibRawData

ListModel {
    function loadMusicInitial(tx) {
        var i;
        for (i in MLibRawData.musicRawData) {
            var stmt = "INSERT INTO Music VALUES(NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            var data = [
                MLibRawData.musicRawData[i][0],
                MLibRawData.musicRawData[i][1],
                MLibRawData.musicRawData[i][2],
                MLibRawData.musicRawData[i][3],
                MLibRawData.musicRawData[i][4],
                MLibRawData.musicRawData[i][5],
                MLibRawData.musicRawData[i][6],
                MLibRawData.musicRawData[i][7],
                MLibRawData.musicRawData[i][8],
            ]
            tx.executeSql(stmt, data);
        }
    }

    function loadMusic() {
        // open database and create it if necessary
        MLib.fdb = openDatabaseSync("MusicPlayer", "1.0", "Music data", 10000);
        // retrieve data but also initialize it if necessary
        MLib.fdb.transaction(
            function(tx) {
                tx.executeSql('DROP TABLE IF EXISTS Music');
                tx.executeSql('CREATE TABLE Music(key INTEGER PRIMARY KEY AUTOINCREMENT, file TEXT, name TEXT, duration TEXT, sequence NUMBER, albumName TEXT, artistName TEXT, genre TEXT, year NUMBER, albumArt TEXT)');
                loadMusicInitial(tx);
            }
        )
    }
    Component.onCompleted: loadMusic()
}
