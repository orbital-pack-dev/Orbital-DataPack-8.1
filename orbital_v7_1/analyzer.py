import os

def analyze_project():
    # Определение абсолютных путей для исключения файлов из статистики
    script_path = os.path.abspath(__file__)
    root_dir = os.path.dirname(script_path)
    report_path = os.path.join(root_dir, "project_report.md")

    total_folders = 0
    total_files = 0
    total_lines = 0
    total_chars = 0

    # Рекурсивный обход структуры директорий
    for root, dirs, files in os.walk(root_dir):
        total_folders += len(dirs)

        for file in files:
            file_path = os.path.abspath(os.path.join(root, file))

            # Исключение самого скрипта и генерируемого отчета
            if file_path == script_path or file_path == os.path.abspath(report_path):
                continue

            total_files += 1

            try:
                # Чтение в текстовом режиме с защитой от бинарных данных
                with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                    content = f.read()
                    total_chars += len(content)
                    if content:
                        total_lines += len(content.splitlines())
            except Exception:
                # Пропуск заблокированных или системных файлов
                pass

    # Генерация содержимого Markdown-файла
    report_content = (
        f"# Отчет по структуре проекта: {os.path.basename(root_dir)}\n\n"
        f"## Сводные метрики\n\n"
        f"- **Всего папок:** {total_folders}\n"
        f"- **Всего файлов:** {total_files}\n"
        f"- **Всего строк кода:** {total_lines}\n"
        f"- **Всего символов:** {total_chars}\n"
    )

    try:
        with open(report_path, 'w', encoding='utf-8') as rf:
            rf.write(report_content)
        print("Анализ завершен. Результаты записаны в project_report.md")
    except Exception as e:
        print(f"Не удалось сохранить отчет: {e}")

if __name__ == "__main__":
    analyze_project()