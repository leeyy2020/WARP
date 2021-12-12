for seed in 13 21 42 87 100
do
   str1='{
      "benchmark":"super_glue",
      "classifier_init":{
         "entailment":" yes",
         "contradiction":" no",
         "neutral":" maybe"
      },
      "dataset":"few_cb",
      "grad_norm":1,
      "lr":0.03,
      "max_batch_size":2,
      "max_tokens_sq":131072,
      "num_epochs":30,
      "num_gradient_accumulation_steps":2,
      "prompt_better_init":"[PAD]",
      "prompts":[-10,-11,[-14,"\""],null,[-15,"\""],[-16,"?"],"<mask>",[-20,","],null,[-29,"!"],-30,-31],
      "seed":'
   str2=',"str_cut_frac":0.06,
      "transformer_model":"albert-xxlarge-v2",
      "validation_metric":"+training_val_metric"
   }'

   DATASET=few_cb
   echo $str1$seed$str2
   export HPARAMS=$str1$seed$str2
   CUDA_VISIBLE_DEVICES=1 ./python3.7.0/bin/python3.7 -m allennlp train \
   -s .aim/few_cb/t-${DATASET}_seed_${seed} configs/warp.jsonnet
   rm -f .aim/few_cb/t-${DATASET}_seed_${seed}/model*
done
rm -rf .aim