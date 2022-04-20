inputFile = LOAD 'hdfs:///user/projank/episodeV_dialouges.txt' USING PigStorage('\t') AS (name:chararray,dial:chararray);
groupByName = group inputFile BY name;
names = FOREACH groupByName GENERATE $0 as name, COUNT($1) as no_of_lines;
namesOrdered = ORDER names BY no_of_lines DESC;
STORE namesOrdered INTO 'hdfs:///user/projank/results/episodeV_dialouges' USING PigStorage('\t');