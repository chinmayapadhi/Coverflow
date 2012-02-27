import Qt 4.7
import "MusicDatabase.js" as MLib


ListModel {
    id: albumModel

    property string albumName: ""

    function loadMusic(aArtistName, aAlbumName) {
        albumModel.clear();
        albumModel.albumName = aAlbumName;
        MLib.fdb = openDatabaseSync("MusicPlayer", "1.0", "Music data", 10000);
        MLib.fdb.transaction(
            function(tx) {
                var rs = tx.executeSql('SELECT * FROM Music WHERE albumName = \"' + aAlbumName + '\" AND artistName = \"' + aArtistName + '\" ORDER BY sequence');
                // initialize list model from rs
                for (var i = 0; i < rs.rows.length; i++) {
                    albumModel.append({
                        "name": rs.rows.item(i).name,
                        "duration": rs.rows.item(i).duration,
                        "sequence": rs.rows.item(i).sequence,
                        "albumName": rs.rows.item(i).albumName,
                        "artistName": rs.rows.item(i).artistName,
                        "albumArt": rs.rows.item(i).albumArt
                    })
                }
            }
        )
    }
}
