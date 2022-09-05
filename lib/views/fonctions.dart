import 'dart:io';
import 'dart:typed_data';
import 'package:audiotagger/models/tag.dart';
import 'package:id3/id3.dart';
import 'home.dart';
import 'splash.dart';

List paths = [
  'storage/emulated/0/Android',
  'storage/emulated/0/MIUI',
  'storage/emulated/0/ringtone',
  'storage/emulated/0/Android',
  'storage/emulated/0/Android'
];
List getSongs() {
  Directory dir = Directory('/storage/emulated/0/');
  List<FileSystemEntity> _files;
  List<FileSystemEntity> my_files = [];
  List<FileSystemEntity> my_allfiles = [];
  List<FileSystemEntity> _songs = [];
  _files = dir.listSync();
  for (FileSystemEntity directory in _files) {
    if (directory is Directory &&
        (directory.path != '/storage/emulated/0/Android' &&
            directory.path != '/storage/emulated/0/MIUI')) {
      my_files = Directory(directory.path)
          .listSync(recursive: true, followLinks: true);
      my_allfiles.insertAll(my_allfiles.length, my_files);
    }
  }
  for (FileSystemEntity entity in my_allfiles) {
    String path = entity.path;
    if (path.endsWith('.mp3')) _songs.add(entity);
  }
  for (FileSystemEntity entity in _files) {
    String path = entity.path;
    if (path.endsWith('.mp3')) _songs.add(entity);
  }
  return _songs;
}

List<String> getArtist(List songlist) {
  List<String> artist = [];
  for (FileSystemEntity song in songlist) {
    List<int> mp3Bytes = File(song.path).readAsBytesSync();
    MP3Instance mp3instance = MP3Instance(mp3Bytes);
    if (mp3instance.parseTagsSync()) {
      if (mp3instance.getMetaTags() != null &&
          mp3instance.getMetaTags()?["Artist"] != null) {
        artist.add(mp3instance.getMetaTags()?["Artist"]);
      } else
        artist.add("null");
    } else
      artist.add("null");
  }
  return artist;
}

List<String> getAlbum(List songlist) {
  List<String> album = [];
  for (FileSystemEntity song in songlist) {
    List<int> mp3Bytes = File(song.path).readAsBytesSync();
    MP3Instance mp3instance = MP3Instance(mp3Bytes);
    if (mp3instance.parseTagsSync()) {
      if (mp3instance.getMetaTags() != null &&
          mp3instance.getMetaTags()?["Album"] != null) {
        album.add(mp3instance.getMetaTags()?["Album"]);
      }
    }
  }
  return album;
}

void getartwordk(List songs) async {
  for (FileSystemEntity song in songs) {
    final Uint8List? art = await getart(song.path);
    artwork.add(art);
  }
}

void getaudio(FileSystemEntity song) async {
  final file = await getaudiofile(song.path);
  print(file!.length);
}
