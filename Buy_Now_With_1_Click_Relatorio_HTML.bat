@echo off
chcp 65001

cucumber --format html --out="./Reports/WEB/Buy_Now_With_1_Click.html" --tag @Buy_Now_With_1Click
