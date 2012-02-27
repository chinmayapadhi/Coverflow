import Qt 4.7
import "MusicDatabase.js" as MLib

/*
    data model for tracks
*/

ListModel {
    id: artistListModel

    function loadMusic() {
        MLib.fdb = openDatabaseSync("MusicPlayer", "1.0", "Music data", 10000);
        MLib.fdb.transaction(
            function(tx) {
                var rs = tx.executeSql('SELECT DISTINCT artistName FROM Music ORDER BY artistName');
                // initialize list model from rs
                for (var i = 0; i < rs.rows.length; i++) {
                    artistListModel.append({
                        "artistName": rs.rows.item(i).artistName
                    })
                }
            }
        )
    }
    Component.onCompleted: loadMusic()

}
