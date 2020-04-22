hadoop fs -rm -R -f $STORAGE/datalake/tmp/wine_pred_hive
echo "deleted $STORAGE/datalake/tmp/wine_pred_hive"
hadoop fs -rm -R -f $STORAGE/datalake/tmp/wine_pred
echo "deleted $STORAGE/datalake/tmp/wine_pred"

hadoop fs -mkdir $STORAGE/datalake/tmp/wine_pred 
echo "created $STORAGE/datalake/tmp/wine_pred"
hadoop fs -mkdir $STORAGE/datalake/tmp/wine_pred_hive 
echo "created $STORAGE/datalake/tmp/wine_pred_hive"

hadoop fs -put /home/cdsw/data/WineNewGBTDataSet.csv $STORAGE/datalake/tmp/wine_pred
echo "copied /home/cdsw/data/WineNewGBTDataSet.csv -> $STORAGE/tmp/wine_pred"

echo "install requirements"
pip3 install -r ~/requirements.txt

echo "Create Hive Table"
python3 /home/cdsw/00_setup/create_hive_table.py