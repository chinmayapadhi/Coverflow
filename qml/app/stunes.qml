import Qt 4.7

Item {
//    property bool landscape: runtime.orientation===Orientation.Landscape | runtime.orientation===Orientation.LandscapeInverted
    property bool landscape: width > height

    property int longside: 640 // desktop.width
    property int shortside: 360 // desktop.height
    width: landscape ? longside : shortside
    height: landscape ? shortside : longside

    id: main

    AlbumListModel {
        id: albumListModel
    }

    AlbumModel {
        id: albumModel
    }

    ArtistListModel {
        id: artistListModel
    }

    TrackListModel {
        id: trackListModel
    }

    GenreListModel {
        id: genreListModel
    }

    // view main screen if in portrait mode
    MainScreen {
    }

    // view coverflow if in landscape mode
    Coverflow {
    }

    //Initialize music database
    MusicDb {
        id: musicDb
    }
}
