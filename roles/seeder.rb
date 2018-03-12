name "seeder"
description "Torrent seeding"

override_attributes(
  "transmission-debian" => {
                            "torrents" => [
                                           "file:///tmp/[TYT]NCAAF.2016.Week.13.TCU.at.Texas.720p.TYT.mkv.torrent"
      ]
  }
)

run_list(
  "recipe[transmission-debian::default]",
  "recipe[transmission-debian::torrents]"
  )
