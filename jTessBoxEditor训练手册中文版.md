# jTessBoxEditor #
是Tesseract-OCR的训练器兼Box编辑器，提供TOCRv2.0x和TOCRv3.0x格式的Box数据编辑及训练的全自动化。可以读取常规图像格式，包括multi-page TIFF。需要JREv7+。

## jTessBoxEditorFX ##
是jTessBoxEditor用JavaFX重写版的，用以处理在Swing中渲染复杂脚本存在的问题。需要JRE8u40+。

遵循ApacheLicenseV2.0发布。

需要提供TIFF/Box文件作为编辑器的输入。用于训练的图像应当是300DPI、1bpp黑白或8bpp灰度、未压缩的TIFF格式；Box文件需要时UTF-8编码，且是由Tesseract命令生成的。或者都可以用内建的TIFF/Box生成器创建。

需要注意的是，Box文件的系统坐标原点是左下角；然而计算机图形设备原点一般定义在左上角。jTessBoxEditor采用图形设备的显示坐标。编辑过的Box文件仍然按本身的格式读写。

内建生成器，对于给定的UTF-8文本文件输入，就产生一对适于用Tesseract训练的TIFF/Box文件。生成的图像是——依赖反锯齿模式打开——一个二进制或8bpp灰度、未压缩的300DPI分辨率的multi-page TIFF。可在图像中随意加入噪声，这能产生更好的训练数据。文字跟踪或字符间距的调整可以消除边界框重叠的问题。留意某些Box和Tesseract自己产生的稍有差别（一两个像素）；不过，生成的Box文件可以用来验证Tesseract用兼容Unicode的文件对比工具（[WinMerge][0]等）创建的Box文件。

提示：**实验表明，用TIFF/Box生成器创建的图像训练的质量，在字体大小为12pt或更大且添加某些噪声时更高**。

对于自动训练，确认构建好所有Tesseract的可执行程序（若有需要），Windows版本的jTessBoxEditor已经附带。纺织好所有需要的源训练数据文件，用适当的语言代码做前缀、在指定的目录；检查samples文件夹获取样例。也可以用powershell等Windwos脚本来做训练流程自动化。

Merge TIFF功能可以把多个包含相同字体文本的图像保存成单独的multi-page TIFF文件便于训练。

转换功能包括把数字字符参照（NCR）和字符文本域中的转义序列（escape sequence）转换成Unicode字符。

# 引用 #
[0]: http://sourceforge.net/projects/winmerge/ "WinMerge"