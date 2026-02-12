Enum - словарь. Словарь можно использовать методы которые потом можно использовать в таком духе:  **tryFrom** - Вернёт enum или **null**, если не найден и потом можно вынести label.

```
$gender = GenderEnum::tryFrom($videoTypeId);  
$videoTypeLabel = strtolower($gender ? $gender->label() : 'vertical');
```
