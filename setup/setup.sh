hadoop fs -rm -R -f /tmp/wine_pred_hive
echo "deleted /tmp/wine_pred_hive"
hadoop fs -rm -R -f /tmp/wine_pred
echo "deleted /tmp/wine_pred"

hadoop fs -mkdir /tmp/wine_pred 
echo "created /tmp/wine_pred"
hadoop fs -mkdir /tmp/wine_pred_hive 
echo "created /tmp/wine_pred_hive"

hadoop fs -put /home/cdsw/data/WineNewGBTDataSet.csv /tmp/wine_pred
echo "copied /home/cdsw/data/WineNewGBTDataSet.csv -> hdfs://tmp/wine_pred"

echo "install requierements"
pip3 install -r ~/requierements.txt

echo "Create Hive Table"
python3 /home/cdsw/setup/create_hive_table.py