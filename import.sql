CREATE TABLE cites (
  appendix INTEGER,
  cites_taxon_code INTEGER,
  approved_taxon_code INTEGER,
  cites_name TEXT,
  export_country_code TEXT,
  import_country_code TEXT,
  origin_country_code TEXT,
  quantity_1 INTEGER,
  term_code_1 TEXT,
  unit_code_1 TEXT,
  taxon_family TEXT,
  purpose_code TEXT,
  source_code TEXT,
  reporter_type TEXT,
  shipment_number INTEGER,
  shipment_year INTEGER,
  global_trade INTEGER
);

CREATE INDEX cites_name ON cites(cites_name);
CREATE INDEX term_code_1 ON cites(term_code_1);
CREATE INDEX taxon_family ON cites(taxon_family);
CREATE INDEX shipment_year ON cites(shipment_year);

.separator "|"
.import cites_trade_export.csv cites
