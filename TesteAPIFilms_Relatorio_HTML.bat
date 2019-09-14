@echo off
chcp 65001

cucumber --format html --out="./Reports/API/TesteAPIFilms.html" --tag @Teste_GET_Films
