library(sqldf)

top_taxa <- function(){
  top_10_taxa.df <- sqldf('select taxon_family, count(taxon_family) as "count" from cites group by taxon_family order by count(taxon_family) desc limit 10', dbname = 'cites.db')
  top_10_taxa <- top_10_taxa$count
  names(top_10_taxa) <- top_10_taxa$taxon_family
  barplot(top_10_taxa)
}
