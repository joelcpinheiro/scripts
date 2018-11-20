@echo off
set dia=%date:~0,2%
set mes=%date:~3,2%
if %mes%==01 set mes=Janeiro
if %mes%==02 set mes=Fevereiro
if %mes%==03 set mes=Marco
if %mes%==04 set mes=Abrril
if %mes%==05 set mes=Maio
if %mes%==06 set mes=Junho
if %mes%==07 set mes=Julho
if %mes%==08 set mes=Agosto
if %mes%==09 set mes=Setembro
if %mes%==10 set mes=Outubro
if %mes%==11 set mes=Novembro
if %mes%==12 set mes=Dezembro
set ano=%date:~-4%

MD "\\caminhoremoto\%ano%\%mes%\%dia%"

@echo off
for %%a in (C:\pasta01,C:\pasta02,C:\pasta03) do xcopy %%a \\caminhoremoto\%ano%\%mes%\%dia% /E/Y/C/H/D
cls
pause
exit
