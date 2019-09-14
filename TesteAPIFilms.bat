@echo off
chcp 65001

cucumber --format json --out="./Reports/TesteAPIFilms.json" --tag @Teste_GET_Films
