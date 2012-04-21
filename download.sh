#!/bin/bash

wget http://dl.dropbox.com/u/3436237/unepwcmc/cites_trade_export.csv.zip || echo Error downloading
unzip cities_trade_export.csv.zip || echo Error unzipping
cat import.sql | sqlite3 cites.db || echo Error importing to sqlite
