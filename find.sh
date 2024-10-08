#!/bin/bash

# Параметры для поиска
START_DATE="2024-06-01"  # Начало диапазона дат
END_DATE="2024-08-31"    # Конец диапазона дат
OUTPUT_FILE="file_list.txt"  # Файл для записи результата

# Очищаем файл вывода
> "$OUTPUT_FILE"

# Поиск файлов с "КП" или "кп" в названии и запись их в файл вывода
find /path/to/search -type f \( -iname "*.doc" -o -iname "*.docx" -o -iname "*.xls" -o -iname "*.xlsx" \) \
    -newermt "$START_DATE" ! -newermt "$END_DATE" \
    -iname "*КП*" -o -iname "*кп*" -print > "$OUTPUT_FILE"

# Подсчет количества файлов каждого типа
DOC_COUNT=$(grep -i ".doc$" "$OUTPUT_FILE" | wc -l)
DOCX_COUNT=$(grep -i ".docx$" "$OUTPUT_FILE" | wc -l)
XLS_COUNT=$(grep -i ".xls$" "$OUTPUT_FILE" | wc -l)
XLSX_COUNT=$(grep -i ".xlsx$" "$OUTPUT_FILE" | wc -l)

# Запись результатов подсчета в файл
echo "Счетчики файлов по форматам:" >> "$OUTPUT_FILE"
echo ".doc: $DOC_COUNT" >> "$OUTPUT_FILE"
echo ".docx: $DOCX_COUNT" >> "$OUTPUT_FILE"
echo ".xls: $XLS_COUNT" >> "$OUTPUT_FILE"
echo ".xlsx: $XLSX_COUNT" >> "$OUTPUT_FILE"

# Сообщение об окончании
echo "Поиск завершен. Результаты сохранены в $OUTPUT_FILE."
