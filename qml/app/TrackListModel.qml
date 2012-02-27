import Qt 4.7
import "MusicDatabase.js" as MLib

ListModel {
    id: trackListModel
    function loadMusic() {
        MLib.fdb = openDatabaseSync("MusicPlayer", "1.0", "Music data", 10000);
        MLib.fdb.transaction(
            function(tx) {
                var rs = tx.executeSql('SELECT name, artistName, albumName FROM Music ORDER BY name');
                // initialize list model from rs
                for (var i = 0; i < rs.rows.length; i++) {
                    trackListModel.append({
                        "name": rs.rows.item(i).name,
                        "artistName": rs.rows.item(i).artistName,
                        "albumName": rs.rows.item(i).albumName
                    })
                }
            }
        )
    }
    Component.onCompleted: loadMusic()
}
