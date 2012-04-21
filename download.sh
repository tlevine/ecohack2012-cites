#!/bin/bash

wget http://dl.dropbox.com/u/3436237/unepwcmc/cites_trade_export.csv.zip || echo Error downloading
unzip cites_trade_export.csv.zip || echo Error unzipping
sed -in '2 d' cites_trade_export.csv || echo Error removing the junk second row

cat import.sql | sqlite3 cites.db || echo Error importing to sqlite
