from dumptruck import DumpTruck

dt = DumpTruck(dbname = 'cites.db')
top10 = dt.execute('''
select
  shipment_year, export_country_code, taxon_family,
  sum(quantity_1) as "export"
from cites where taxon_family in (
  select taxon_family from cites
  group by taxon_family
  order by count(taxon_family)
  desc limit 10
)

group by shipment_year || export_country_code || taxon_family
order by export_country_code, taxon_family, shipment_year

;''')

for i in range(len(top10) - 1):
  try:
    if top10[i]['taxon_family'] == top10[i+1]['taxon_family']:
      top10[i+1]['change_since_last_year'] = top10[i+1]['export'] - top10[i]['export']
    dt.insert(top10[i+1], 'changes_tmp', commit = False)
  except:
    dt.commit()
    raise

dt.insert(top10, 'changes')
