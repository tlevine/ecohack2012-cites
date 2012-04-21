library(sqldf)
library(plyr)

top_taxa <- function(){
  top_10_taxa.df <- sqldf('select taxon_family, count(taxon_family) as "count" from cites group by taxon_family order by count(taxon_family) desc limit 10', dbname = 'cites.db')
  top_10_taxa <- top_10_taxa$count
  names(top_10_taxa) <- top_10_taxa$taxon_family
  barplot(top_10_taxa)
}

by_taxon_and_country <- function(){
  top_10_taxa_by_country <- sqldf('select shipment_year, export_country_code, taxon_family, sum(quantity_1) as "export" from cites where taxon_family in (select taxon_family from cites group by taxon_family order by count(taxon_family) desc limit 10) group by shipment_year || export_country_code || taxon_family;', dbname = 'cites.db')
  by_taxon <- ddply(top10, c('shipment_year', 'taxon_family'), function(df) { sum(df$export)})
  names(by_taxon)[3] <- 'exports'
  ggplot(by_taxon) + aes(x = shipment_year, y = 

  by_taxon <- ddply(top10, c('shipment_year', 'taxon_family'),function(df) { sum(df$export)}) 
  names(by_taxon)[3] <- 'exports'      
  pdf('byyear.pdf')
  plot(log(exports) ~ shipment_year, col = factor(by_taxon$taxon_family), data = by_taxon)

  hugechanges <- subset(by_taxon, taxon_family == 'Varanidae' | taxon_family == 'Crocodylidae'  | taxon_family == 'Ursidae')
  plot(log(exports) ~ shipment_year, col = factor(taxon_family), data = hugechanges)
  dev.off()
}


# Sudden changes
  # Down
    # Varanidae

  # Up
    # Crocodylidae
    # Ursidae

find_huge_changes <- function(by_taxon_and_country.df){
  by_taxon_and_country.df
}
