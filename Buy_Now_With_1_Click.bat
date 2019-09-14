@echo off
chcp 65001

cucumber --format json --out="./Reports/Buy_Now_With_1_Click.json" --tag @Buy_Now_With_1Click
