git rebase --onto master BAC-9921-ms-catalog-update-symfony-http-foundation-to-fix-cve-2025-64500 GUSA-94285-catalog-ms-update-to-support-vertical-type-attribute
Что делает команда

--onto master → новые коммиты будут «приклеены» на master

BAC-9921… → Git берёт коммиты после этого коммита

GUSA-94285… → ветка, которую перебазируем

В результате GUSA-94285 будет родиться прямо от master, минуя BAC-9921.

посмотреть откуда создана ветка
git reflog show --date=iso