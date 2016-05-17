import psycopg2 as pg

# polaczenie do bazy 
con = None
con = pg.connect(database='pojazdy', user='admin') # wczesniej stworzony uzytkownik 'admin'
cur = con.cursor(cursor_factory=psycopg2.extras.DictCursor)
cur.execute('SELECT VERSION()')
ver = cur.fetchone()
print ver

# sredni rok pojazdow
cur.execute('SELECT * FROM "Pojazdy"')
rows = cur.fetchall()
years = []
for row in rows:
  year.append(row['rok'])
print 'Sredni rok pojazdow: ' + str(reduce(lambda x, y: x + y, years) / len(years))

# srednia pojemnosc pojazdow
cur.execute('SELECT * FROM "Silniki"')
rows = cur.fetchall()
capacities = []
for row in rows:
  capacities.append(row['Pojemnosc'])
print ' Srednia pojemnosc pojazdow: ' + str(reduce(lambda x, y: x + y, capacities) / len(capacitites))