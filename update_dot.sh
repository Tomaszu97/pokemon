#!/bin/sh
sqlite3 pokemondb.sqlite .schema | python3 sql_graphviz.py > pokemon.dot

cat pokemon.dot | grep -vF 'port="PRIMARY"' | grep -vF 'port="CONSTRAINT"' > pokemon.dot.tmp
mv pokemon.dot.tmp pokemon.dot
sed '/"sqlite_sequence" \[/,/\];/d' pokemon.dot > pokemon.dot.tmp
mv pokemon.dot.tmp pokemon.dot
cat pokemon.dot | tr -d '`' > pokemon.dot.tmp
mv pokemon.dot.tmp pokemon.dot

echo "updated pokemon.dot"

dot -Tpng pokemon.dot > pokemon.png
echo "updated pokemon.png"

dot -Tsvg pokemon.dot > pokemon.svg
echo "updated pokemon.svg"
