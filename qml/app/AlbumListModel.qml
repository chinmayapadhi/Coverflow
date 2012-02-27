import Qt 4.7
import "MusicDatabase.js" as MLib

/*
    data model for tracks
*/

ListModel {
    id: albumListModel1

    function loadMusic() {
        MLib.fdb = openDatabaseSync("MusicPlayer", "1.0", "Music data", 10000);
        MLib.fdb.transaction(
            function(tx) {
                var rs = tx.executeSql('SELECT DISTINCT albumName, artistName, albumArt FROM Music ORDER BY albumName');
                // initialize list model from rs
                for (var i = 0; i < rs.rows.length; i++) {
                    albumListModel1.append({
                        "albumName": rs.rows.item(i).albumName,
                        "artistName": rs.rows.item(i).artistName,
                        "albumArt": rs.rows.item(i).albumArt
                    })
                }
            }
        )
    }
    Component.onCompleted: loadMusic()

}
