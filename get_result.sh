result=$1

grep "allennlp.training.tensorboard_writer - accuracy" $result > result_log

cat result_log | python get_result.py