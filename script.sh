
for i in 201601 201602 201603 201604 201605 201606 201607 201608 201609; do

wget https://witestlab.poly.edu/bikes/"$i"-citibike-tripdata.zip
unzip "$i"-citibike-tripdata.zip >> compile.csv
done
awk -F "\"*,\"*" '{print $5}' compile.csv > station.csv
awk -F "\"*,\"*" '{print $6}' compile.csv >> station.csv
sort station.csv
sort station.csv | uniq -c | sort -g -r > sstation.csv
head -q -n 1 sstation.csv > mostused.csv

