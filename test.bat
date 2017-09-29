@echo "start training ..."

tesseract .\pictures\friso-bb3-cn-zh-s.normal.exp0.jpg .\pictures\friso-bb3-cn-zh-s.normal.exp0 nobatch box.train

unicharset_extractor .\pictures\friso-bb3-cn-zh-s.normal.exp0.box

shapeclustering -F .\font_properties -U .\pictures\friso-bb3-cn-zh-s.normal.exp0.tr

mftraining -F .\font_properties -U unicharset -O unicharset .\pictures\friso-bb3-cn-zh-s.normal.exp0.tr

cntraining .\pictures\friso-bb3-cn-zh-s.normal.exp0.tr

@echo "end training !"

pause
