При работе с **PhpMetrics** важно концентрироваться на тех метриках, которые реально показывают сложность, поддерживаемость и архитектурные проблемы. Ниже приведены ключевые показатели и их чёткие профессиональные интерпретации.

---

# 🔍 Основные метрики PhpMetrics и их значение

## 1. **Cyclomatic Complexity (CCN) – цикломатическая сложность**

**Что показывает:** количество независимых путей выполнения (if, foreach, while, case и т.д.)

**Как интерпретировать:**

- 1–5 — нормально
    
- 6–10 — требует внимательности
    
- 10–15 — затруднительно тестировать
    
- > 15 — срочно рефакторить (too complex)
    

**Почему важно:** чем выше CCN, тем труднее писать тесты и находить ошибки.

---

## 2. **Maintainability Index (MI) – индекс поддерживаемости**

Комплексный показатель, учитывающий CCN, размер файла и структурные параметры.

**Диапазоны:**

- 20–100 — хорошо
    
- < 20 — поддержка крайне сложна
    
- < 10 — код требует немедленной переработки
    

**Зачем нужен:** помогает понять "общий уровень здоровья" файла.

---

## 3. **Depth of Inheritance Tree (DIT) – глубина наследования**

**Что показывает:** сколько уровней наследования у класса.

**Интерпретация:**

- 1–3 — норма
    
- 4–5 — сложно
    
- > 5 — архитектурная проблема
    

**Почему важно:** глубокая иерархия ухудшает читаемость и повышает связанность.

---

## 4. **Coupling Between Objects (CBO) – связность**

**Что показывает:** сколько других классов использует данный класс.

**Рекомендуемые значения:**

- < 10 — хорошо
    
- 10–20 — большое количество зависимостей
    
- > 20 — плохая архитектура (god object / dependency hell)
    

**Почему важно:** высокий CBO усложняет поддержку и тестирование.

---

## 5. **LLOC (Logical Lines of Code) – логические строки кода**

Логические строки, без пустых и комментариев.

**Правила:**

- < 200 в классе — хорошо
    
- > 500 — слишком много
    
- > 1000 — признак "god class"
    

---

## 6. **Bugs / Defects Density Estimate – потенциальные ошибки**

Примерная оценка на основании сложности кода.

**Высокое значение означает:**

- Большое количество вариантов выполнения
    
- Высокая вероятность скрытых дефектов
    

---

## 7. **Lack of Cohesion of Methods (LCOM) – связность методов**

**Что показывает:** насколько методы класса связаны друг с другом.

**Интерпретация:**

- 0–0.3 — отлично
    
- 0.3–0.7 — допустимо
    
- > 0.7 — методы «живут своей жизнью» → класс нужно дробить
    

---

## 8. **Afferent Coupling (Ca) – входящая связность**

Сколько классов **зависят** от текущего.

**Значения:**

- Высокий Ca → класс критичен для системы
    
- Низкий Ca → изолированный компонент
    

**Почему важно:** высокое значение — любая ошибка создаёт каскадную проблему.

---

## 9. **Efferent Coupling (Ce) – исходящая связность**

Сколько классов **использует** текущий класс.

- Высокий Ce → много зависимостей → тяжело тестировать
    
- Низкий Ce → хорошая изоляция
    

---

## 10. **Instability (I)**

Формула: `I = Ce / (Ca + Ce)`

**Показывает:**

- 0 — стабильный (от него зависят)
    
- 1 — нестабильный (много зависимостей)
    

Оптимально → в середине (0.3–0.7)

---

# 🗺 Комплексные отчёты PhpMetrics

## Heatmap

Показывает файлы, где **сложность × размер** превышает допустимые нормы.

Красные квадраты → обязательный рефакторинг.

---

## Abstractness vs Instability диаграмма (A/I Graph)

Помогает обнаружить:

- **The Zone of Pain** (низкая абстрактность, высокая стабильность) — хардкод
    
- **The Zone of Uselessness** (слишком абстрактно, но никто не использует)
    

---

# 📌 На что смотреть в первую очередь?

1. **CCN > 10**
    
2. **MI < 20**
    
3. **DIT > 4**
    
4. **CBO > 20**
    
5. **LCOM > 0.7**
    
6. Красные файлы на heatmap
    
7. Сильные отклонения на A/I графике
    

---
-Xmx4096m
-XX:JbrShrinkingGcMaxHeapFreeRatio=40
-XX:+UseLargePages
-XX:LargePageSizeInBytes=2m
-XX:+UseTransparentHugePages
-XX:+UseG1GC
-XX:MaxGCPauseMillis=200
-XX:InitiatingHeapOccupancyPercent=45
-XX:G1HeapRegionSize=16m
-XX:ReservedCodeCacheSize=512m
-XX:InitialCodeCacheSize=256m
-XX:CICompilerCount=2
-XX:+AlwaysPreTouch
-XX:+HeapDumpOnOutOfMemoryError
-XX:-OmitStackTraceInFastThrow
-XX:+UnlockDiagnosticVMOptions
-XX:+IgnoreUnrecognizedVMOptions
-ea
-Dsun.io.useCanonCaches=false
-Dsun.java2d.opengl=false
-Dsun.java2d.uiScale.enabled=false 
-Dsun.java2d.metal=true
-Djbr.catch.SIGABRT=true
-Djdk.tls.client.protocols=TLSv1.3
-Djdk.attach.allowAttachSelf=true
-Djdk.module.illegalAccess.silent=true
-Dkotlinx.coroutines.debug=off
-Djava.util.zip.use.nio.for.zip.file.access=true
-Dsun.tools.attach.tmp.only=true
-Dawt.lock.fair=true
-Didea.max.intellisense.filesize=2500
-Didea.max.content.load.size=50m
-Dsun.net.spi.nameservice.nameservers=10.254.254.1,8.8.8.8
-Dsun.net.spi.nameservice.provider.1=dns,sun