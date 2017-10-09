@set TOCR=C:\Tesseract-OCR\jTessBoxEditor\tesseract-ocr
@set ORIG=chi_sim
@set LANG=Test
@set FONT=CHei_PRC
@set HOME=.

%TOCR%\tesseract %HOME%\%LANG%.%FONT%.jpg %HOME%\%LANG%.%FONT% -l %ORIG% batch.nochop makebox
%TOCR%\tesseract %HOME%\%LANG%.%FONT%.jpg %HOME%\%LANG%.%FONT% nobatch box.train
%TOCR%\unicharset_extractor %HOME%\%LANG%.%FONT%.box
%TOCR%\shapeclustering -F %HOME%\%LANG%.font_properties -U %HOME%\unicharset %HOME%\%LANG%.%FONT%.tr
%TOCR%\mftraining -F %HOME%\%LANG%.font_properties -U unicharset -O %HOME%\%LANG%.unicharset %HOME%\%LANG%.%FONT%.tr
%TOCR%\cntraining %HOME%\%LANG%.%FONT%.tr
%TOCR%\combine_tessdata %LANG%

@move /Y %LANG%.traineddata %TESSDATA_PREFIX%\tessdata

@move /Y .\inttemp .\%LANG%.inttemp
@move /Y .\pffmtable .\%LANG%.pffmtable
@move /Y .\normproto .\%LANG%.normproto
@move /Y .\shapetable .\%LANG%.shapetable

@rem wordlist2dawg char_list %LANG%.word-dawg %LANG%.unicharset
@rem wordlist2dawg frequent_char_list %LANG%.freq-dawg %LANG%.unicharset

%TOCR%\tesseract --list-langs

pause
