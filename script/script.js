module.exports = async (tp) => {
  // ==== Создаём форму для ввода всех полей сразу ====
  const responses = await tp.system.prompt(
    `📌 Введите данные через | разделитель в следующем порядке:
1. Что было важно
2. Маленькая победа
3. Проблема или затык
4. Что попробуете изменить
5. Настрой (1–10)
6. Энергия (1–10)

Пример:
Сделал настройку Templater|Протестировал скрипт|Ошибка формы|Исправить блок|8|7`
  );

  // Разбиваем на отдельные поля
  let [important, win, problem, fix, mood, energy] = responses.split("|");

  if (!important) important = "";
  if (!win) win = "";
  if (!problem) problem = "";
  if (!fix) fix = "";
  if (!/^[1-9]$|^10$/.test(mood)) mood = "не указано";
  if (!/^[1-9]$|^10$/.test(energy)) energy = "не указано";

  // ==== Имя файла ====
  const date = tp.date.now("YYYY-MM-DD");
  const fileName = `Ежедневник-${date}.md`;
  const folderPath = "Ежедневник/";

  // ==== Контент файла ====
  const content = `---
дата: ${date}
важное: |
  ${important}
победа: ${win}
проблема: ${problem}
решение: ${fix}
настрой: ${mood}
энергия: ${energy}
---

## 📌 Что сегодня было важно
${important}

## 🚧 Проблема или затык
**Что случилось:**  
${problem}

**Что попробую изменить:**  
${fix}

## 🏆 Маленькая победа
${win}

## 📊 Состояние
Настрой: ${mood}  
Энергия: ${energy}
`;

  // ==== Создаём новый файл в папке Ежедневник ====
  await tp.file.create_new(folderPath + fileName, content);
};
