create table cites (id integer, datatype_id integer, level integer, meaning text);
.separator "|"
.import cites_trade_export.csv test
