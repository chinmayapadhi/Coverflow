import Qt 4.7
import "MusicDatabase.js" as MLib

/*
    data model for genres
*/

ListModel {
    id: genreListModel1

    function loadMusic() {
        MLib.fdb = openDatabaseSync("MusicPlayer", "1.0", "Music data", 10000);
        MLib.fdb.transaction(
            function(tx) {
                var rs = tx.executeSql('SELECT DISTINCT genre FROM Music');
                // initialize list model from rs
                for (var i = 0; i < rs.rows.length; i++) {
                    genreListModel1.append({
                        "genre": rs.rows.item(i).genre
                    })
                }
            }
        )
    }
    Component.onCompleted: loadMusic()

}
