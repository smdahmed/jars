export HADOOP_USER_NAME=apankha; spark2-submit --master yarn --deploy-mode client --class com.macquarie.mar.MARApp hdfs://nameservice1/user/apankha/mar/macquarie-mar-0.4.5-SNAPSHOT-test-jar-with-dependencies.jar