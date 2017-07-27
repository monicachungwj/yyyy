
:: 1. 設定參數
set ID=36585

set dd=%date:~8,2%
set dm=%date:~5,2%
set dy=%date:~0,4%
::set th=%time:~0,2%
::set tm=%time:~3,2%
::set mydate=%dy%%dm%%dd%%th%%tm%
set mydate=%dy%%dm%%dd%

d:
cd \

:: 2. 查看欲更新之zip檔內是否與文件說明符合
d:\util\7z l c:\temp\update-%ID%.zip

PAUSE

:: 3. 備份此次異動檔案(已將欲更新之檔案上傳至c:\temp)
d:\util\7z a -tzip c:\backup\%mydate%-%ID%.zip wwwroot\yyyy_rgn\WEB-INF\classes\com\emis\yyyy\Rgn2HappyGo_DataExchange.class
d:\util\7z a -tzip c:\backup\%mydate%-%ID%.zip wwwroot\yyyy_rgn\WEB-INF\classes\com\emis\yyyy\Rgn2HappyGo_RtnCheck.class
d:\util\7z a -tzip c:\backup\%mydate%-%ID%.zip wwwroot\yyyy_rgn\WEB-INF\classes\com\emis\yyyy\Run_POS2ERP.class

::列出目前此bug號的所有備份檔案
dir c:\backup\*-%ID%.zip

PAUSE

:: 4. 建立解壓之目的資料夾
mkdir c:\temp\update-%ID%

:: 5. 解壓縮
d:\util\7z x c:\temp\update-%ID%.zip -oc:\temp\update-%ID%

:: 6. 更新檔案
copy /y c:\temp\update-%ID%\wwwroot\yyyy_rgn\WEB-INF\classes\com\emis\yyyy\Rgn2HappyGo_DataExchange.class wwwroot\yyyy_rgn\WEB-INF\classes\com\emis\yyyy\Rgn2HappyGo_DataExchange.class
copy /y c:\temp\update-%ID%\wwwroot\yyyy_rgn\WEB-INF\classes\com\emis\yyyy\Rgn2HappyGo_RtnCheck.class wwwroot\yyyy_rgn\WEB-INF\classes\com\emis\yyyy\Rgn2HappyGo_RtnCheck.class
copy /y c:\temp\update-%ID%\wwwroot\yyyy_rgn\WEB-INF\classes\com\emis\yyyy\Run_POS2ERP.class wwwroot\yyyy_rgn\WEB-INF\classes\com\emis\yyyy\Run_POS2ERP.class

PAUSE

:: 7. 刪除解壓縮的資料夾
DEL c:\temp\update-%ID%


