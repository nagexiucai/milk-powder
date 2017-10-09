@set TOCR=C:\Tesseract-OCR\jTessBoxEditor\tesseract-ocr
@set LANG=Test
@set FONT=CHei_PRC
@set HOME=.

%TOCR%\tesseract %HOME%\%LANG%.%FONT%.jpg %HOME%\nutritional-ingredient.txt -l %LANG%

pause
