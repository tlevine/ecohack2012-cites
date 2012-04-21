#!/bin/bash

wget http://dl.dropbox.com/u/3436237/unepwcmc/cites_trade_export.csv.zip || echo Error downloading
unzip cites_trade_export.csv.zip || echo Error unzipping
sed -i -e '2 d' -e '$ d' cites_trade_export.csv || echo Error removing the junk second row

cat import.sql | sqlite3 cites.db || echo Error importing to sqlite
