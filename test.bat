@echo "start training ..."

tesseract .\pictures\chi_sim.CHei_PRC.exp0.jpg .\pictures\chi_sim.CHei_PRC.exp0 nobatch box.train

unicharset_extractor .\pictures\chi_sim.CHei_PRC.exp0.box

shapeclustering -F .\font_properties -U .\pictures\chi_sim.CHei_PRC.exp0.tr

mftraining -F .\font_properties -U unicharset -O chi_sim.unicharset .\pictures\chi_sim.CHei_PRC.exp0.tr

cntraining .\pictures\chi_sim.CHei_PRC.exp0.tr

@echo "end training !"

pause
