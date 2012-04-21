#!/bin/bash

wget http://dl.dropbox.com/u/3436237/unepwcmc/cites_trade_export.csv.zip || echo Error downloading
unzip cites_trade_export.csv.zip || echo Error unzipping
sed -e '2 d' -e '$ d' -e 's/ *\| */g' cites_trade_export.csv > cites_trade_export-cleaned.csv || echo Error removing the junk second row

cat import.sql | sqlite3 cites.db || echo Error importing to sqlite
