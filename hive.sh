set hive.input.format=org.apache.hadoop.hive.ql.io.HiveInputFormat;
set hive.stats.autogather=false;
add jar hdfs://quickstart.cloudera/user/cloudera/jars/hoodie-hadoop-mr-bundle-0.4.5-SNAPSHOT.hive11.jar;

CREATE EXTERNAL TABLE cgm_cmf.anand_demo(`_row_key`  STRING,
`_hoodie_commit_time` STRING,
`_hoodie_commit_seqno` STRING,
 trade_date STRING,
 bats STRING)
PARTITIONED BY (`datestr` string)
ROW FORMAT SERDE
   'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
   'com.uber.hoodie.hadoop.HoodieInputFormat'
OUTPUTFORMAT
   'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
   'hdfs://nameservice1/collab/cgm/cmf/demo_anand/';

ALTER TABLE `cgm_cmf.anand_demo` ADD IF NOT EXISTS PARTITION (datestr='2018-11-14') LOCATION 'hdfs://nameservice1/collab/cgm/cmf/demo_anand/';
ALTER TABLE `cgm_cmf.anand_demo` ADD IF NOT EXISTS PARTITION (datestr='2018-11-15') LOCATION 'hdfs://nameservice1/collab/cgm/cmf/demo_anand/';
ALTER TABLE `cgm_cmf.anand_demo` ADD IF NOT EXISTS PARTITION (datestr='2018-11-16') LOCATION 'hdfs://nameservice1/collab/cgm/cmf/demo_anand/';
